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
        backgroundColor: greenColor,
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
              backgroundImage: AssetImage('assets/ican.png'),
            ),
            const SizedBox(height: 20),
            Text(
              'Muhammad Auwalli Ikhsani',
              style: regularTextStyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '123190127 IF E',
              style: regularTextStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Cita-cita:',
              style: regularTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Bahagia dunia',
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
              'Saya sangat senang bisa mengikuti mata kuliah ini, karena saya bisa belajar banyak hal baru.',
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
              'Bismillah, semoga saya bisa lulus dengan nilai yang memuaskan.',
              style: regularTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
