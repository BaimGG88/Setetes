require('dotenv').config();
const express = require('express');
const cors = require('cors');

const app = express();

// Middleware
app.use(cors()); // Mengizinkan request dari frontend/mobile app
app.use(express.json()); // Memastikan backend bisa membaca body request berformat JSON

// Basic Route untuk memastikan server berjalan
app.get('/', (req, res) => {
    res.json({ 
        success: true, 
        message: 'Welcome to Setetes API! Server is up and running.' 
    });
});

// Hapus baris komentar sebelumnya, dan ganti dengan ini:
const authRoutes = require('./src/routes/authRoutes');
app.use('/api/auth', authRoutes);

const stockRoutes = require('./src/routes/stockRoutes');
app.use('/api/stocks', stockRoutes);

const donorRoutes = require('./src/routes/donorRoutes');
app.use('/api/donor', donorRoutes);

// Menjalankan Server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`[SERVER] API Setetes berjalan di http://localhost:${PORT}`);
});