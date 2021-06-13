import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';
import 'package:zporter_preview/presentation/media_picker/bloc/media_picker_bloc.dart';

class PathText extends StatelessWidget {
  final String pathName;
  final int index;
  final MediaPickerBloc bloc;

  const PathText({
    Key? key,
    required this.pathName,
    required this.index,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (pathName != bloc.path.name) {
          bloc.add(SelectAnotherPathEvent(pathIndex: index));
        }
        Navigator.pop(context);
      },
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: 16,
          ),
          child: Text(
            pathName,
            style: TextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
      ),
    );
  }
}
