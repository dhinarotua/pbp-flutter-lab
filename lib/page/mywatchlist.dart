import 'package:flutter/material.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/model/model_watchlist.dart';
import 'mywatchlistDetail.dart';
import 'package:counter_7/fetchMyWatchlist.dart';

class MyWatchList extends StatefulWidget {
  const MyWatchList({super.key});

  @override
  State<MyWatchList> createState() => _MyWatchListState();
}

class _MyWatchListState extends State<MyWatchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
        drawer: const DrawerBar(),
        body: FutureBuilder(
            future: fetchMyWatchlist(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada watch list :(",
                        style:
                        TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                          decoration: BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black,
                                )
                              ]
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: snapshot.data![index].watched
                                      ? Colors.green
                                      : Colors.red,
                                )
                            ),
                            child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                                child: ListTile(
                                  title: Text(
                                    "${snapshot.data![index].title}",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  trailing: Checkbox(
                                    value: snapshot.data![index].watched,
                                    onChanged: (bool? newValue) => {
                                      setState(
                                            () => {snapshot.data![index].watched = newValue!},
                                      )
                                    },
                                  ),
                                )
                            )
                      )
                    )
                  );
                }
              }
            }
        )
    );
  }
}