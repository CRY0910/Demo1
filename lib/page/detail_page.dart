import 'package:flutter/material.dart';

import '../data/CurrencyInfo.dart';

class DetailPage extends StatelessWidget {

  const DetailPage({super.key, required this.currencyInfo});

  // Declare a field that holds the Todo.
  final CurrencyInfo currencyInfo;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(currencyInfo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(currencyInfo.price),
      ),
    );
  }
  }