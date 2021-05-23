import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

class PopUpDialog {
  static void showOptionDialog(BuildContext context) {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierDismissible: false,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
      builder: (_) {
        return Stack(
          children: [
            Positioned(
              left: 15,
              right: 40,
              bottom: 40,
              child: Container(
                padding: EdgeInsets.only(
                  left: 25,
                  right: 30,
                  top: 20,
                  bottom: 30,
                ),
                height: 345,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.blackColor,
                ),
                child: Column(
                  children: <Widget>[],
                ),
              ),
            ),
            Positioned(
              bottom: 33,
              right: 33,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  size: 20,
                  color: AppColors.whiteColor,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
