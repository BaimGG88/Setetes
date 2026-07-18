import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Warna dari referensi Color Palette Figma kamu
  final Color pmiRed = const Color(0xFFE20A16);
  final Color pmiLightRed = const Color(0xFFEB535C);
  final Color pmiPink = const Color(0xFFFDE7E8);
  final Color pmiDarkBlue = const Color(0xFF004287);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      // --- APP BAR (Sesuai Desain: Kiri Logo, Kanan Profil Merah) ---
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset(
            'assets/images/pmi_logo.jpg',
            height: 40,
          ),
        ),
        actions: [
          Container(
            width: 70,
            decoration: BoxDecoration(
              color: pmiLightRed,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: IconButton(
              icon: const Icon(Icons.account_circle, color: Colors.white, size: 36),
              onPressed: () {
                // Nanti navigasi ke halaman profil
              },
            ),
          ),
        ],
      ),

      // --- BODY (Scrollable) ---
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Pernak-pernik: Banner News / Edukasi
              _buildNewsBanner(),
              const SizedBox(height: 24),

              // --- SEGMEN STOK DARAH LOKAL (BANTUL) ---
              Text(
                'PMI KABUPATEN BANTUL',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: pmiDarkBlue,
                ),
              ),
              const SizedBox(height: 12),
              
              // Custom Widget Table Stok Darah
              _buildLocalStockCard(),
              const SizedBox(height: 8),
              
              Text(
                'Update Pukul: 08:00 WIB',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 32),

              // --- SEGMEN STOK DARAH PROVINSI (DIY) ---
              Text(
                'INFO STOK DARAH\nPMI SE-DAERAH ISTIMEWA YOGYAKARTA',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: pmiDarkBlue,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 12),
              
              _buildProvinceStockTable(),
              const SizedBox(height: 32),

              // --- SEGMEN GRID MENU FITUR ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildMenuButton(Icons.directions_bus, 'Jadwal\nMobile'),
                  _buildMenuButton(Icons.bloodtype, 'Minta\nDarah'),
                  _buildMenuButton(Icons.health_and_safety, 'Setetes\nSehat'),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGET HELPER: BANNER NEWS ---
  Widget _buildNewsBanner() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: pmiPink,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: pmiLightRed.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Icon(Icons.campaign, color: pmiRed, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Info Kesiapsiagaan Bencana',
                  style: TextStyle(fontWeight: FontWeight.bold, color: pmiDarkBlue),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Mari tingkatkan kewaspadaan dan stok darah menyusul momen peringatan 20 Tahun Gempa Jogja bulan Mei lalu.',
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGET HELPER: TABEL STOK LOKAL ---
  Widget _buildLocalStockCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [Colors.white, pmiPink.withOpacity(0.3)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const Text(
              'INFORMASI STOK DARAH',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFE20A16)),
            ),
            const SizedBox(height: 16),
            
            // Header Tabel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTableHeader('Gol'),
                _buildTableHeader('WB', bgColor: Colors.red[900]),
                _buildTableHeader('PRC', bgColor: Colors.orange[800]),
                _buildTableHeader('TC', bgColor: Colors.lightGreen[600]),
              ],
            ),
            const Divider(thickness: 2),
            
            // Isi Tabel (Dummy Data)
            _buildTableRow('A', '10', '81', '4'),
            _buildTableRow('B', '10', '119', '2'),
            _buildTableRow('O', '10', '171', '5'),
            _buildTableRow('AB', '5', '15', '0'),
          ],
        ),
      ),
    );
  }

  Widget _buildTableHeader(String text, {Color? bgColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: bgColor != null ? Colors.white : pmiDarkBlue,
        ),
      ),
    );
  }

  Widget _buildTableRow(String gol, String wb, String prc, String tc) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(gol, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: pmiDarkBlue)),
          Text(wb, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(prc, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(tc, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  // --- WIDGET HELPER: TABEL PROVINSI (Scroll Horizontal) ---
  Widget _buildProvinceStockTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Card(
        elevation: 2,
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(pmiLightRed),
          headingTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          columns: const [
            DataColumn(label: Text('UTD Kab/Kota')),
            DataColumn(label: Text('Gol A (WB/PRC)')),
            DataColumn(label: Text('Gol B (WB/PRC)')),
            DataColumn(label: Text('Gol O (WB/PRC)')),
            DataColumn(label: Text('Gol AB (WB/PRC)')),
          ],
          rows: const [
            DataRow(cells: [
              DataCell(Text('Bantul', style: TextStyle(fontWeight: FontWeight.bold))),
              DataCell(Text('10 / 83')),
              DataCell(Text('10 / 121')),
              DataCell(Text('10 / 160')),
              DataCell(Text('5 / 15')),
            ]),
            DataRow(cells: [
              DataCell(Text('Sleman')),
              DataCell(Text('3 / 55')),
              DataCell(Text('3 / 42')),
              DataCell(Text('3 / 105')),
              DataCell(Text('2 / 24')),
            ]),
            // Tambahkan kota lain nanti di sini
          ],
        ),
      ),
    );
  }

  // --- WIDGET HELPER: TOMBOL MENU BAWAH ---
  Widget _buildMenuButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: pmiLightRed,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: pmiLightRed.withOpacity(0.4),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 36),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: pmiDarkBlue,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}