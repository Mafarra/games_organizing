// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CoffeeModel {
  String? image;
  String? coffeeName;
  String? coffeeDescription;
  String? place;
  int? price;
  int? distance;
  int? availableSeats;
  int? playersCount;
  bool? isopen;
  int? availavleTablesCount;
  List<CoffeeTable>? tables;
  LatLng? coffePlace;

  CoffeeModel({
    this.image,
    this.coffeeName,
    this.coffeeDescription,
    this.place,
    this.price,
    this.distance,
    this.availableSeats,
    this.playersCount,
    this.isopen,
    this.availavleTablesCount,
    this.tables,
    this.coffePlace,
  });
}

class CoffeeTable {
  int? reservedSeatsCount;
  Player? players;
  CoffeeTable({
    this.reservedSeatsCount,
    this.players,
  });
}

class Player {
  //user info
}
