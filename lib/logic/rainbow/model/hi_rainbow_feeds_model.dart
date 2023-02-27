/// UpdateCount : 6
/// code : 0
/// flag : 1
/// msg : "获取成功"
/// rs : [{"type":3,"bigImg":null,"listImg":["http://tu.chdesign.cn//Thumbnail/upload/creation/20180707/gjrdqzdcme2ggzlbgaytiyzwmvrgkytggq2tsytdguywiyjvmy2s42tqm5ptemjxpaytmmq.jpg","http://tu.chdesign.cn//Thumbnail/upload/creation/20180707/gjtgcyrvmqzdqnzsmq4tindbgfqtgmbqgaydqzjvmmydizdcgnrc42tqm5ptemjxpaytmmq.jpg","http://tu.chdesign.cn//Thumbnail/upload/creation/20180707/ge3tomlbgfsdcmrrgbsdizjymrrdozjqgnrdkyrymiztgobwmyyc42tqm5ptemjxpaytmmq.jpg"],"title":null,"isAccessible":false,"content":null,"city":"海外","priceUnit":"3000元/个","headImage":"http://tu.chdesign.cn//upload/avatars/197412/20550924625484.png?x-oss-process=image/resize,m_fill,h_120,w_120,limit_0/format,jpg","sex":false,"hits":null,"userName":"saramaese","mostFields":"插图, 图案设计, 产品设计 ","cateName":null,"dataID":197412,"imgHeight":0,"imgWidth":0,"url":null,"time":null,"Budget":0,"isSign":false},{"type":10,"bigImg":"http://tu.chdesign.cn//upload/match/20210202/6e82f66af5dd472aa7ddfeb2cb995a69.jpg?x-oss-process=image/resize,m_fill,h_414,w_690,limit_0/format,jpg","listImg":null,"title":"科普","isAccessible":false,"content":null,"city":null,"priceUnit":null,"headImage":null,"sex":false,"hits":null,"userName":null,"mostFields":null,"cateName":null,"dataID":571,"imgHeight":0,"imgWidth":0,"url":null,"time":null,"Budget":0,"isSign":false},{"type":4,"bigImg":"http://tu.chdesign.cn//upload/News/20190104/4148f6469f6241fda8af998e5013786a.png?x-oss-process=image/resize,m_fill,h_150,w_200,limit_0/format,jpg","listImg":null,"title":"未来当然少不了自然主题，原木装饰带来简约的手工艺术感","isAccessible":false,"content":null,"city":null,"priceUnit":null,"headImage":null,"sex":false,"hits":32267,"userName":null,"mostFields":null,"cateName":"大咖约稿","dataID":98052,"imgHeight":0,"imgWidth":0,"url":null,"time":null,"Budget":0,"isSign":false},{"type":6,"bigImg":"http://tu.chdesign.cn//upload/portrait/20180525/7399d996c4e24ad7b9a3af89c695f972.jpg?x-oss-process=image/resize,m_fill,h_414,w_690,limit_0/format,jpg","listImg":null,"title":"KE design的厨房刀具设计私馆","isAccessible":false,"content":"广州美术学院工业设计科班出身，曾和团队或个人一起获得2011 IF奖，2012河姆渡设计优秀奖、2012中国五金杯优秀奖等。在设计公司有过3年设计经验，而后潜心专注厨房产品设计开发5年","city":null,"priceUnit":null,"headImage":null,"sex":false,"hits":null,"userName":null,"mostFields":null,"cateName":null,"dataID":442,"imgHeight":0,"imgWidth":0,"url":null,"time":null,"Budget":0,"isSign":false},{"type":3,"bigImg":null,"listImg":["http://tu.chdesign.cn//Thumbnail/upload/creation/20180707/g42toobwgu3wiy3bgqzdim3dmq4gknbxmi4wgnrzg5tdqntdg43c44dom5ptemjxpaytmmq.jpg","http://tu.chdesign.cn//Thumbnail/upload/creation/20180707/ha2geobsgaydonjsmnrdinzqgq4tqmzugiztszjtgjrtcojymu3s44dom5ptemjxpaytmmq.jpg","http://tu.chdesign.cn//Thumbnail/upload/creation/20180707/gzsdeyjzga3tkn3gmvqtiobugq4domjsgnrtinjugqzgmntehbss44dom5ptemjxpaytmmq.jpg"],"title":null,"isAccessible":false,"content":null,"city":"秘鲁 胡利亚卡","priceUnit":"3000元/个","headImage":"http://tu.chdesign.cn//upload/avatars/197400/20368396023972.jpg?x-oss-process=image/resize,m_fill,h_120,w_120,limit_0/format,jpg","sex":false,"hits":null,"userName":"erikajacobs","mostFields":"工业设计, 数码艺术, 家具设计 ","cateName":null,"dataID":197400,"imgHeight":0,"imgWidth":0,"url":null,"time":null,"Budget":0,"isSign":false},{"type":4,"bigImg":"http://tu.chdesign.cn//upload/News/20190104/2bf397e3768d4e58823e870ea0605bcc.png?x-oss-process=image/resize,m_fill,h_150,w_200,limit_0/format,jpg","listImg":null,"title":"装饰细节点缀突出某一部分，功能性产品也能具有装饰性","isAccessible":false,"content":null,"city":null,"priceUnit":null,"headImage":null,"sex":false,"hits":20145,"userName":null,"mostFields":null,"cateName":"大咖约稿","dataID":98051,"imgHeight":0,"imgWidth":0,"url":null,"time":null,"Budget":0,"isSign":false}]

