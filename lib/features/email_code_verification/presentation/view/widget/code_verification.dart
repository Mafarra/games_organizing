import 'package:flutter/material.dart';
import '../../../../../config/constants.dart';
import '../../../../../core/resources/manager_color.dart';
import '../../../../../core/resources/managers_size.dart';

class CodeVerification extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode previousFocusNode;
  final void Function(String value) onChanged;
  final String? Function(String?)? validator;

  const CodeVerification({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.previousFocusNode,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color enabledBorderColor = ManagerColors.enabledBorderInputVerification;
    return Expanded(
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        validator: validator,
        keyboardType: TextInputType.number,
        maxLength: Constants.codeVerificationMaxLine,
        textInputAction: TextInputAction.done,
        // cursorHeight: 25,
        cursorColor: ManagerColors.primaryColor,
        onChanged: (value) {
          onChanged(value);
          if (value.isEmpty) {
            previousFocusNode.requestFocus();
          } 
          //TODO: this should be done in the controller and called in view.
          // else if (value.isNotEmpty) {
          //   enabledBorderColor = ManagerColors.primaryColor;
          // }
        },
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            isDense: false,
            isCollapsed: false,
            filled: true,
            fillColor: ManagerColors.fillInputVerification,
            counterText: '',
            focusedBorder: OutlineInputBorder(
              gapPadding: 30,
              borderRadius: BorderRadius.circular(
                ManagerRadius.r10,
              ),
              borderSide: BorderSide(
                width: ManagerWidth.w1,
                color: ManagerColors.focusedBorderInputVerification,
              ),
            ),
            border: OutlineInputBorder(
              gapPadding: 30,
              borderRadius: BorderRadius.circular(
                ManagerRadius.r10,
              ),
              borderSide: BorderSide(
                width: ManagerWidth.w1,
                color: Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
                gapPadding: 30,
                borderRadius: BorderRadius.circular(
                  ManagerRadius.r10,
                ),
                borderSide: BorderSide(
                  color: enabledBorderColor,
                ))),
      ),
    );
  }
}
