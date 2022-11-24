import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/models.dart';
import 'package:counter_7/model/models.dart';
// import 'main.dart';
// import 'page/dataBudget.dart';
// import 'models.dart';
import 'drawer.dart';
// import 'page/drawer.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  int _nominal = 0;
  String? jenis;
  List<String> listJenis = ['Pemasukan', 'Pengeluaran'];
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form Budget'),
        ),
        drawer: const DrawerBar(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Judul",
                        hintText: "Ex. Nonton Konser 1D",
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // Menambahkan behavior saat data diketik
                      onChanged: (String? value) {
                        setState(() {
                          _judul = value!;
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          _judul = value!;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Judul tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        labelText: "Nominal",
                        hintText: "Ex. 10000",
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // Menambahkan behavior saat data diketik
                      onChanged: (String? value) {
                        setState(() {
                          _nominal = int.parse(value!);
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          _nominal = int.parse(value!);
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Nominal tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: DropdownButton(
                        value: jenis,
                        icon: const Icon(Icons.arrow_drop_down),
                        hint: new Text("Pilih Jenis"),
                        items: listJenis.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            jenis = newValue ?? "";
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: const Icon(Icons.calendar_month_outlined),
                        title: Text("${date.day}/${date.month}/${date.year}"),
                        onTap: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(2000), // Batas bawah tahun
                            lastDate: DateTime(2023), // Batas atas tahun
                          );

                          // Jika user memilih suatu date (tidak cancel)
                          if (newDate != null) {
                            setState(() {
                              date = newDate;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 30),
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      child: const Text(
                        "Simpan",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Model.add(judul: _judul, nominal: _nominal, jenis: jenis, date: "${date.day}/${date.month}/${date.year}");
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 15,
                                child: Container(
                                  child: ListView(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      Center(child: const Text('Data Anda telah disimpan!')),
                                      SizedBox(height: 20),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Kembali'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}