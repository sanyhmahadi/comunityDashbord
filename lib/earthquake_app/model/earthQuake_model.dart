import 'package:earthquake_app/earthquake_app/util/helper.dart';

class EarthQuake {
  String _type;
  Metadata _metadata;
  List<Features> _features;
  List<double> _bbox;

  EarthQuake(
      {String type,
      Metadata metadata,
      List<Features> features,
      List<double> bbox}) {
    this._type = type;
    this._metadata = metadata;
    this._features = features;
    this._bbox = bbox;
  }

  // ignore: unnecessary_getters_setters
  String get type => _type;
  // ignore: unnecessary_getters_setters
  set type(String type) => _type = type;
  // ignore: unnecessary_getters_setters
  Metadata get metadata => _metadata;
  // ignore: unnecessary_getters_setters
  set metadata(Metadata metadata) => _metadata = metadata;
  // ignore: unnecessary_getters_setters
  List<Features> get features => _features;
  // ignore: unnecessary_getters_setters
  set features(List<Features> features) => _features = features;
  // ignore: unnecessary_getters_setters
  List<double> get bbox => _bbox;
  // ignore: unnecessary_getters_setters
  set bbox(List<double> bbox) => _bbox = bbox;

  EarthQuake.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['features'] != null) {
      _features = new List<Features>();
      json['features'].forEach((v) {
        _features.add(new Features.fromJson(v));
      });
    }
    _bbox = json['bbox'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    if (this._metadata != null) {
      data['metadata'] = this._metadata.toJson();
    }
    if (this._features != null) {
      data['features'] = this._features.map((v) => v.toJson()).toList();
    }
    data['bbox'] = this._bbox;
    return data;
  }
}

class Metadata {
  int _generated;
  String _url;
  String _title;
  int _status;
  String _api;
  int _count;

  Metadata(
      {int generated,
      String url,
      String title,
      int status,
      String api,
      int count}) {
    this._generated = generated;
    this._url = url;
    this._title = title;
    this._status = status;
    this._api = api;
    this._count = count;
  }

  // ignore: unnecessary_getters_setters
  int get generated => _generated;
  // ignore: unnecessary_getters_setters
  set generated(int generated) => _generated = generated;
  // ignore: unnecessary_getters_setters
  String get url => _url;
  // ignore: unnecessary_getters_setters
  set url(String url) => _url = url;
  // ignore: unnecessary_getters_setters
  String get title => _title;
  // ignore: unnecessary_getters_setters
  set title(String title) => _title = title;
  // ignore: unnecessary_getters_setters
  int get status => _status;
  // ignore: unnecessary_getters_setters
  set status(int status) => _status = status;
  // ignore: unnecessary_getters_setters
  String get api => _api;
  // ignore: unnecessary_getters_setters
  set api(String api) => _api = api;
  // ignore: unnecessary_getters_setters
  int get count => _count;
  // ignore: unnecessary_getters_setters
  set count(int count) => _count = count;

  Metadata.fromJson(Map<String, dynamic> json) {
    _generated = json['generated'];
    _url = json['url'];
    _title = json['title'];
    _status = json['status'];
    _api = json['api'];
    _count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['generated'] = this._generated;
    data['url'] = this._url;
    data['title'] = this._title;
    data['status'] = this._status;
    data['api'] = this._api;
    data['count'] = this._count;
    return data;
  }
}

class Features {
  String _type;
  Properties _properties;
  Geometry _geometry;
  String _id;

  Features({String type, Properties properties, Geometry geometry, String id}) {
    this._type = type;
    this._properties = properties;
    this._geometry = geometry;
    this._id = id;
  }

  // ignore: unnecessary_getters_setters
  String get type => _type;
  // ignore: unnecessary_getters_setters
  set type(String type) => _type = type;
  // ignore: unnecessary_getters_setters
  Properties get properties => _properties;
  // ignore: unnecessary_getters_setters
  set properties(Properties properties) => _properties = properties;
  // ignore: unnecessary_getters_setters
  Geometry get geometry => _geometry;
  // ignore: unnecessary_getters_setters
  set geometry(Geometry geometry) => _geometry = geometry;
  // ignore: unnecessary_getters_setters
  String get id => _id;
  // ignore: unnecessary_getters_setters
  set id(String id) => _id = id;

