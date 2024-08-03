import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AppStyles {
  // Gilda Display Regular
  static TextStyle gilda400(context) {
    return const TextStyle(
      color: Color(0xff181725),
      fontFamily: 'GildaDisplay',
      fontWeight: FontWeight.w400,
    );
  }

  // Gilda Display Medium
  static TextStyle gilda500(context) {
    return const TextStyle(
      color: Color(0xff181725),
      fontFamily: 'GildaDisplay',
      fontWeight: FontWeight.w500,
    );
  }

  // Gilda Display Bold
  static TextStyle gilda700(context) {
    return const TextStyle(
      color: Color(0xff181725),
      fontFamily: 'GildaDisplay',
      fontWeight: FontWeight.w700,
    );
  }

// Abhaya Libre Regular
  static TextStyle abhayaLibre400(context) {
    return const TextStyle(
      color: Color(0xff181725),
      fontFamily: 'AbhayaLibre',
      fontWeight: FontWeight.w400,
    );
  }

// Abhaya Libre Medium
  static TextStyle abhayaLibre500(context) {
    return const TextStyle(
      color: Color(0xff181725),
      fontFamily: 'AbhayaLibre',
      fontWeight: FontWeight.w500,
    );
  }

  // Abhaya Libre Medium
  static TextStyle abhayaLibre700(context) {
    return const TextStyle(
      color: Color(0xff181725),
      fontFamily: 'AbhayaLibre',
      fontWeight: FontWeight.w700,
    );
  }

// EduAUVICWANTHand Regular
  static TextStyle eduAUVICWANTHand400(context) {
    return const TextStyle(
      color: Color(0xff181725),
      fontFamily: 'EduAUVICWANTHand',
      fontWeight: FontWeight.w400,
    );
  }

// EduAUVICWANTHand Medium
  static TextStyle eduAUVICWANTHand500(context) {
    return const TextStyle(
      color: Color(0xff181725),
      fontWeight: FontWeight.w500,
      fontFamily: 'EduAUVICWANTHand',
    );
  }

  // EduAUVICWANTHand Bold
  static TextStyle eduAUVICWANTHand700(context) {
    return const TextStyle(
      color: Color(0xff181725),
      fontFamily: 'EduAUVICWANTHand',
      fontWeight: FontWeight.w700,
    );
  }

  // Montserrat Regular
  static TextStyle montserrat400(context) {
    return const TextStyle(
      color: Color(0xff181725),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    );
  }

  //  Montserrat Medium
  static TextStyle montserrat500(context) {
    return const TextStyle(
      color: Color(0xff181725),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
    );
  }

  //  Montserrat Bold
  static TextStyle montserrat700(context) {
    return const TextStyle(
      color: Color(0xff181725),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
    );
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  // كانت 1.2
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  //  MediaQuery طريقه تانيه علشان نجيب العرض والطول زي ال
//  hot restart  محتاج اعمل  dispatcher  انما ال  rebuild    بتعمل  MediaQuery الفرق ان ال
  // فيديو 77 د 14
  //  لانه مش هيعمل تغير في العرض والارتفاع dispatcher  لو هعمل للموبايل والتابلت بس استخدم ال
  var dispatcher = PlatformDispatcher.instance;
  var physicalWidth = dispatcher.views.first.physicalSize.width;
  var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  double width = physicalWidth / devicePixelRatio;
  return width;
}
