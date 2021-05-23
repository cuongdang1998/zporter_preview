import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

class AddPhoto extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double photoWidth;
  final double photoHeight;
  final File? photo;

  const AddPhoto({
    Key? key,
    required this.title,
    required this.onTap,
    this.photo,
    this.photoWidth = double.infinity,
    this.photoHeight = 160,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColors.greyColor,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              height: photoHeight,
              width: photoWidth,
              decoration: BoxDecoration(
                color: AppColors.black1Color,
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: photo != null
                    ? Image.file(
                        photo!,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_a_photo_outlined,
                            color: AppColors.greyColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              "Add photo",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: AppColors.greyColor,
                              ),
                            ),
                          )
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
