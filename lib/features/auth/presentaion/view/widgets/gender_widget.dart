import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:games_organizing/core/extensions/extensions.dart';
import 'package:games_organizing/core/resources/manager_fonts.dart';
import 'package:games_organizing/core/resources/manager_styles.dart';
import '../../../../../core/resources/manager_color.dart';
import '../../../../../core/resources/managers_size.dart';
import '../../../domain/gender_model.dart';
import '../../controller/registration_controller.dart';

Widget genderItem(
    {BuildContext? context,
    required GenderModel? genderModel,
    RegisterController? controller}) {
  return InkWell(
    onTap: () {
      controller.clearCheckedgenders();
      controller.changeBorderColorOnCheck(genderModel);
      controller.changedcheckedValue(genderModel);
    },
    child: Container(
      width: ManagerWidth.w75,
      height: ManagerHeight.h85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: controller!.genderBorderColor, width: 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Theme(
                data: ThemeData(unselectedWidgetColor: ManagerColors.grey),
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 8,
                    right: 8,
                  ),
                  width: ManagerWidth.w10,
                  height: ManagerHeight.h10,
                  child: Checkbox(
                    value: genderModel!.isChecked,
                    onChanged: (bool? newValue) {
                      controller.clearCheckedgenders();
                      genderModel.isChecked = newValue;
                      controller.changeBorderColorOnCheck(genderModel);
                      controller.genderType = genderModel.genderType.onNull();
                      controller.update();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    activeColor: ManagerColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: ManagerWidth.w38,
                height: ManagerHeight.h32,
                child: SvgPicture.asset(genderModel.svgPic.onNull()),
              ),
              SizedBox(
                height: ManagerHeight.h12,
              ),
              Text(
                genderModel.genderType.onNull(),
                style: getRegularTextStyle(
                    fontSize: ManagerFontSize.s10, color: ManagerColors.black),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
