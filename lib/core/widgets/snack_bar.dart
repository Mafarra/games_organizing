import 'package:get/get.dart';
import '../resources/manager_color.dart';

GetSnackBar simpleSnackBar({required String title,required String message}) {
  return  GetSnackBar(
    title: title,
    message: message,
    backgroundColor: ManagerColors.snackBarErrorColor,
    duration: const Duration(seconds: 3),
  );
}
