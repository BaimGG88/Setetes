const supabase = require('../config/supabase');

// --- GET: LIHAT STOK UTD SENDIRI ---
const getBranchStock = async (req, res) => {
    // Mengambil ID cabang dari parameter URL (misal: /api/stocks?branch_id=123)
    const { branch_id } = req.query;

    if (!branch_id) {
        return res.status(400).json({ success: false, message: 'branch_id diperlukan' });
    }

    try {
        const { data, error } = await supabase
            .from('blood_stocks')
            .select('blood_type, rhesus, quantity, last_updated')
            .eq('pmi_branch_id', branch_id);

        if (error) throw error;

        res.status(200).json({ success: true, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// --- GET: LIHAT STOK 1 PROVINSI DIY ---
const getProvinceStock = async (req, res) => {
    try {
        // Melakukan join tabel untuk mendapatkan nama cabang dan kotanya sekalian
        const { data, error } = await supabase
            .from('blood_stocks')
            .select(`
                blood_type, 
                rhesus, 
                quantity, 
                last_updated,
                pmi_branches ( name, city )
            `);

        if (error) throw error;

        res.status(200).json({ success: true, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// --- PUT: UPDATE STOK DARAH (UNTUK ADMIN) ---
const updateStock = async (req, res) => {
    const { branch_id, blood_type, rhesus, quantity } = req.body;

    try {
        // Menggunakan upsert: update jika kombinasi branch, blood_type, rhesus sudah ada, insert jika belum
        const { data, error } = await supabase
            .from('blood_stocks')
            .upsert({
                pmi_branch_id: branch_id,
                blood_type,
                rhesus,
                quantity,
                last_updated: new Date().toISOString()
            }, { onConflict: 'pmi_branch_id, blood_type, rhesus' })
            .select();

        if (error) throw error;

        res.status(200).json({
            success: true,
            message: 'Stok darah berhasil diperbarui!',
            data: data[0]
        });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

module.exports = { getBranchStock, getProvinceStock, updateStock };