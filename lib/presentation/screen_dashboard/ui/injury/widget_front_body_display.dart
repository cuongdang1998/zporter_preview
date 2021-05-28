import 'package:flutter/material.dart';
import 'package:zporter_preview/config/constants.dart';
import 'package:zporter_preview/gen/assets.gen.dart';
import 'package:zporter_preview/presentation/screen_dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zporter_preview/presentation/screen_dashboard/ui/injury/widget_list_pointed_injury.dart';
import 'widget_list_tap_item_injury.dart';
import 'model_injury_type.dart';

class FrontBodyDisplay extends StatefulWidget {
  const FrontBodyDisplay({
    Key? key,
    this.enableTapInjury = true,
    required this.boxKey,
  }) : super(key: key);
  final bool? enableTapInjury;
  final GlobalKey boxKey;

  @override
  _FrontBodyDisplayState createState() => _FrontBodyDisplayState();
}

class _FrontBodyDisplayState extends State<FrontBodyDisplay> {
  Size imageSize = Size(0, 0);
  double scaleWidthRate = 0;
  double scaleHeightRate = 0;
  late DashboardBloc bloc;

  @override
  void initState() {
    bloc = context.read<DashboardBloc>();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final RenderBox? renderBoxRed =
          widget.boxKey.currentContext!.findRenderObject() as RenderBox?;
      final Size size = renderBoxRed!.size;
      getScaleSize(size);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, snapshot) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            key: widget.boxKey,
            child: GestureDetector(
              onTapDown: (detail){
                print('detail ${detail.localPosition}');
              },
              child: Stack(
                children: [
                  Assets.images.frontBody.image(
                    height: imageSize.height,
                    width: imageSize.width,
                  ),
                  ListPointedInjury(
                    scaleWidthRate: scaleWidthRate,
                    scaleHeightRate: scaleHeightRate,
                    listPointedInjuries: bloc.listPointedInjuries
                        .where((injuryModel) =>
                            injuryModel.injuryType.originalInjuryParam.isFront)
                        .toList(),
                  ),

                  /// Tap injury area position
                  Visibility(
                    visible: widget.enableTapInjury!,
                    child: ListTapItemInjury(
                      scaleHeightRate: scaleHeightRate,
                      scaleWidthRate: scaleWidthRate,
                      listDefinedInjuries: bloc.listDefinedInjuries
                          .where((injuryType) =>
                              injuryType.originalInjuryParam.isFront)
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void getScaleSize(Size size) {
    double scaleWidth = size.width / Constants.frontImageWidth;
    double scaleHeight = size.height / Constants.frontImageHeight;
    double scaleImage = scaleHeight < scaleWidth ? scaleHeight : scaleWidth;

    imageSize = Size(
      Constants.frontImageWidth * scaleImage,
      Constants.frontImageHeight * scaleImage,
    );
    scaleWidthRate = imageSize.width / Constants.frontImageWidth;
    scaleHeightRate = imageSize.height / Constants.frontImageHeight;
  }
}
