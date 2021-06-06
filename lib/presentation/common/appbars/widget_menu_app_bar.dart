import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';
import 'package:zporter_preview/gen/assets.gen.dart';
import 'package:zporter_preview/presentation/common/buttons/widget_circle_border_splash_button.dart';

class MenuAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onSearchTap;
  final VoidCallback onNotiTap;
  final VoidCallback onTapMenu;

  const MenuAppBar({
    Key? key,
    this.title = '',
    required this.onSearchTap,
    required this.onNotiTap,
    required this.onTapMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).padding.top,
          color: AppColors.black2Color,
        ),
        Container(
          color: AppColors.blackColor,
          height: 56,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleBorderSplashButton(
                onTap: onTapMenu,
                icon: Assets.images.menuIcon.svg(),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          bottom: 0,
                          right: 49,
                          child: CircleBorderSplashButton(
                            onTap: onNotiTap,
                            icon: Assets.images.bellNotiIcon.svg(),
                            padding: 15,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: CircleBorderSplashButton(
                            onTap: onSearchTap,
                            icon: Assets.images.searchIcon.svg(),
                            padding: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
