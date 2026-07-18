const express = require('express');
const router = express.Router();
const { registerUser, login } = require('../controllers/authController');

// Endpoint untuk Register
router.post('/register', registerUser);

// Endpoint untuk Login
router.post('/login', login);

module.exports = router;