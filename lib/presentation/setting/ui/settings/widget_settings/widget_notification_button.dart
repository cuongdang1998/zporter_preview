import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotificationButton extends StatefulWidget {
  bool isSelected;
  final VoidCallback onTap;

  NotificationButton({
    Key? key,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  _NotificationButtonState createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isSelected = !widget.isSelected;
        });
        widget.onTap();
      },
      child: Container(
        width: 38,
        height: 20,
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 38,
                height: 14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black38,
                ),
              ),
            ),
            AnimatedContainer(
              alignment: widget.isSelected
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              child: ClipOval(
                child: Container(
                  width: 20,
                  height: 20,
                  color: widget.isSelected ? Colors.blue : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
