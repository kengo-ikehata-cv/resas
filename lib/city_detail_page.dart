import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:myapp/annual_municipality_tax.dart';
import 'env.dart';
import 'dart:convert';
import 'package:myapp/city.dart';

class CityDetailPage extends StatefulWidget {
  const CityDetailPage({
    super.key,
    required this.city,
  });

  final City city;

  @override
  State<CityDetailPage> createState() => _CityDetailPageState();
}

class _CityDetailPageState extends State<CityDetailPage> {
  late Future<String> _future;

  @override
  void initState() {
    super.initState();
    // APIからデータを取得する処理
    const host = 'opendata.resas-portal.go.jp';
    // 一人当たりの地方税を取得するエンドポイントを指定します
    const endopoint = 'api/v1/municipality/taxes/perYear';
    final headers = {'X-API-KEY': Env.resasApiKey};
    final param = {
      'prefCode': widget.city.prefCode.toString(),
      'cityCode': widget.city.cityCode,
    };
    _future = http
        .get(Uri.https(host, endopoint, param), headers: headers)
        .then((res) => res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.city.cityName),
      ),
      body: FutureBuilder<String>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final result =
              jsonDecode(snapshot.data!)['result'] as Map<String, dynamic>;
          final data = result['data'] as List;
          final items = data.cast<Map<String, dynamic>>();
          final taxes = items.map(AnnualMunicipalityTax.fromJson).toList();

          return ListView.separated(
            itemCount: taxes.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final tax = taxes[index];
              return ListTile(
                title: Text('${tax.year}年'),
                trailing: Text(
                  _formatTaxLabel(tax.value),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            },
          );
        },
      ),
    );
  }

  // 千円単位の税金を表示するためのフォーマットを行います
  String _formatTaxLabel(int value) {
    final formatted = NumberFormat('#,###').format(value * 1000);
    return '$formatted円';
  }
}
