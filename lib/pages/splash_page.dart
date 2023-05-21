import 'login_page.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('assets/images/splash_image.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text('Find Cozy House to\nStay and Happy',
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Stop membuang banyak waktu\npada tempat yang tidak habitable',
                        style: greyTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: 210,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: greenColor,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(17)))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ));
                          },
                          child: Text(
                            'Explore Now',
                            style: whiteTextStyle.copyWith(fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )));
  }
}
