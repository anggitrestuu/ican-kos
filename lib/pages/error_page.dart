import 'package:bwa_cozy/pages/home_page.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            bottom: false,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(
                child: Image.asset(
                  'assets/images/error-404.png',
                  width: 300,
                ),
              ),
              const SizedBox(height: 70),
              Text(
                'Where are you going?',
                textAlign: TextAlign.center,
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 14),
              Text(
                'Seems like the page that you were\nrequested is already gone',
                textAlign: TextAlign.center,
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 210,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                          (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: greenColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17))),
                    child: Text('Back to Home',
                        style: whiteTextStyle.copyWith(fontSize: 18))),
              )
            ])));
  }
}
