class PengawasPemilu {
  int? _id;
  String? _name;
  String? _age;
  String? _noTps;
  String? _detailJob;

  PengawasPemilu(this._name, this._age, this._noTps, this._detailJob);

  PengawasPemilu.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._age = map['age'];
    this._noTps = map['noTps'];
    this._detailJob = map['detailJob'];
  }

  int get id => _id!;
  String get name => _name!;
  String get age => _age!;
  String get noTps => _noTps!;
  String get detailJob => _detailJob!;

  set name(String value){
    _name = value;
  }
  set age(String value){
    _age = value;
  }
  set noTps(String value){
    _noTps = value;
  }
  set detailJob(String value){
    _detailJob = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();

    map['id'] = this._id;
    map['name'] = name;
    map['age'] = age;
    map['noTps'] = noTps;
    map['detailJob'] = detailJob;
    return map;
  }
}