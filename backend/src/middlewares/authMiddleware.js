const jwt = require('jsonwebtoken');

const verifyToken = (req, res, next) => {
    // Mengambil token dari header 'Authorization'
    const authHeader = req.headers['authorization'];
    
    // Format standar token adalah "Bearer <token>"
    const token = authHeader && authHeader.split(' ')[1];

    if (!token) {
        return res.status(403).json({ 
            success: false, 
            message: 'Akses ditolak! Token tidak ditemukan, silakan login.' 
        });
    }

    try {
        // Verifikasi token menggunakan secret key yang sama saat login
        const decoded = jwt.verify(token, process.env.JWT_SECRET || 'rahasia_setetes_super_aman');
        
        // Menyimpan data user dari token ke dalam request untuk dipakai di controller
        req.user = decoded;
        
        // Lanjut ke proses berikutnya (controller)
        next();
    } catch (error) {
        return res.status(401).json({ 
            success: false, 
            message: 'Token tidak valid atau sudah kedaluwarsa!' 
        });
    }
};

// Middleware tambahan khusus untuk ngecek apakah yang login adalah ADMIN
const verifyAdmin = (req, res, next) => {
    if (req.user && req.user.role === 'ADMIN') {
        next();
    } else {
        return res.status(403).json({ 
            success: false, 
            message: 'Akses ditolak! Hanya Admin yang bisa mengakses fitur ini.' 
        });
    }
};

module.exports = { verifyToken, verifyAdmin };