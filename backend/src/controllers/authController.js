const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const supabase = require('../config/supabase');

// --- FITUR REGISTER USER MOBILE ---
const registerUser = async (req, res) => {
    const { username, password, email, no_id, blood_type, rhesus, pmi_branch_id } = req.body;

    try {
        // 1. Enkripsi (Hash) Password
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(password, salt);

        // 2. Simpan ke database Supabase
        const { data, error } = await supabase
            .from('users')
            .insert([
                {
                    username,
                    password_hash: hashedPassword,
                    email,
                    no_id,
                    blood_type,
                    rhesus,
                    pmi_branch_id
                }
            ])
            .select();

        if (error) throw error;

        res.status(201).json({
            success: true,
            message: 'Registrasi berhasil!',
            data: data[0]
        });

    } catch (error) {
        res.status(400).json({ success: false, message: error.message });
    }
};

// --- FITUR LOGIN (USER & ADMIN) ---
const login = async (req, res) => {
    const { username, password, role } = req.body; 
    // role diset 'USER' atau 'ADMIN' dari frontend

    try {
        let tableName = role === 'ADMIN' ? 'admins' : 'users';

        // 1. Cari user/admin di database
        const { data, error } = await supabase
            .from(tableName)
            .select('*')
            .eq('username', username)
            .single();

        if (error || !data) {
            return res.status(401).json({ success: false, message: 'Username tidak ditemukan' });
        }

        // 2. Cek kecocokan password
        const isMatch = await bcrypt.compare(password, data.password_hash);
        if (!isMatch) {
            return res.status(401).json({ success: false, message: 'Password salah' });
        }

        // 3. Buat JWT Token (Bisa ditaruh di .env nantinya untuk secret key-nya)
        const token = jwt.sign(
            { id: data.id, role: role, branch_id: data.pmi_branch_id }, 
            process.env.JWT_SECRET || 'rahasia_setetes_super_aman', 
            { expiresIn: '7d' }
        );

        res.json({
            success: true,
            message: 'Login berhasil!',
            token,
            data: { id: data.id, username: data.username, branch_id: data.pmi_branch_id }
        });

    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

module.exports = { registerUser, login };