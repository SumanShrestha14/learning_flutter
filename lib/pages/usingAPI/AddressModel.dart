import 'package:flutter/material.dart';

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final String country;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      country:
          'US', // JSONPlaceholder doesn't provide country, so using default
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'country': country,
    };
  }
}
