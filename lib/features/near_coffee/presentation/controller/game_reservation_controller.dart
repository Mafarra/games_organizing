import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../domain/coffee_model.dart';

class GameReservationController extends GetxController {
  late TextEditingController search = TextEditingController();
  int searchResultCount = 4;
  RangeValues selectedPriceRange = const RangeValues(20, 40);
  int selectedContainerIndex = 0;

  void selectContainer(int index) {
    selectedContainerIndex = index;
    update();
  }

  void updateSliderValue(RangeValues value) {
    selectedPriceRange = value;
    update();
  }

  List<CoffeeModel> coffees = [
    CoffeeModel(
      image: ManagerAssets.chessGame,
      coffeeName: 'كافي شوب الحارة',
      place: 'جدة, حديقة الفيحاء',
      price: 15,
      distance: 150,
      availableSeats: 25,
      isopen: true,
    ),
    CoffeeModel(
        image: ManagerAssets.chessGame,
        coffeeName: 'كافي شوب الضيعة',
        place: 'جدة, حديقة الفيحاء',
        price: 15,
        distance: 150,
        availableSeats: 20,
        isopen: false),
    CoffeeModel(
        image: ManagerAssets.chessGame,
        coffeeName: 'كافي شوب كريسبي',
        place: 'جدة, حديقة الفيحاء',
        price: 15,
        distance: 150,
        availableSeats: 13,
        isopen: true),
    CoffeeModel(
      image: ManagerAssets.chessGame,
      coffeeName: 'كافي شوب اللوتس',
      place: 'جدة, حديقة الفيحاء',
      price: 15,
      distance: 150,
      availableSeats: 10,
      isopen: false,
    ),
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    search = TextEditingController();
    selectedPriceRange = const RangeValues(10, 50);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    search.dispose();
  }
}
