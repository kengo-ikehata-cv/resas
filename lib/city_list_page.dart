import 'package:flutter/material.dart';
import 'package:myapp/city_detail_page.dart';

class CityListPage extends StatelessWidget {
  const CityListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cities = [
      '札幌市',
      '仙台市',
      'さいたま市',
      '千葉市',
      '横浜市',
      '川崎市',
      '相模原市',
      '新潟市',
      '静岡市',
      '浜松市',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('市区町村一覧')),
      body: ListView(children: [
        for (final city in cities)
          ListTile(
            title: Text(city),
            subtitle: const Text('政令指定都市'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CityDetailPage(
                    city: city,
                  ),
                ),
              );
            },
          ),
      ]),
    );
  }
}
