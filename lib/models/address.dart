import 'city.dart';

class Address {
  int? id;
  String? name;
  String? info;
  String? contactNumber;
  Null? lat;
  Null? lang;
  int? cityId;
  City? city;

  Address(
      {this.id,
        this.name,
        this.info,
        this.contactNumber,
        this.lat,
        this.lang,
        this.cityId,
        this.city});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    info = json['info'];
    contactNumber = json['contact_number'];
    lat = json['lat'];
    lang = json['lang'];
    cityId = json['city_id'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['info'] = this.info;
    data['contact_number'] = this.contactNumber;
    data['lat'] = this.lat;
    data['lang'] = this.lang;
    data['city_id'] = this.cityId;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    return data;
  }
}
