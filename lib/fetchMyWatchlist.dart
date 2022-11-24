import 'model/model_watchlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<bool> statusMovie = [];
Future<List<WatchList>> fetchMyWatchlist() async {
  var url = Uri.parse('https://pbp-tugas-2-tiara.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<WatchList> listWatch = [];

  for (var d in data) {
    if (d != null) {
      listWatch.add(WatchList.fromJson(d));
    }
  }
  return listWatch;
}