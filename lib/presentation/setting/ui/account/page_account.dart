import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';
import 'package:zporter_preview/presentation/setting/ui/widget/widget_common_slider.dart';

import 'widget/widget_expansion_custom.dart';
import 'widget/widget_textfield_tags.dart';

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
  List<bool> expansionPanelStatus = [true, true];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
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
              ExpandableNotifier(
                child: ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanelCustom(
                    header: Text("Expandable"),
                    collapsed: Text(
                      loremIpsum,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // collapsed: Container(),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        for (var _ in Iterable.generate(5))
                          Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                loremIpsum,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              )),
                      ],
                    ),
                    theme: ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToExpand: true,
                      tapBodyToCollapse: true,
                      hasIcon: true,
                      tapHeaderToExpand: true,

                      /// Duration rotate icon on header
                      animationDuration: Duration(
                        milliseconds: 300,
                      ),
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(
                            crossFadePoint: 0,

                            /// animation when expand and collapse
                            animationDuration: Duration(
                              milliseconds: 300,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              TextFieldTags(
                initialTags: ["Football", "Dribbling"],
                textFieldStyle: TextFieldStyle(
                  helperText: '',
                  hintText: '',
                  cursorColor: AppColors.greyColor,
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
                tagsStyle: TagsStyle(
                  tagTextStyle:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                  tagDecoration: BoxDecoration(
                    color: AppColors.blueColor,
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                  ),
                  tagCancelIcon: Icon(
                    Icons.clear,
                    size: 15.0,
                    color: AppColors.whiteColor,
                  ),
                  tagPadding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  tagCancelIconPadding: const EdgeInsets.only(
                    left: 10,
                  ),
                ),
                onTag: (tag) {
                  print('onTag ' + tag);
                },
                onDelete: (tag) {
                  print('onDelete ' + tag);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