  Features.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
    _geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    if (this._properties != null) {
      data['properties'] = this._properties.toJson();
    }
    if (this._geometry != null) {
      data['geometry'] = this._geometry.toJson();
    }
    data['id'] = this._id;
    return data;
  }
}

class Properties {
  double _mag;
  String _place;
  int _time;
  int _updated;
  Null _tz;
  String _url;
  String _detail;
  int _felt;
  double _cdi;
  double _mmi;
  String _alert;
  String _status;
  int _tsunami;
  int _sig;
  String _net;
  String _code;
  String _ids;
  String _sources;
  String _types;
  int _nst;
  double _dmin;
  double _rms;
  int _gap;
  String _magType;
  String _type;
  String _title;

  Properties(
      {double mag,
      String place,
      int time,
      int updated,
      Null tz,
      String url,
      String detail,
      int felt,
      double cdi,
      double mmi,
      String alert,
      String status,
      int tsunami,
      int sig,
      String net,
      String code,
      String ids,
      String sources,
      String types,
      int nst,
      double dmin,
      double rms,
      int gap,
      String magType,
      String type,
      String title}) {
    this._mag = mag;
    this._place = place;
    this._time = time;
    this._updated = updated;
    this._tz = tz;
    this._url = url;
    this._detail = detail;
    this._felt = felt;
    this._cdi = cdi;
    this._mmi = mmi;
    this._alert = alert;
    this._status = status;
    this._tsunami = tsunami;
    this._sig = sig;
    this._net = net;
    this._code = code;
    this._ids = ids;
    this._sources = sources;
    this._types = types;
    this._nst = nst;
    this._dmin = dmin;
    this._rms = rms;
    this._gap = gap;
    this._magType = magType;
    this._type = type;
    this._title = title;
  }
  // ignore: unnecessary_getters_setters
  double get mag => _mag;
  // ignore: unnecessary_getters_setters
  set mag(double mag) => _mag = mag;
  // ignore: unnecessary_getters_setters
  String get place => _place;
  // ignore: unnecessary_getters_setters
  set place(String place) => _place = place;
  // ignore: unnecessary_getters_setters
  int get time => _time;
  // ignore: unnecessary_getters_setters
  set time(int time) => _time = time;
  // ignore: unnecessary_getters_setters
  int get updated => _updated;
  // ignore: unnecessary_getters_setters
  set updated(int updated) => _updated = updated;
  // ignore: unnecessary_getters_setters
  Null get tz => _tz;
  // ignore: unnecessary_getters_setters
  set tz(Null tz) => _tz = tz;
  // ignore: unnecessary_getters_setters
  // ignore: unnecessary_getters_setters
  String get url => _url;
  // ignore: unnecessary_getters_setters
  // ignore: unnecessary_getters_setters
  set url(String url) => _url = url;
  // ignore: unnecessary_getters_setters
  // ignore: unnecessary_getters_setters
  String get detail => _detail;
  // ignore: unnecessary_getters_setters
  // ignore: unnecessary_getters_setters
  set detail(String detail) => _detail = detail;
  // ignore: unnecessary_getters_setters
  // ignore: unnecessary_getters_setters
  int get felt => _felt;
  // ignore: unnecessary_getters_setters
  set felt(int felt) => _felt = felt;
  // ignore: unnecessary_getters_setters
  double get cdi => _cdi;
  // ignore: unnecessary_getters_setters
  set cdi(double cdi) => _cdi = cdi;
  // ignore: unnecessary_getters_setters
  double get mmi => _mmi;
  // ignore: unnecessary_getters_setters
  // ignore: unnecessary_getters_setters
  set mmi(double mmi) => _mmi = mmi;
  // ignore: unnecessary_getters_setters
  String get alert => _alert;
  // ignore: unnecessary_getters_setters
  set alert(String alert) => _alert = alert;
  // ignore: unnecessary_getters_setters
  String get status => _status;
  // ignore: unnecessary_getters_setters
  set status(String status) => _status = status;
  // ignore: unnecessary_getters_setters
  int get tsunami => _tsunami;
  // ignore: unnecessary_getters_setters
  set tsunami(int tsunami) => _tsunami = tsunami;
  // ignore: unnecessary_getters_setters
  int get sig => _sig;
  // ignore: unnecessary_getters_setters
  set sig(int sig) => _sig = sig;
  // ignore: unnecessary_getters_setters
  String get net => _net;
  // ignore: unnecessary_getters_setters
  set net(String net) => _net = net;
  // ignore: unnecessary_getters_setters
  String get code => _code;
  // ignore: unnecessary_getters_setters
  set code(String code) => _code = code;
  // ignore: unnecessary_getters_setters
  String get ids => _ids;
  // ignore: unnecessary_getters_setters
  set ids(String ids) => _ids = ids;
  // ignore: unnecessary_getters_setters
  String get sources => _sources;
  // ignore: unnecessary_getters_setters
  set sources(String sources) => _sources = sources;
  // ignore: unnecessary_getters_setters
  String get types => _types;
  // ignore: unnecessary_getters_setters
  set types(String types) => _types = types;
  // ignore: unnecessary_getters_setters
  int get nst => _nst;
  // ignore: unnecessary_getters_setters
  set nst(int nst) => _nst = nst;
  // ignore: unnecessary_getters_setters
  double get dmin => _dmin;
  // ignore: unnecessary_getters_setters
  set dmin(double dmin) => _dmin = dmin;
  // ignore: unnecessary_getters_setters
  double get rms => _rms;
  // ignore: unnecessary_getters_setters
  set rms(double rms) => _rms = rms;
  // ignore: unnecessary_getters_setters
  int get gap => _gap;
  // ignore: unnecessary_getters_setters
  set gap(int gap) => _gap = gap;
  // ignore: unnecessary_getters_setters
  String get magType => _magType;
  // ignore: unnecessary_getters_setters
  set magType(String magType) => _magType = magType;
  // ignore: unnecessary_getters_setters
  String get type => _type;
  // ignore: unnecessary_getters_setters
  set type(String type) => _type = type;
  // ignore: unnecessary_getters_setters
  String get title => _title;
  // ignore: unnecessary_getters_setters
  set title(String title) => _title = title;

