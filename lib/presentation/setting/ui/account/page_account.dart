import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zporter_preview/presentation/setting/ui/widget/widget_common_slider.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  double currentSliderValue = 0;
  List<String> energyLevel = [
    'No football today',
    'Other',
    'Gym',
    'Personal Trainer',
    'Team Training',
    'Match'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          CommonSlider(
            divisionNum: 5,
            // minValue: 1,
            // maxValue: 6,
            // currentSliderValue: 3,
            onChange: (valueNode) {
              print('$valueNode');
            },
            // levelList: energyLevel,
          ),
        ],
      ),
    );
  }
}
