import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zporter_preview/config/colors.dart';
import 'package:zporter_preview/gen/assets.gen.dart';
import 'package:zporter_preview/presentation/common/buttons/widget_circle_border_splash_button.dart';
import 'package:zporter_preview/presentation/media_picker/bloc/media_picker_bloc.dart';

import 'widget_path_text.dart';

class PickMediaBar extends StatelessWidget {
  const PickMediaBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MediaPickerBloc>();
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).padding.top,
          color: AppColors.black2Color,
        ),
        BlocBuilder<MediaPickerBloc, MediaPickerState>(
          bloc: bloc,
          builder: (context, snapshot) {
            return Container(
              height: 56,
              width: double.infinity,
              color: AppColors.blackColor,
              child: Stack(
                children: [
                  CircleBorderSplashButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    icon: Assets.images.keyboardArrowLeft24px.svg(),
                  ),
                  buildSelectPath(bloc, context),
                  buildRightButtons(bloc)
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Align buildRightButtons(MediaPickerBloc bloc) => Align(
        alignment: Alignment.centerRight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.images.addImageIcon.svg(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Assets.images.openCameraIcon.svg(),
            )
          ],
        ),
      );

  Center buildSelectPath(MediaPickerBloc bloc, BuildContext context) => Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                _selectPath(context, bloc);
              },
              child: Text(
                bloc.pathName,
                style: TextStyle(color: AppColors.whiteColor),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  _selectPath(context, bloc);
                },
                customBorder: CircleBorder(),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Assets.images.arrowDownIcon.svg(),
                ),
              ),
            )
          ],
        ),
      );

  void _selectPath(BuildContext context, MediaPickerBloc bloc) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Container(
          height: MediaQuery.of(context).size.height -
              56 -
              MediaQuery.of(context).padding.top,
          color: AppColors.black2Color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              bloc.assetPathList.length,
              (index) => PathText(
                pathName: '${bloc.assetPathList[index].name}',
                index: index,
                bloc: bloc,
              ),
            ),
          ),
        );
      },
    );
  }
}
