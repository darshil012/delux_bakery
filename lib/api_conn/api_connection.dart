import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:delux_bakery/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:alice/alice.dart';
import 'package:delux_bakery/models/api_model.dart';

final _base ="http://deluxbakery.in";
final api_url = _base + "/api/Account/registr";


class UserResponse {
  UserRegistration user;
  String error;


  UserResponse();
  UserResponse.mock(UserRegistration user):
        user  = user,error = "";
}

Future<UserResponse> getToken(UserRegistration userRegistration) async {

  UserResponse resp = new UserResponse();
  print(api_url);
  var _body = json.encode(userRegistration);
  print(_body);
  try {
    final response = await http.post(api_url,headers: {"Content-Type": "application/json"},body: _body)
        .then((response) {
      resp.error = '200';
      if ( response.statusCode != 200) {
        resp.error = response.statusCode.toString() + ' ' + response.body;
      }else{
        print((response.body).toString());
      }
    });

  }  catch (e) {
    resp.error = e.message;
  }
  return resp;
}
