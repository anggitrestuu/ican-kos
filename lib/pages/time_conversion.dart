import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:bwa_cozy/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeConversion extends StatefulWidget {
  const TimeConversion({Key? key}) : super(key: key);

  @override
  State<TimeConversion> createState() => _TimeConversionState();
}

class _TimeConversionState extends State<TimeConversion> {
  String _targetTimezone = 'WIT';
  DateTime _sourceDateTime = DateTime.now();
  DateTime _targetDateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        _sourceDateTime = DateTime.now();
        convertTimezone(_sourceDateTime, _targetTimezone);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Konversi Waktu',
          style: whiteTextStyle,
        ),
        backgroundColor: greenColor,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Waktu Lokal',
                  style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  dateFormat.format(_sourceDateTime),
                  style: blackTextStyle.copyWith(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Target Timezone',
                  style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                DropdownButton<String>(
                  value: _targetTimezone,
                  items: _getTimezoneDropdownItems(),
                  onChanged: (value) {
                    setState(() {
                      _targetTimezone = value ?? 'WIT';
                      convertTimezone(_sourceDateTime, _targetTimezone);
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Waktu Target',
                  style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  dateFormat.format(_targetDateTime),
                  style: blackTextStyle.copyWith(fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _getTimezoneDropdownItems() {
    final timezones = ['WIB', 'WITA', 'WIT', 'London', 'New York', 'Tokyo'];

    return timezones
        .map(
          (timezone) => DropdownMenuItem<String>(
            value: timezone,
            child: Text(
              timezone,
              style: blackTextStyle,
            ),
          ),
        )
        .toList();
  }

  void convertTimezone(DateTime dateTime, String targetTimezone) {
    final targetTime = getTimezoneOffset(targetTimezone);
    _targetDateTime =
        dateTime.add(targetTime).subtract(DateTime.now().timeZoneOffset);
  }

  Duration getTimezoneOffset(String timezone) {
    switch (timezone) {
      case 'WIB':
        return const Duration(hours: 7);
      case 'WIT':
        return const Duration(hours: 9);
      case 'WITA':
        return const Duration(hours: 8);
      case 'London':
        return Duration.zero;
      case 'New York':
        return const Duration(hours: -4);
      case 'Tokyo':
        return const Duration(hours: 9);
      default:
        return Duration.zero;
    }
  }

  @override
  void dispose() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      timer.cancel();
    });
    super.dispose();
  }
}
