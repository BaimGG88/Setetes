import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controller untuk masing-masing input
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _noHpController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _kotaController = TextEditingController();
  
  bool _isLoading = false;

  void _register() {
    // TODO: Logika untuk menembak API Register Node.js akan ditaruh di sini
    print("Tombol Register ditekan!");
    print("Nama: ${_namaController.text}");
    print("Kota Asal: ${_kotaController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // --- BACKGROUND DEKORASI (Simulasi Gelombang Merah) ---
          Positioned(
            top: -60,
            left: -40,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: const Color(0xFFE53935).withOpacity(0.8),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -80,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: const Color(0xFFE53935).withOpacity(0.7),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xFFEF5350).withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // --- KONTEN UTAMA ---
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Column(
                children: [
                  // Tombol Back (Kembali ke halaman Login)
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Color(0xFF0D47A1), size: 30),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(height: 10),
                  
                  // Teks Judul
                  const Text(
                    'Register New Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D47A1), // Warna Biru Gelap
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // Form Input (Memanggil fungsi helper di bawah agar kode lebih rapi)
                  _buildTextField(_namaController, 'Nama...'),
                  const SizedBox(height: 16),
                  
                  _buildTextField(_noHpController, 'No Hp', isNumber: true),
                  const SizedBox(height: 16),
                  
                  _buildTextField(_emailController, 'Email', isEmail: true),
                  const SizedBox(height: 16),
                  
                  _buildTextField(_passwordController, 'Password', isPassword: true),
                  const SizedBox(height: 16),
                  
                  _buildTextField(_kotaController, 'Kota Asal'),
                  const SizedBox(height: 40),
                  
                  // Tombol Register
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _register,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'REGISTER',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGET HELPER ---
  // Dibuat agar kita tidak perlu menulis ulang desain kotak TextField yang sama berulang kali
  Widget _buildTextField(TextEditingController controller, String hint, {bool isPassword = false, bool isEmail = false, bool isNumber = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: isNumber ? TextInputType.phone : (isEmail ? TextInputType.emailAddress : TextInputType.text),
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0D47A1),
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0D47A1),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), // Sedikit membulat tapi tetap kotak sesuai desain
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
    );
  }
}