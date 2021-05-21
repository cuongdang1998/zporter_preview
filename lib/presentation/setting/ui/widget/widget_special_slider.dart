import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

final double _levelPdLeft = 15;
final double _levelPdRight = 15;

class SpecialSlider extends StatefulWidget {
  final double currentSliderValue;
  final int divisionNum;
  final double minValue;
  final double maxValue;
  final List<String> levelList;
  final ValueChanged onChange;
  final String measureUnit;

  SpecialSlider({
    Key? key,
    double? currentSliderValue,
    required this.divisionNum,
    double? minValue,
    this.maxValue = 100,
    List<String>? levelList,
    required this.onChange,
    this.measureUnit = '',
  })  : this.levelList = levelList ?? [],
        this.minValue = minValue ?? 0,
        this.currentSliderValue = currentSliderValue ?? minValue ?? 0,
        super(key: key);

  @override
  _SpecialSliderState createState() => _SpecialSliderState();
}

class _SpecialSliderState extends State<SpecialSlider> {
  List<TextItem> levelTextItemList = [];
  int selectedIndex = 0;
  late double _currentValue;

  @override
  void initState() {
    _currentValue = widget.currentSliderValue;
    if (widget.levelList.isNotEmpty) {
      selectedIndex = _getSelectedIndex();
      for (var levelText in widget.levelList) {
        levelTextItemList.add(TextItem(text: levelText));
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
                  value: _currentValue,
                  min: widget.minValue,
                  max: widget.maxValue,
                  divisions: widget.divisionNum,
                  onChanged: (double value) {
                    selectedIndex = _getSelectedIndex();
                    setState(() {
                      _currentValue = value;
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
                                  ),
                                )
                              : Positioned(
                                  top: 0,
                                  left: _getPositionLevelText(size, levelItem),
                                  child: LevelTextWidget(
                                    isSelected: selectedIndex ==
                                        widget.levelList.indexOf(levelItem),
                                    levelText: levelItem,
                                  ),
                                ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.levelList.isEmpty,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: _levelPdRight),
              child: Text(
                '${_currentValue.toInt()} ${widget.measureUnit}',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        )
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
    return ((_currentValue / widget.maxValue) * widget.divisionNum).toInt();
  }
}

class LevelTextWidget extends StatelessWidget {
  final String levelText;
  final bool? isSelected;

  const LevelTextWidget({
    Key? key,
    required this.levelText,
    bool? isSelected,
  })  : this.isSelected = isSelected ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      levelText,
      style: TextStyle(
        fontSize: 7,
        color: isSelected! ? AppColors.greenColor : AppColors.black,
      ),
    );
  }
}

class TextItem {
  final String text;
  TextStyle textStyle = TextStyle(
    fontSize: 7,
  );

  TextItem({required this.text});

  Size getSize(BuildContext context) {
    return (TextPainter(
      text: TextSpan(
        text: text,
        style: textStyle,
      ),
      maxLines: 1,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      textDirection: TextDirection.ltr,
    )..layout())
        .size;
  }
}
