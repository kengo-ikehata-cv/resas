import 'package:flutter/material.dart';
import 'package:myapp/city_detail_page.dart';
import 'env.dart';
import 'package:http/http.dart' as http;

class CityListPage extends StatefulWidget {
  const CityListPage({
    super.key,
  });

  @override
  State<CityListPage> createState() => _CityListPageState();
}

class _CityListPageState extends State<CityListPage> {
  late Future<String> _future;

  @override
  void initState() {
    super.initState();
    const host = 'opendata.resas-portal.go.jp';
    const endpoint = '/api/v1/cities';
    final headers = {'X-API-KEY': Env.resasApiKey};
    _future = http
        .get(Uri.https(host, endpoint), headers: headers)
        .then((res) => res.body);
  }

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
      body: FutureBuilder<String>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            print(snapshot.data);
            return ListView(children: [
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
            ]);
          }),
    );
  }
}
