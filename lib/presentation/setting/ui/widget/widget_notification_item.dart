import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:zporter_preview/config/colors.dart';
import 'package:zporter_preview/gen/assets.gen.dart';

class NotificationItem extends StatefulWidget {
  @override
  _NotificationItemState createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  late final SlidableController _slidableController;
  late bool _isOpen;

  @override
  void initState() {
    _isOpen = false;
    _slidableController = SlidableController(
      onSlideAnimationChanged: handleSlideAnimationChanged,
      onSlideIsOpenChanged: handleSlideIsOpenChanged,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.16,
      controller: _slidableController,
      child: NotificationContent(
        avatarImage: Assets.images.mypic,
        notifyContent:
            'I love you more than I can say. Come with me my babe. I will care you all my life from the bottom of my heart.',
        notifyName: 'quoccuong',
        notifyTime: DateTime(2021, 05, 21, 13, 10, 22),
        isOpen: _isOpen,
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          color: AppColors.blackColor,
          iconWidget: Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.blackColor,
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.block,
                      color: Colors.red,
                    )),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    color: AppColors.whiteColor,
                    width: 1,
                    height: 50,
                  ),
                )
              ],
            ),
          ),
          onTap: () => _showSnackBar(context, 'Block'),
        ),
        IconSlideAction(
          color: AppColors.blackColor,
          iconWidget: Icon(
            Icons.delete_sweep_outlined,
            color: Colors.white,
          ),
          onTap: () => _showSnackBar(context, 'Delete'),
        ),
      ],
    );
  }

  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }

  void handleSlideIsOpenChanged(bool? isOpen) {
    _isOpen = isOpen!;
    setState(() {});
  }

  void handleSlideAnimationChanged(Animation<double>? slideAnimation) {}
}

class NotificationContent extends StatelessWidget {
  final AssetGenImage avatarImage;
  final String notifyName;
  final String notifyContent;
  final DateTime notifyTime;
  final bool isOpen;

  NotificationContent({
    Key? key,
    required this.avatarImage,
    required this.notifyName,
    required this.notifyContent,
    required this.notifyTime,
    this.isOpen = false,
  }) : super(key: key);

  String getNotifyTime() {
    var days = DateTime.now().difference(this.notifyTime).inDays;
    var hours = DateTime.now().difference(this.notifyTime).inHours;
    var minutes = DateTime.now().difference(this.notifyTime).inMinutes;
    var seconds = DateTime.now().difference(this.notifyTime).inSeconds;
    if (days == 1) {
      return '$days day ago';
    } else if (days > 1) {
      return '$days days ago';
    } else if (hours == 1) {
      return '$hours hour ago';
    } else if (hours > 1) {
      return '$hours hours ago';
    } else if (minutes >= 1) {
      return '$minutes min ago';
    } else {
      return '$seconds sec ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: avatarImage.image(
                fit: BoxFit.fill,
                width: 42,
                height: 42,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                      ),
                      child: Text(
                        '#$notifyName',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Icon(
                      Icons.access_time,
                      size: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        getNotifyTime(),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Spacer(),
                    Visibility(
                      visible: !isOpen,
                      child: GestureDetector(
                        onTap: () {
                          Slidable.of(context)!
                              .open(actionType: SlideActionType.secondary);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Icon(Icons.more_horiz),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Text(
                    notifyContent,
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
