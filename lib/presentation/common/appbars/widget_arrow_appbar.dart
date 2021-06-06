import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';
import 'package:zporter_preview/gen/assets.gen.dart';
import 'package:zporter_preview/presentation/common/buttons/widget_circle_border_splash_button.dart';

class ArrowAppBar extends StatelessWidget {
  final String title;
  final bool isShowSearch;
  final VoidCallback? onSearchTap;

  const ArrowAppBar({
    Key? key,
    this.title = '',
    this.isShowSearch = false,
    this.onSearchTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: AppColors.blackColor,
      height: 56,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleBorderSplashButton(
            onTap: () {
              Navigator.pop(context);
            },
            icon: Assets.images.keyboardArrowLeft24px.svg(),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
          Visibility(
            visible: isShowSearch,
            child: Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: CircleBorderSplashButton(
                  onTap: onSearchTap ?? () {},
                  icon: Assets.images.searchIcon.svg(),
                  padding: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
