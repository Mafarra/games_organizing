import 'package:games_organizing/features/near_coffee/domain/game_model.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_strings.dart';
import '../view/widgets/game_card.dart';

class HomeViewConteroller extends GetxController{
  int reservationGameCount = 0;
  List<GameCard> gameCards = [
   GameCard(
    gameModel: GameModel(name: ManagerStrings.balootGame,image:ManagerAssets.balootGame,),
  ),
   GameCard(
    gameModel: GameModel(name: ManagerStrings.chessGame,image:ManagerAssets.chessGame,),
  ),
  
];
}