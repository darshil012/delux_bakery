import 'package:json_annotation/json_annotation.dart';

class UserRegistration {
  final String name;
  final String userName;
  final String email;
  final String userPhone;
  final String userPassword;
  final String userConfirmPassword;

  UserRegistration({this.name ,this.userName, this.email, this.userPhone, this.userPassword, this.userConfirmPassword});
  // UserRegistration.fromData(Map<String, dynamic> data)
  //     :name = data['name'],
  //       userName = data['userName'],
  //       email = data['email'],
  //       userPhone = data['userPhone'],
  //       userPassword = data['userPassword'],
  //       userConfirmPassword = data['userConfirmPassword'];
  Map<String, dynamic> toJson() {
    return {
      'name':name,
      'userName': userName,
      'email': email,
      'phoneNumber': userPhone.toString(),
      'password':userPassword,
      'confirmPassword':userConfirmPassword
    };
  }
}

class UserLogin {
  String email;
  String password;

  UserLogin({this.email, this.password});

  Map <String, dynamic> toDatabaseJson() => {
    "email": this.email,
    "password": this.password
  };
}

class Token{
  String token;

  Token({this.token});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
        token: json['data']
    );
  }
}