import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zporter_preview/presentation/media_picker/bloc/media_picker_bloc.dart';
import 'widget_media_item.dart';

class GridViewMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MediaPickerBloc>();
    return BlocBuilder<MediaPickerBloc, MediaPickerState>(
      bloc: bloc,
      buildWhen: (pre, cur) =>
          cur is GetAllMediaResourceState || cur is SelectOrUnSelectMediaState,
      builder: (context, state) => Scrollbar(
        child: Padding(
          padding: EdgeInsets.only(right: 16, left: 16, bottom: 10),
          child: GridView.builder(
            itemCount: bloc.assetEntityList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 4,
            ),
            itemBuilder: (context, index) => buildAssetItem(
              bloc.assetEntityList[index],
              bloc,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAssetItem(AssetEntity entity, MediaPickerBloc bloc) =>
      GestureDetector(
        onTap: () {
          bloc.add(
            SelectOrUnSelectMediaEvent(
              assetEntity: entity,
            ),
          );
        },
        child: MediaItemWidget(
          key: ValueKey(entity),
          entity: entity,
          option: ThumbOption(
            width: 300,
            height: 300,
            format: ThumbFormat.png,
          ),
          checkStatus: bloc.selectedAssetList.contains(
            entity,
          ),
          onChange: (value) {
            bloc.add(
              SelectOrUnSelectMediaEvent(
                assetEntity: entity,
              ),
            );
          },
        ),
      );
}
