class UangMasukModel{
  int id;
  String name;

  UangMasukModel({
    this.id,
    this.name,
  });

  UangMasukModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['nama_masuk'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_masuk': name,
    };
  }
}