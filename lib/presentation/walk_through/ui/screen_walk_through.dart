import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zporter_preview/config/colors.dart';
import 'package:zporter_preview/gen/assets.gen.dart';
import 'package:zporter_preview/presentation/walk_through/bloc/walk_through_bloc.dart';
import 'package:zporter_preview/presentation/walk_through/ui/widget/widget_row_dots.dart';

import 'widget/widget_bottom_row_botton.dart';
import 'widget/widget_common_walk_through_page.dart';

class WalkThroughScreen extends StatefulWidget {
  @override
  _WalkThroughScreenState createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  late WalkThroughBloc _bloc;
  late Timer _timer;

  @override
  void initState() {
    _bloc = BlocProvider.of(context);
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer t) {
      _bloc.add(ChangePageEvent());
    });
    super.initState();
  }

  @override
  void dispose() {
    _bloc.pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _bloc.pageController,
              onPageChanged: (pageIndex) {
                _bloc.add(ScrollPageEvent(pageIndex: pageIndex));
              },
              children: [
                CommonWalkThroughPage(
                  titleText: 'Connect your football data',
                  descriptionText: textPageOne,
                  imageWidget: Assets.images.pageImageOne,
                ),
                CommonWalkThroughPage(
                  titleText: 'Global Visible',
                  descriptionText: textPageOne,
                  imageWidget: Assets.images.pageImageTwo,
                ),
                CommonWalkThroughPage(
                  titleText: 'Free Career Support',
                  descriptionText: textPageOne,
                  imageWidget: Assets.images.pageImageThree,
                ),
              ],
              scrollDirection: Axis.horizontal,
            ),
          ),
          RowDots(),
          BottomRowButton(),
        ],
      ),
    );
  }
}

String textPageOne =
    "Zporter to help you log your trainings,\nmatches, awards and trophies etc.\nWhich you can benchmark with your peers.\nFor you to make the most out of your\nFootball Life";
String textPageTwo =
    "Zporter to help you log your trainings,\nmatches, awards and trophies etc.\nWhich you can benchmark with your peers.\nFor you to make the most out of your\nFootball Life";
String textPageThree =
    "Zporter to help you log your trainings,\nmatches, awards and trophies etc.\nWhich you can benchmark with your peers.\nFor you to make the most out of your\nFootball Life";
