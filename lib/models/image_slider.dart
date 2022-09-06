class ImageSlider {
  int? _id;
  String? _objectId;
  String? _url;
  String? _imageUrl;

  ImageSlider({int? id, String? objectId, String? url, String? imageUrl}) {
    if (id != null) {
      this._id = id;
    }
    if (objectId != null) {
      this._objectId = objectId;
    }
    if (url != null) {
      this._url = url;
    }
    if (imageUrl != null) {
      this._imageUrl = imageUrl;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get objectId => _objectId;
  set objectId(String? objectId) => _objectId = objectId;
  String? get url => _url;
  set url(String? url) => _url = url;
  String? get imageUrl => _imageUrl;
  set imageUrl(String? imageUrl) => _imageUrl = imageUrl;

  ImageSlider.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _objectId = json['object_id'];
    _url = json['url'];
    _imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['object_id'] = this._objectId;
    data['url'] = this._url;
    data['image_url'] = this._imageUrl;
    return data;
  }
}