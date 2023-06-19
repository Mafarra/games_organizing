import 'package:get/get.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_strings.dart';
import '../view/widgets/game_card.dart';

class HomeViewConteroller extends GetxController{
  int reservationGameCount = 0;
  List<GameCard> gameCards = [
  const GameCard(
    gameImage: ManagerAssets.balootGame,
    gameName: ManagerStrings.balootGame,
  ),
  const GameCard(
    gameImage: ManagerAssets.chessGame,
    gameName: ManagerStrings.chessGame,
  ),
  const GameCard(
    gameImage: ManagerAssets.balootGame,
    gameName: ManagerStrings.balootGame,
  ),
];
}