  Properties.fromJson(Map<String, dynamic> json) {
    _mag = TypesHelper.toDouble(json['mag']);
    _place = json['place'];
    _time = TypesHelper.toInt(json['time']);
    _updated = TypesHelper.toInt(json['updated']);
    _tz = json['tz'];
    _url = json['url'];
    _detail = json['detail'];
    _felt = TypesHelper.toInt(json['felt']);
    _cdi = TypesHelper.toDouble(json['cdi']);
    _mmi = TypesHelper.toDouble(json['mmi']);
    _alert = json['alert'];
    _status = json['status'];
    _tsunami = TypesHelper.toInt(json['tsunami']);
    _sig = TypesHelper.toInt(json['sig']);
    _net = json['net'];
    _code = json['code'];
    _ids = json['ids'];
    _sources = json['sources'];
    _types = json['types'];
    _nst = TypesHelper.toInt(json['nst']);
    _dmin = TypesHelper.toDouble(json['dmin']);
    _rms = TypesHelper.toDouble(json['rms']);
    _gap = TypesHelper.toInt(json['gap']);
    _magType = json['magType'];
    _type = json['type'];
    _title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mag'] = this._mag;
    data['place'] = this._place;
    data['time'] = this._time;
    data['updated'] = this._updated;
    data['tz'] = this._tz;
    data['url'] = this._url;
    data['detail'] = this._detail;
    data['felt'] = this._felt;
    data['cdi'] = this._cdi;
    data['mmi'] = this._mmi;
    data['alert'] = this._alert;
    data['status'] = this._status;
    data['tsunami'] = this._tsunami;
    data['sig'] = this._sig;
    data['net'] = this._net;
    data['code'] = this._code;
    data['ids'] = this._ids;
    data['sources'] = this._sources;
    data['types'] = this._types;
    data['nst'] = this._nst;
    data['dmin'] = this._dmin;
    data['rms'] = this._rms;
    data['gap'] = this._gap;
    data['magType'] = this._magType;
    data['type'] = this._type;
    data['title'] = this._title;
    return data;
  }
}

class Geometry {
  String _type;
  List<double> _coordinates;

  Geometry({String type, List<double> coordinates}) {
    this._type = type;
    this._coordinates = coordinates;
  }

  // ignore: unnecessary_getters_setters
  String get type => _type;
  // ignore: unnecessary_getters_setters
  set type(String type) => _type = type;
  // ignore: unnecessary_getters_setters
  List<double> get coordinates => _coordinates;
  // ignore: unnecessary_getters_setters
  set coordinates(List<double> coordinates) => _coordinates = coordinates;

  Geometry.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['coordinates'] = this._coordinates;
    return data;
  }
}
