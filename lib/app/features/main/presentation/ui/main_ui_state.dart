import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../core/values/app_strings.dart';
import '../../../../global_widgets/export/export_global_widgets.dart';
import '../../../home/presentation/home_page.dart';
import '../../../orders/presentation/orders_page.dart';
import '../../../profile/presentation/profile_page.dart';


class MainUiState {
  final int selectedIndex;

  final items = <AppTabBarItem>[
    AppTabBarItem(
      icon: Icons.home,
      text: AppStrings.home.tr,
    ),
    AppTabBarItem(
      icon: MdiIcons.notebook,
      text: AppStrings.orders.tr,
    ),
    AppTabBarItem(
      icon: MdiIcons.account,
      text: AppStrings.profile.tr,
    ),
  ];

  final pages = <GetView>[
    const HomePage(),
    const OrdersPage(),
    const ProfilePage(),
  ];

  MainUiState({
    required this.selectedIndex,
  });

  MainUiState.defaultObj()
      : this(
          selectedIndex: 0,
        );

  MainUiState copyWith({
    int? selectedIndex,
  }) =>
      MainUiState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
      );
}
