import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

final double _levelPdLeft = 15;
final double _levelPdRight = 15;

class CommonSlider extends StatefulWidget {
  final double currentSliderValue;
  final int divisionNum;
  final double minValue;
  final double maxValue;
  final List<String> levelList;
  final ValueChanged onChange;
  final String measureUnit;
  final bool isShowStar;

  CommonSlider({
    Key? key,
    double? currentSliderValue,
    List<String>? levelList,
    required this.divisionNum,
    this.minValue = 0,
    this.maxValue = 100,
    required this.onChange,
    this.measureUnit = '%',
    this.isShowStar = false,
  })  : this.levelList = levelList ?? [],
        this.currentSliderValue = currentSliderValue ?? minValue,
        super(key: key);

  @override
  _CommonSliderState createState() => _CommonSliderState();
}

class _CommonSliderState extends State<CommonSlider> {
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
          visible: widget.levelList.isEmpty && !widget.isShowStar,
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
                  _currentValue % 2 != 0
                      ? (_currentValue ~/ 2) + 1
                      : _currentValue ~/ 2,
                  (index) {
                    return (index == (_currentValue ~/ 2) &&
                            _currentValue % 2 != 0)
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
        fontSize: 8,
        color: isSelected! ? AppColors.greenColor : AppColors.black,
      ),
    );
  }
}

class TextItem {
  final String text;
  TextStyle textStyle = TextStyle(
    fontSize: 8,
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
