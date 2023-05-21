import 'package:flutter/material.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class MoneyConversion extends StatefulWidget {
  const MoneyConversion({Key? key}) : super(key: key);

  @override
  State<MoneyConversion> createState() => _MoneyConversionState();
}

class _MoneyConversionState extends State<MoneyConversion> {
  ConversionType _conversionType = ConversionType.currency;
  double _amount = 0.0;
  double _result = 0.0;
  String _sourceCurrency = 'IDR';
  String _targetCurrency = 'USD';
  final _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        _amount = double.tryParse(_textEditingController.text) ?? 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Currency Converter',
          style: whiteTextStyle,
        ),
        backgroundColor: purpleColor,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
                labelStyle: blackTextStyle,
              ),
              keyboardType: TextInputType.number,
              controller: _textEditingController,
              onChanged: (value) {
                setState(() {
                  _amount = double.tryParse(value) ?? 0.0;
                  _result =
                      convertCurrency(_amount, _sourceCurrency, _targetCurrency);
                });
              },
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: _sourceCurrency,
                  items: currencies
                      .map((currency) => DropdownMenuItem<String>(
                    value: currency,
                    child: Text(
                      currency,
                      style: blackTextStyle,
                    ),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _sourceCurrency = value ?? 'USD';
                      _result = convertCurrency(
                          _amount, _sourceCurrency, _targetCurrency);
                    });
                  },
                ),
                const Text(
                  'to',

                ),
                DropdownButton<String>(
                  value: _targetCurrency,
                  items: currencies
                      .map((currency) => DropdownMenuItem<String>(
                    value: currency,
                    child: Text(
                      currency,
                      style: blackTextStyle,
                    ),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _targetCurrency = value ?? 'EUR';
                      _result = convertCurrency(
                          _amount, _sourceCurrency, _targetCurrency);
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              '$_amount $_sourceCurrency = $_result $_targetCurrency',
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  double convertCurrency(
      double amount, String fromCurrency, String toCurrency) {
    final rates = {
      'USD': 1,
      'IDR': 14823,
      'EUR': 0.92,
      'GBP': 0.80,
      'CAD': 1.21,
      'BTC': 0.000037,
    };
    final sourceRate = rates[fromCurrency] ?? 1.0;
    final targetRate = rates[toCurrency] ?? 1.0;
    final exchangeRate = targetRate / sourceRate;
    return amount * exchangeRate;
  }
}

enum ConversionType { currency }

const List<String> currencies = ['IDR', 'USD', 'EUR', 'GBP', 'CAD', 'BTC'];

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: blackColor,
  fontWeight: FontWeight.w500,
);


