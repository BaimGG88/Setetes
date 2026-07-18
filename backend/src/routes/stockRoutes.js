const express = require('express');
const router = express.Router();
const { getBranchStock, getProvinceStock, updateStock } = require('../controllers/stockController');
const { verifyToken, verifyAdmin } = require('../middlewares/authMiddleware'); // Import satpamnya

// Public API (Siapa saja bisa lihat stok)
router.get('/province', getProvinceStock);
router.get('/', getBranchStock);

// Protected API (Harus login DAN wajib Admin)
router.put('/', verifyToken, verifyAdmin, updateStock);

module.exports = router;