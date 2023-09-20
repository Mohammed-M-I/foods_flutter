import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppRoutingUtils {
  static Future<T?>? toNamed<T>(
    String page, {
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    return Get.toNamed(
      page,
      arguments: arguments,
      id: id,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
    );
  }

  static Future<T?>? offNamed<T>(
    String page, {
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    return Get.offNamed(
      page,
      arguments: arguments,
      id: id,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
    );
  }

  static Future<T?>? offAllNamed<T>(
    String newRouteName, {
    RoutePredicate? predicate,
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) {
    return Get.offAllNamed(
      newRouteName,
      predicate: predicate,
      arguments: arguments,
      id: id,
      parameters: parameters,
    );
  }

  static void back<T>({
    T? result,
    bool closeOverlays = false,
    bool canPop = true,
    int? id,
  }) {
    Get.back(
      result: result,
      closeOverlays: closeOverlays,
      canPop: canPop,
      id: id,
    );
  }
}
