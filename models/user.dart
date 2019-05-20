import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String username;
  final String email;
  final _Address address;
  final String phone;
  final String website;
  final _Company company;

  User(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.address,
      this.phone,
      this.website,
      this.company})
      : super([id, name, username, email, address, phone, website, company]);

  static List<User> fromJson(dynamic parsedJson) {
    final data = json.decode(parsedJson) as List;

    return data.map((rawJson) {
      return User(
        id: rawJson['id'],
        name: rawJson['name'],
        username: rawJson['username'],
        email: rawJson['email'],
        address: _Address(rawJson['address']),
        phone: rawJson['phone'],
        website: rawJson['website'],
        company: _Company(rawJson['company']),
      );
    }).toList();
  }
}

class _Address {
  String street;
  String suite;
  String city;
  String zipcode;
  String lat;
  String lng;

  _Address(dynamic parsedJson) {
    street = parsedJson['street'];
    suite = parsedJson['suite'];
    city = parsedJson['city'];
    zipcode = parsedJson['zipcode'];
    lat = parsedJson['geo']['lat'];
    lng = parsedJson['geo']['lng'];
  }
}

class _Company {
  String name;
  String catchPhrase;
  String bs;

  _Company(dynamic parsedJson) {
    name = parsedJson['name'];
    catchPhrase = parsedJson['catchPhrase'];
    bs = parsedJson['bs'];
  }
}
