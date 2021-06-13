import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zporter_preview/config/colors.dart';
import 'package:zporter_preview/presentation/common/buttons/widget_app_common_button.dart';
import 'package:zporter_preview/presentation/media_picker/bloc/media_picker_bloc.dart';
import 'package:zporter_preview/presentation/media_picker/ui/widget/widget_last_selected_media.dart';

import 'widget/widget_gridview_media.dart';
import 'widget/widget_pick_media_bar.dart';

class MediaPickerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MediaPickerBloc>();
    return Scaffold(
      backgroundColor: AppColors.black2Color,
      body: Column(
        children: [
          PickMediaBar(),
          Expanded(
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: BlocBuilder<MediaPickerBloc, MediaPickerState>(
                        bloc: bloc,
                        builder: (context, state) => LastSelectedMedia(),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    )
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  // color: AppColors.greyCardColor,
                  child: DraggableScrollableSheet(
                    initialChildSize: 0.5,
                    minChildSize: 0.5,
                    maxChildSize: 0.99,
                    expand: true,
                    builder: (context, scrollController) => Container(
                      color: AppColors.greyCardColor,
                      child: Stack(
                        children: [
                          GridViewMedia(
                            scrollController: scrollController,
                          ),
                          buildButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildButton() => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 10,
            left: 16,
            right: 16,
          ),
          child: AppCommonButton(
            heightButton: 36,
            textButton: 'Next',
            onPress: () {},
          ),
        ),
      );
}
