import 'package:flutter/material.dart';
import '../model/model_watchlist.dart';
import 'drawer.dart';
import 'mywatchlist.dart';

class WatchlistDetail extends StatelessWidget {
  final WatchList watchList;
  const WatchlistDetail({super.key, required this.watchList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
        ),
        drawer: const DrawerBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "  ",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              watchList.title,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "Release date: " + watchList.releaseDate,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Rating: " + watchList.rating.toString() + "/10",
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Status: " + (watchList.watched ? "watched" : "not watched"),
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Review: ",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    watchList.review,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Back",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
    );}
  }