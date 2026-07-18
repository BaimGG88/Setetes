const { createClient } = require('@supabase/supabase-js');
require('dotenv').config();

// Mengambil URL dan Key dari file .env
const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_KEY;

// Membuat instance koneksi Supabase
const supabase = createClient(supabaseUrl, supabaseKey);

module.exports = supabase;