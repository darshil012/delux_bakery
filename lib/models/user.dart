import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated when we do the flutter pub run build_runner build
class User {
  final String name;
  final String userName;
  final String email;
  final String userPhone;
  final String userPassword;
  final String userConfirmPassword;

  User({this.name ,this.userName, this.email, this.userPhone, this.userPassword, this.userConfirmPassword});
  User.fromData(Map<String, dynamic> data)
        :name = data['name'],
        userName = data['userName'],
        email = data['email'],
        userPhone = data['userPhone'],
        userPassword = data['userPassword'],
        userConfirmPassword = data['userConfirmPassword'];
  Map<String, dynamic> toJson() {
    return {
      'name':name,
      'userName': userName,
      'email': email,
      'phoneNumber': userPhone,
      'password':userPassword,
      'confirmPassword':userConfirmPassword
    };
  }
}