import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

// ignore: must_be_immutable
class SelectTextList extends StatefulWidget {
  final List<String> textList;
  int initialSelected;
  final ValueChanged onSelect;
  final TextStyle textStyle;

  SelectTextList({
    Key? key,
    required this.textList,
    this.initialSelected = 0,
    required this.onSelect,
    required this.textStyle,
  }) : super(key: key);

  @override
  _SelectTextListState createState() => _SelectTextListState();
}

class _SelectTextListState extends State<SelectTextList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        widget.textList.length,
        (index) {
          return GestureDetector(
            onTap: () {
              widget.initialSelected = index;
              widget.onSelect(widget.initialSelected);
              setState(() {});
            },
            child: UnderlineTextWidget(
              text: widget.textList[index],
              isSelected: widget.initialSelected == index,
              textStyle: widget.textStyle,
            ),
          );
        },
      ),
    );
  }
}

class UnderlineTextWidget extends StatelessWidget {
  final String text;
  final bool? isSelected;
  final TextStyle textStyle;

  const UnderlineTextWidget({
    Key? key,
    required this.text,
    bool? isSelected,
    required this.textStyle,
  })  : this.isSelected = isSelected ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: textStyle.copyWith(
            color: isSelected! ? AppColors.greenColor : AppColors.greyColor,
          ),
        ),
        Container(
          height: 2,
          margin: EdgeInsets.only(top: 3),
          width: getSize(context).width,
          color: isSelected! ? AppColors.greenColor : Colors.transparent,
        )
      ],
    );
  }

  Size getSize(BuildContext context) {
    return (TextPainter(
      text: TextSpan(
        text: text,
        style: textStyle.copyWith(
          color: isSelected! ? AppColors.greenColor : AppColors.greyColor,
        ),
      ),
      maxLines: 1,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      textDirection: TextDirection.ltr,
    )..layout())
        .size;
  }
}
