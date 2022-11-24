import 'package:flutter/material.dart';
import 'drawer.dart';
import '../model/models.dart';

class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key});

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
      ),
      // Menambahkan drawer menu
      drawer: const DrawerBar(),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: Model.lst.map((Model model) {
              return Container(
                padding: const EdgeInsets.all(8.00),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 0.5, color: Colors.black26),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      alignment: Alignment.topLeft,
                      child: Text(model.judul, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),),
                    ),

                    Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(model.nominal.toString(), style: TextStyle(fontSize: 16),),
                              Text(model.jenis, style: TextStyle(fontSize: 16),),
                            ],
                          ),
                          Text(model.date, style: TextStyle(fontSize: 16),),
                        ],
              ),
                      // child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(model.nominal.toString(), style: TextStyle(fontSize: 16),),
                      //     Text(model.jenis, style: TextStyle(fontSize: 16),),
                      //     ],
                      // ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}