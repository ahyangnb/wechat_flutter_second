import 'dart:convert';

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class CodeRspEntity {
  CodeRspEntity({
    this.token,
    this.code,
    this.phone,
  });

  factory CodeRspEntity.fromJson(Map<String, dynamic> json) => json == null
      ? null
      : CodeRspEntity(
    token: asT<String>(json['token']),
    code: asT<String>(json['code']),
    phone: asT<String>(json['phone']),
  );

  String token;
  String code;
  String phone;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'token': token,
    'code': code,
    'phone': phone,
  };
}
