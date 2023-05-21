import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeConversion extends StatefulWidget {
  const TimeConversion({Key? key}) : super(key: key);

  @override
  _TimeConversionState createState() => _TimeConversionState();
}

class _TimeConversionState extends State<TimeConversion> {
  List<String> listWaktuBagian = <String>['WIB', 'WITA', 'WIT', 'UTC', 'JST'];
  late String waktuBagianAwal = listWaktuBagian.first;
  late String waktuBagianTujuan = listWaktuBagian.first;
  late String waktuAwalString;
  late String waktuTujuanString;
  late Timer timer;

  @override
  void initState() {
    waktuAwalString = _formatDateTime(DateTime.now());
    waktuTujuanString = waktuAwalString;
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pilih Waktu',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: StreamBuilder<Object>(
                    stream: Stream.periodic(const Duration(seconds: 1), (i) => i),
                    builder: (context, snapshot) {
                      return Text(
                        _formatDateTime(DateTime.now()),
                        style: const TextStyle(fontSize: 25, fontFamily: 'Poppins'),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: DropdownButton<String>(
                    underline: Container(),
                    value: waktuBagianAwal,
                    elevation: 16,
                    onChanged: (String? value) {
                      setState(() {
                        waktuBagianAwal = value!;
                        _updateWaktuTujuan();
                      });
                    },
                    items: listWaktuBagian
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            fontSize: 25,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      waktuTujuanString,
                      key: ValueKey<String>(waktuTujuanString),
                      style: const TextStyle(fontSize: 25, fontFamily: 'Poppins'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: DropdownButton<String>(
                    underline: Container(),
                    value: waktuBagianTujuan,
                    elevation: 16,
                    onChanged: (String? value) {
                      setState(() {
                        waktuBagianTujuan = value!;
                        _updateWaktuTujuan();
                      });
                    },
                    items: listWaktuBagian
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            fontSize: 25,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      waktuAwalString = formattedDateTime;
    });
  }

  void _updateWaktuTujuan() {
    final DateTime waktuAwal = DateTime.now();
    DateTime waktuTujuan;

    switch (waktuBagianTujuan) {
      case 'WITA':
        waktuTujuan = waktuAwal.subtract(const Duration(hours: 1));
        break;
      case 'WIT':
        waktuTujuan = waktuAwal.subtract(const Duration(hours: 2));
        break;
      case 'UTC':
        waktuTujuan = waktuAwal.toUtc();
        break;
      case 'JST':
        waktuTujuan = waktuAwal.toUtc().add(const Duration(hours: 9));
        break;
      default:
        waktuTujuan = waktuAwal;
    }

    final String formattedDateTime = _formatDateTime(waktuTujuan);
    setState(() {
      waktuTujuanString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy kk:mm:ss').format(dateTime);
  }
}
