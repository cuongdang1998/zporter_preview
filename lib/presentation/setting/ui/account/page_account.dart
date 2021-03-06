import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';
import 'package:zporter_preview/generated/l10n.dart';
import 'package:zporter_preview/presentation/common/buttons/widget_font_back_button.dart';
import 'package:zporter_preview/presentation/common/buttons/widget_yes_now_button.dart';
import 'package:zporter_preview/presentation/common/widget/widget_common_checkbox.dart';
import 'package:zporter_preview/presentation/common/widget/widget_common_slider.dart';
import 'package:zporter_preview/presentation/setting/ui/widget/widget_notification_item.dart';
import 'package:zporter_preview/presentation/common/buttons/widget_app_common_button.dart';
import 'package:zporter_preview/utils/route/app_routing.dart';

import 'widget/widget_diary_data_table.dart';
import 'widget/widget_expansion_custom.dart';
import 'widget/widget_select_text_list.dart';
import 'widget/widget_textfield_tags.dart';
import 'dart:math' as math;

const loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  double currentSliderValue = 0;
  List<String> energyLevel = [
    'No football\n     today',
    'Other',
    'Gym',
    'Personal Trainer',
    'Team Training',
    'Match',
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
        color: AppColors.black3Color,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonSlider(
                divisionNum: 5,
                minValue: 0,
                maxValue: 100,
                currentSliderValue: 0,
                onChange: (valueNode) {
                  print('$valueNode');
                },
                // isShowStar: true,
                levelList: energyLevel,
              ),
              ExpandableNotifier(
                initialExpanded: false,
                child: ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: true,
                  child: ExpandablePanelCustom(
                    header: Text(
                      "Expandable",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                    // collapsed: Text(
                    //   loremIpsum,
                    //   softWrap: true,
                    //   maxLines: 2,
                    //   overflow: TextOverflow.ellipsis,
                    // ),
                    collapsed: Container(),
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
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                          ),
                      ],
                    ),
                    theme: ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToExpand: true,
                      tapBodyToCollapse: true,
                      hasIcon: true,
                      tapHeaderToExpand: true,
                      expandIcon: Icons.keyboard_arrow_right_sharp,
                      collapseIcon: Icons.keyboard_arrow_down_sharp,
                      iconRotationAngle: math.pi / 2,

                      /// Duration rotate icon on header
                      animationDuration: Duration(
                        milliseconds: 100,
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
              FontBackButton(
                isSelectedFirst: true,
                onBackTap: () {
                  print("on back tap");
                },
                onFontTap: () {
                  print("on font tap");
                },
              ),
              YesNoButton(
                isYes: true,
                buttonHeight: 30,
                onYesTap: (value) {
                  print("isYes $value}");
                },
                onNoTap: (value) {
                  print("isYes $value");
                },
              ),
              DiaryDataTable(),
              CommonCheckBox(
                onChange: (value) {
                  print("value $value");
                },
              ),
              NotificationItem(),
              Row(
                children: [
                  Expanded(
                    child: AppCommonButton(
                      textButton: 'Dashboard',
                      onPress: () {
                        Navigator.pushNamed(
                            context, RouteDefine.DashBoardScreen.name);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: AppCommonButton(
                      textButton: 'Login',
                      onPress: () {
                        Navigator.pushNamed(
                            context, RouteDefine.LoginScreen.name);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: AppCommonButton(
                      textButton: 'Home',
                      onPress: () {
                        Navigator.pushNamed(
                            context, RouteDefine.HomeScreen.name);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: AppCommonButton(
                      textButton: 'Image',
                      onPress: () async {
                        Navigator.pushNamed(
                          context,
                          RouteDefine.MediaPickerScreen.name,
                        );
                      },
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: SelectTextList(
                  textStyle: TextStyle(
                    fontSize: 9,
                  ),
                  onSelect: (value) {
                    print('==== selected index $value');
                    print('===== ${S.current.cancel}');
                  },
                  textList: [
                    'No, rest day',
                    'Other training',
                    'Gym',
                    'PT/Group',
                    'Team Training',
                    'Match'
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
