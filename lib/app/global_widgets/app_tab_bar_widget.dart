import 'package:flutter/material.dart';

import '../core/values/export/export_values.dart';

class AppTabBarWidget extends StatelessWidget {
  final List<AppTabBarItem> items;
  final int selectedIndex;
  final void Function(int) onTap;
  final bool isBottomIndicator;

  const AppTabBarWidget({
    Key? key,
    required this.items,
    required this.selectedIndex,
    required this.onTap,
    this.isBottomIndicator = false,
  })  : assert(items.length <= 5),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.height60,
      child: Row(
        children: [
          ...items
              .asMap()
              .map(
                (int index, AppTabBarItem item) {
                  return MapEntry(
                    index, // Important
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          onTap(index);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon
                            if (item.icon != null)
                              Icon(
                                item.icon,
                                color: index == selectedIndex ? AppColors.primary : AppColors.gray02,
                                size: AppDimensions.iconSize30,
                              ),

                            // Text
                            if (item.text != null)
                              Text(
                                item.text ?? '',
                                maxLines: 1,
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
              .values
              .toList(),
        ],
      ),
    );
  }
}

class AppTabBarItem {
  final String? text;
  final IconData? icon;

  AppTabBarItem({
    this.text,
    this.icon,
  });
}
