const express = require('express');
const router = express.Router();
const { getMobileSchedules, submitAssessment, submitBloodRequest } = require('../controllers/donorController');
const { verifyToken } = require('../middlewares/authMiddleware'); // Import satpamnya

// Public API (Siapa saja bisa lihat jadwal)
router.get('/schedules', getMobileSchedules);

// Protected API (User wajib login untuk submit data ini)
router.post('/assessments', verifyToken, submitAssessment);
router.post('/requests', verifyToken, submitBloodRequest);

module.exports = router;