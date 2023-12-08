import 'package:flutter/material.dart';

Widget customizedTextFormCategory({
  required TextEditingController controller,
  required String hintText,
  double width=90,
  textType =TextInputType.text,
})=>SizedBox(
  width: width,
  height: 50,
  child: Material(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const BorderSide(color: Colors.grey, ),
    ),
    color: Colors.white,
    child: TextFormField(
      textAlign: TextAlign.center,
      decoration:
      InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
          isDense: true,
      ),
      controller: controller,
      keyboardType:textType ,
    ),
  ),
);