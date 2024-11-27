import 'package:flutter/material.dart';

class CityDetailPage extends StatelessWidget {
  const CityDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('市区町村詳細'),
      ),
      body: const Center(
        child: Text('市区町村詳細画面です'),
      ),
    );
  }
}
