import 'dart:convert';

import 'package:flutter_app_practicle/model/demo_class.dart';
import 'package:flutter_app_practicle/utils/helper.dart';
import 'package:http/http.dart' as http;

Future<Stream<DemoData>> getData() async {
  Uri uri = Uri.parse(Helper.url + "blog-all-list");
  try {
    final client = new http.Client();
    final streamedRest = await client.send(http.Request('get', uri));

    return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Helper.getData(data))
        .expand((data) => (data as List))
        .map((data) {
      return DemoData.fromJson(data);
    });
  } catch (e) {
    return new Stream.value(new DemoData.fromJson({}));
  }
}
