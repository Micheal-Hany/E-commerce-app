
import 'package:geocoding/geocoding.dart';

class AddressModel {
  static int _nextId = 1; // Static variable to track the next id
  final int id; // Instance variable for the id
  final String street;
  final String subLocality;
  final String locality;
  final String postalCode;
  final String country;
  String? name;
  String? phoneNumber;
  String? address;

  AddressModel({
    required this.id,
    required this.street,
    required this.subLocality,
    required this.locality,
    required this.postalCode,
    required this.country,
    this.name,
    this.phoneNumber,
    this.address,
  });

  factory AddressModel.fromPlacemark(Placemark placemark) {
    int nextId = _nextId++; // Increment and get the next id
    return AddressModel(
      id: nextId,
      street: placemark.street ?? "",
      subLocality: placemark.subLocality ?? "",
      locality: placemark.locality ?? "",
      postalCode: placemark.postalCode ?? "",
      country: placemark.country ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'street': street,
      'subLocality': subLocality,
      'locality': locality,
      'postalCode': postalCode,
      'country': country,
    };
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      street: json['street'],
      subLocality: json['subLocality'],
      locality: json['locality'],
      postalCode: json['postalCode'],
      country: json['country'],
    );
  }

  @override
  String toString() {
    return '$id: $street, $subLocality, $locality, $postalCode, $country';
  }
}