class HiRainbowFeedsModel {
  HiRainbowFeedsModel({
      num? updateCount, 
      num? code, 
      num? flag, 
      String? msg, 
      List<Rs>? rs,}){
    _updateCount = updateCount;
    _code = code;
    _flag = flag;
    _msg = msg;
    _rs = rs;
}

  HiRainbowFeedsModel.fromJson(dynamic json) {
    _updateCount = json['UpdateCount'];
    _code = json['code'];
    _flag = json['flag'];
    _msg = json['msg'];
    if (json['rs'] != null) {
      _rs = [];
      json['rs'].forEach((v) {
        _rs?.add(Rs.fromJson(v));
      });
    }
  }
  num? _updateCount;
  num? _code;
  num? _flag;
  String? _msg;
  List<Rs>? _rs;
HiRainbowFeedsModel copyWith({  num? updateCount,
  num? code,
  num? flag,
  String? msg,
  List<Rs>? rs,
}) => HiRainbowFeedsModel(  updateCount: updateCount ?? _updateCount,
  code: code ?? _code,
  flag: flag ?? _flag,
  msg: msg ?? _msg,
  rs: rs ?? _rs,
);
  num? get updateCount => _updateCount;
  num? get code => _code;
  num? get flag => _flag;
  String? get msg => _msg;
  List<Rs>? get rs => _rs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UpdateCount'] = _updateCount;
    map['code'] = _code;
    map['flag'] = _flag;
    map['msg'] = _msg;
    if (_rs != null) {
      map['rs'] = _rs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// type : 3
/// bigImg : null
/// listImg : ["http://tu.chdesign.cn//Thumbnail/upload/creation/20180707/gjrdqzdcme2ggzlbgaytiyzwmvrgkytggq2tsytdguywiyjvmy2s42tqm5ptemjxpaytmmq.jpg","http://tu.chdesign.cn//Thumbnail/upload/creation/20180707/gjtgcyrvmqzdqnzsmq4tindbgfqtgmbqgaydqzjvmmydizdcgnrc42tqm5ptemjxpaytmmq.jpg","http://tu.chdesign.cn//Thumbnail/upload/creation/20180707/ge3tomlbgfsdcmrrgbsdizjymrrdozjqgnrdkyrymiztgobwmyyc42tqm5ptemjxpaytmmq.jpg"]
/// title : null
/// isAccessible : false
/// content : null
/// city : "海外"
/// priceUnit : "3000元/个"
/// headImage : "http://tu.chdesign.cn//upload/avatars/197412/20550924625484.png?x-oss-process=image/resize,m_fill,h_120,w_120,limit_0/format,jpg"
/// sex : false
/// hits : null
/// userName : "saramaese"
/// mostFields : "插图, 图案设计, 产品设计 "
/// cateName : null
/// dataID : 197412
/// imgHeight : 0
/// imgWidth : 0
/// url : null
/// time : null
/// Budget : 0
/// isSign : false

class Rs {
  Rs({
      num? type, 
      dynamic bigImg, 
      List<String>? listImg, 
      dynamic title, 
      bool? isAccessible, 
      dynamic content, 
      String? city, 
      String? priceUnit, 
      String? headImage, 
      bool? sex, 
      dynamic hits, 
      String? userName, 
      String? mostFields, 
      dynamic cateName, 
      num? dataID, 
      num? imgHeight, 
      num? imgWidth, 
      dynamic url, 
      dynamic time, 
      num? budget, 
      bool? isSign,}){
    _type = type;
    _bigImg = bigImg;
    _listImg = listImg;
    _title = title;
    _isAccessible = isAccessible;
    _content = content;
    _city = city;
    _priceUnit = priceUnit;
    _headImage = headImage;
    _sex = sex;
    _hits = hits;
    _userName = userName;
    _mostFields = mostFields;
    _cateName = cateName;
    _dataID = dataID;
    _imgHeight = imgHeight;
    _imgWidth = imgWidth;
    _url = url;
    _time = time;
    _budget = budget;
    _isSign = isSign;
}

  Rs.fromJson(dynamic json) {
    _type = json['type'];
    _bigImg = json['bigImg'];
    _listImg = json['listImg'] != null ? json['listImg'].cast<String>() : [];
    _title = json['title'];
    _isAccessible = json['isAccessible'];
    _content = json['content'];
    _city = json['city'];
    _priceUnit = json['priceUnit'];
    _headImage = json['headImage'];
    _sex = json['sex'];
    _hits = json['hits'];
    _userName = json['userName'];
    _mostFields = json['mostFields'];
    _cateName = json['cateName'];
    _dataID = json['dataID'];
    _imgHeight = json['imgHeight'];
    _imgWidth = json['imgWidth'];
    _url = json['url'];
    _time = json['time'];
    _budget = json['Budget'];
    _isSign = json['isSign'];
  }
  num? _type;
  dynamic _bigImg;
  List<String>? _listImg;
  dynamic _title;
  bool? _isAccessible;
  dynamic _content;
  String? _city;
  String? _priceUnit;
  String? _headImage;
  bool? _sex;
  dynamic _hits;
  String? _userName;
  String? _mostFields;
  dynamic _cateName;
  num? _dataID;
  num? _imgHeight;
  num? _imgWidth;
  dynamic _url;
  dynamic _time;
  num? _budget;
  bool? _isSign;
Rs copyWith({  num? type,
  dynamic bigImg,
  List<String>? listImg,
  dynamic title,
  bool? isAccessible,
  dynamic content,
  String? city,
  String? priceUnit,
  String? headImage,
  bool? sex,
  dynamic hits,
  String? userName,
  String? mostFields,
  dynamic cateName,
  num? dataID,
  num? imgHeight,
  num? imgWidth,
  dynamic url,
  dynamic time,
  num? budget,
  bool? isSign,
}) => Rs(  type: type ?? _type,
  bigImg: bigImg ?? _bigImg,
  listImg: listImg ?? _listImg,
  title: title ?? _title,
  isAccessible: isAccessible ?? _isAccessible,
  content: content ?? _content,
  city: city ?? _city,
  priceUnit: priceUnit ?? _priceUnit,
  headImage: headImage ?? _headImage,
  sex: sex ?? _sex,
  hits: hits ?? _hits,
  userName: userName ?? _userName,
  mostFields: mostFields ?? _mostFields,
  cateName: cateName ?? _cateName,
  dataID: dataID ?? _dataID,
  imgHeight: imgHeight ?? _imgHeight,
  imgWidth: imgWidth ?? _imgWidth,
  url: url ?? _url,
  time: time ?? _time,
  budget: budget ?? _budget,
  isSign: isSign ?? _isSign,
);
  num? get type => _type;
  dynamic get bigImg => _bigImg;
  List<String>? get listImg => _listImg;
  dynamic get title => _title;
  bool? get isAccessible => _isAccessible;
  dynamic get content => _content;
  String? get city => _city;
  String? get priceUnit => _priceUnit;
  String? get headImage => _headImage;
  bool? get sex => _sex;
  dynamic get hits => _hits;
  String? get userName => _userName;
  String? get mostFields => _mostFields;
  dynamic get cateName => _cateName;
  num? get dataID => _dataID;
  num? get imgHeight => _imgHeight;
  num? get imgWidth => _imgWidth;
  dynamic get url => _url;
  dynamic get time => _time;
  num? get budget => _budget;
  bool? get isSign => _isSign;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['bigImg'] = _bigImg;
    map['listImg'] = _listImg;
    map['title'] = _title;
    map['isAccessible'] = _isAccessible;
    map['content'] = _content;
    map['city'] = _city;
    map['priceUnit'] = _priceUnit;
    map['headImage'] = _headImage;
    map['sex'] = _sex;
    map['hits'] = _hits;
    map['userName'] = _userName;
    map['mostFields'] = _mostFields;
    map['cateName'] = _cateName;
    map['dataID'] = _dataID;
    map['imgHeight'] = _imgHeight;
    map['imgWidth'] = _imgWidth;
    map['url'] = _url;
    map['time'] = _time;
    map['Budget'] = _budget;
    map['isSign'] = _isSign;
    return map;
  }

}