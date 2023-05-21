import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle regularTextStyle = GoogleFonts.poppins(
  color: blackColor,
  fontWeight: FontWeight.w400,
);

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: whiteTextStyle,
        ),
        backgroundColor: purpleColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/noviamanda.jpeg'),
            ),
            const SizedBox(height: 20),
            Text(
              'Novi Amanda Puspita Sari',
              style: regularTextStyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '123200065-TPM A',
              style: regularTextStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Cita-cita:',
              style: regularTextStyle.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Hidup tentram dan damai',
              style: regularTextStyle.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              'Kesan:',
              style: regularTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Sangat menantang, banyak tugas dan keren sih. Harus pinter-pinter bagi waktu aja. Jujur saya blank waktu quiz, OMG gakuad.',
              style: regularTextStyle.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              'Pesan:',
              style: regularTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Semoga kedepannya bisa lebih proaktif mahasiswanya, dan lebih dalam konsep pengajaran untuk teorinya.',
              style: regularTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
