import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

final double _levelPdLeft = 15;
final double _levelPdRight = 15;

// ignore: must_be_immutable
class CommonSlider extends StatefulWidget {
  double currentSliderValue;
  final int divisionNum;
  final double minValue;
  final double maxValue;
  final List<String> levelList;
  final ValueChanged onChange;
  final String measureUnit;
  final bool isShowStar;
  final TextStyle textStyle;

  CommonSlider({
    Key? key,
    double? currentSliderValue,
    List<String>? levelList,
    TextStyle? textStyle,
    required this.divisionNum,
    this.minValue = 0,
    this.maxValue = 100,
    required this.onChange,
    this.measureUnit = '%',
    this.isShowStar = false,
  })  : this.levelList = levelList ?? [],
        this.currentSliderValue = currentSliderValue ?? minValue,
        this.textStyle = TextStyle(
          fontSize: 8,
          color: AppColors.whiteColor,
        ),
        super(key: key);

  @override
  _CommonSliderState createState() => _CommonSliderState();
}

class _CommonSliderState extends State<CommonSlider> {
  List<LevelTextWidget> levelTextItemList = [];
  int selectedIndex = 0;

  @override
  void initState() {
    if (widget.levelList.isNotEmpty) {
      selectedIndex = _getSelectedIndex();
      for (var levelText in widget.levelList) {
        levelTextItemList.add(LevelTextWidget(
          levelText: levelText,
          textStyle: widget.textStyle,
        ));
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              SliderTheme(
                data: SliderThemeData(
                  thumbColor: AppColors.greenColor,
                  thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 7,
                  ),

                  /// Overlay radius = 15 => height of slide => 30
                  overlayShape: RoundSliderOverlayShape(
                    overlayRadius: 15.0,
                  ),
                  trackHeight: 0.5,
                  activeTickMarkColor: Colors.transparent,
                  inactiveTickMarkColor: Colors.transparent,
                  inactiveTrackColor: AppColors.greyColor,
                  // tickMarkShape: RoundSliderTickMarkShape(
                  //   tickMarkRadius: 5,
                  // ),
                  showValueIndicator: ShowValueIndicator.never,
                ),
                child: Slider(
                  value: widget.currentSliderValue,
                  min: widget.minValue,
                  max: widget.maxValue,
                  divisions: widget.divisionNum,
                  onChanged: (double value) {
                    selectedIndex = _getSelectedIndex();
                    setState(() {
                      widget.currentSliderValue = value;
                      selectedIndex = _getSelectedIndex();
                    });
                    widget.onChange(value);
                  },
                  activeColor: AppColors.greenColor,
                  autofocus: true,
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: widget.levelList.isNotEmpty,
          child: Padding(
            padding: EdgeInsets.only(
              left: _levelPdLeft,
              right: _levelPdRight,
            ),
            child: Container(
              height: 30,
              child: Stack(
                children: widget.levelList
                    .map(
                      (levelItem) => widget.levelList.indexOf(levelItem) == 0
                          ? Positioned(
                              left: 0,
                              child: LevelTextWidget(
                                isSelected: selectedIndex ==
                                    widget.levelList.indexOf(levelItem),
                                levelText: levelItem,
                                textStyle: widget.textStyle,
                              ),
                            )
                          : widget.levelList.indexOf(levelItem) ==
                                  widget.levelList.length - 1
                              ? Positioned(
                                  right: 0,
                                  child: LevelTextWidget(
                                    isSelected: selectedIndex ==
                                        widget.levelList.indexOf(levelItem),
                                    levelText: levelItem,
                                    textStyle: widget.textStyle,
                                  ),
                                )
                              : Positioned(
                                  top: 0,
                                  left: _getPositionLevelText(size, levelItem),
                                  child: LevelTextWidget(
                                    isSelected: selectedIndex ==
                                        widget.levelList.indexOf(levelItem),
                                    levelText: levelItem,
                                    textStyle: widget.textStyle,
                                  ),
                                ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.levelList.isEmpty && !widget.isShowStar,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: _levelPdRight),
              child: Text(
                '${widget.currentSliderValue.toInt()} ${widget.measureUnit}',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.isShowStar,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: _levelPdRight),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  widget.currentSliderValue % 2 != 0
                      ? (widget.currentSliderValue ~/ 2) + 1
                      : widget.currentSliderValue ~/ 2,
                  (index) {
                    return (index == (widget.currentSliderValue ~/ 2) &&
                            widget.currentSliderValue % 2 != 0)
                        ? Icon(
                            Icons.star_half,
                            size: 12,
                            color: AppColors.greyColor,
                          )
                        : Icon(
                            Icons.star,
                            size: 12,
                            color: AppColors.greyColor,
                          );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _getPositionLevelText(size, levelItem) {
    return ((size.width - (_levelPdLeft + _levelPdRight)) /
                widget.divisionNum) *
            widget.levelList.indexOf(levelItem) -
        (levelTextItemList[widget.levelList.indexOf(levelItem)]
                .getSize(context)
                .width /
            2);
  }

  int _getSelectedIndex() {
    return ((widget.currentSliderValue / widget.maxValue) * widget.divisionNum)
        .toInt();
  }
}

class LevelTextWidget extends StatelessWidget {
  final String levelText;
  final bool? isSelected;
  final TextStyle textStyle;

  const LevelTextWidget({
    Key? key,
    required this.levelText,
    bool? isSelected,
    required this.textStyle,
  })  : this.isSelected = isSelected ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      levelText,
      style: textStyle.copyWith(
        color: isSelected! ? AppColors.greenColor : AppColors.whiteColor,
      ),
    );
  }

  Size getSize(BuildContext context) {
    return (TextPainter(
      text: TextSpan(
        text: levelText,
        style: textStyle.copyWith(
          color: isSelected! ? AppColors.greenColor : AppColors.whiteColor,
        ),
      ),
      maxLines: 1,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      textDirection: TextDirection.ltr,
    )..layout())
        .size;
  }
}
