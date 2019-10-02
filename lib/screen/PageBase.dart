import 'package:flutter/material.dart';

abstract class PageBase extends StatelessWidget {
  static const String LOGO_IMAGE = "assets/images/logo.png";
  static const String BONE_IMAGE = "assets/images/bone.png";
  static const String FACEBOOK_ICON_IMAGE = "assets/images/fb-icon.png";

  static InputDecoration generateDecorate(String label){
    return InputDecoration(
                  labelText: label,
                  labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 20)
            );
  }
}