part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: '',
      email: json['email'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirm_password'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'password': instance.password
};