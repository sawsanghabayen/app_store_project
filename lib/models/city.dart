// class City{
//   final int id;
//   final String title;
//
//   const City({
//     required this.id,
//     required this.title
//   }
//
//       );
// }


class City {
  int? _id;
  String? _nameEn;
  String? _nameAr;

  City({int? id, String? nameEn, String? nameAr}) {
    if (id != null) {
      this._id = id;
    }
    if (nameEn != null) {
      this._nameEn = nameEn;
    }
    if (nameAr != null) {
      this._nameAr = nameAr;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get nameEn => _nameEn;
  set nameEn(String? nameEn) => _nameEn = nameEn;
  String? get nameAr => _nameAr;
  set nameAr(String? nameAr) => _nameAr = nameAr;

  City.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _nameEn = json['name_en'];
    _nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name_en'] = this._nameEn;
    data['name_ar'] = this._nameAr;
    return data;
  }
}