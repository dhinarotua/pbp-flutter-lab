class Model {
  String judul;
  int nominal;
  String jenis;
  String date;
  static List<Model> lst = [];

  Model({required this.judul, required this.nominal, required this.jenis, required this.date});

  static void add({
    required judul,
    required nominal,
    required jenis,
    required date,
  }) {
    lst.add(Model(judul: judul, nominal: nominal, jenis: jenis, date: date));
  }
}