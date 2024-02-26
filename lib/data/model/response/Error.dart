/// value : "0123456789"
/// msg : "accept only egypt phone numbers"
/// param : "phone"
/// location : "body"

class Error {
  Error({
      this.value, 
      this.msg, 
      this.param, 
      this.location,});

  Error.fromJson(dynamic json) {
    value = json['value'];
    msg = json['msg'];
    param = json['param'];
    location = json['location'];
  }
  String? value;
  String? msg;
  String? param;
  String? location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['msg'] = msg;
    map['param'] = param;
    map['location'] = location;
    return map;
  }

}