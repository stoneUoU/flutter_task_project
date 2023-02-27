class HiFunctionModel {
  bool? _topFillet;
  bool? _bottomFillet;
  String? _iconName;
  String? _functionName;
  String? _subName;

  bool? get topFillet => _topFillet;
  bool? get bottomFillet => _bottomFillet;
  String? get iconName => _iconName;
  String? get functionName => _functionName;
  String? get subName => _subName;

  HiFunctionModel({bool? topFillet,bool? bottomFillet,String? iconName, String? functionName, String? subName}) {
    _topFillet = topFillet;
    _bottomFillet = bottomFillet;
    _iconName = iconName;
    _functionName = functionName;
    _subName = subName;
  }

  HiFunctionModel.fromJson(dynamic json) {
    _topFillet = json["topFillet"];
    _bottomFillet = json["bottomFillet"];
    _iconName = json["iconName"];
    _functionName = json["functionName"];
    _subName = json["subName"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["topFillet"] = _topFillet;
    map["bottomFillet"] = _bottomFillet;
    map["iconName"] = _iconName;
    map["functionName"] = _functionName;
    map["subName"] = _subName;
    return map;
  }
}