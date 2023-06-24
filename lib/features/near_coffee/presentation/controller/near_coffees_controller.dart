import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../domain/coffee_model.dart';

class NearCoffeeController extends GetxController {
  late TextEditingController search = TextEditingController();
  int searchResultCount = 4;
  RangeValues selectedPriceRange = const RangeValues(20, 40);
  int selectedContainerIndex = 0;
  late List<CoffeeModel> myCoffees;

  void selectContainer(int index) {
    selectedContainerIndex = index;
    update();
  }

  void updateSliderValue(RangeValues value) {
    selectedPriceRange = value;
    update();
  }

  List<CoffeeModel> getCoffees() {
    List<CoffeeTable>? coffeeTables = [
      CoffeeTable(reservedSeatsCount: 2),
      CoffeeTable(reservedSeatsCount: 3),
      CoffeeTable(reservedSeatsCount: 2),
      CoffeeTable(reservedSeatsCount: 1),
    ];

    List<CoffeeModel> coffees = [
      CoffeeModel(
        image: ManagerAssets.chessGame,
        coffeeName: 'كافي شوب الحارة',
        coffeeDescription: ManagerStrings.coffeeDescription,
        place: 'جدة, حديقة الفيحاء',
        price: 15,
        distance: 150,
        playersCount: 25,
        availableSeats: 07,
        isopen: true,
        availavleTablesCount: 04,
        tables: coffeeTables,
        coffePlace: LatLng(37.785834, -122.406417),
      ),
      CoffeeModel(
        image: ManagerAssets.chessGame,
        coffeeName: 'كافي شوب الضيعة',
        coffeeDescription: ManagerStrings.coffeeDescription,
        place: 'جدة, حديقة الفيحاء',
        price: 15,
        distance: 150,
        playersCount: 20,
        availableSeats: 05,
        isopen: false,
        availavleTablesCount: 04,
        tables: coffeeTables,
        coffePlace: LatLng(37.785834, -122.406417),
      ),
      CoffeeModel(
        image: ManagerAssets.chessGame,
        coffeeName: 'كافي شوب كريسبي',
        coffeeDescription: ManagerStrings.coffeeDescription,
        place: 'جدة, حديقة الفيحاء',
        price: 15,
        distance: 150,
        playersCount: 13,
        availableSeats: 08,
        isopen: true,
        availavleTablesCount: 04,
        tables: coffeeTables,
        coffePlace: LatLng(37.785834, -122.406417),
      ),
      CoffeeModel(
        image: ManagerAssets.chessGame,
        coffeeName: 'كافي شوب اللوتس',
        coffeeDescription: ManagerStrings.coffeeDescription,
        place: 'جدة, حديقة الفيحاء',
        price: 15,
        distance: 150,
        playersCount: 10,
        availableSeats: 07,
        isopen: false,
        availavleTablesCount: 04,
        tables: coffeeTables,
        coffePlace: LatLng(37.785834, -122.406417),
      ),
    ];

    return coffees;
  }

  @override
  void onInit() {
    super.onInit();
    search = TextEditingController();
    selectedPriceRange = const RangeValues(10, 50);
    myCoffees = getCoffees();
  }

  @override
  void onClose() {
    super.onClose();
    search.dispose();
  }
}
