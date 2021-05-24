import 'package:flutter/material.dart';

class ScreenPieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffeceaeb),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: ListView(
          children: <Widget>[
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Pie Chart',
                  style: TextStyle(
                      color: Color(
                        0xff333333,
                      ),
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // CustomPieChart(
            //   chartWidth: 50,
            //   chartHeight: 50,
            //   centerSpaceRadius: 15,
            //   outsideRadius: 10,
            //   percent: [12, 53, 27, 8, 7],
            // ),
          ],
        ),
      ),
    );
  }
}
