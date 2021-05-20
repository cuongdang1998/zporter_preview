import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

import 'model_drop_down_item.dart';

class CommonDropDown extends StatelessWidget {
  final List<ModelDropDownItem> items;
  final ModelDropDownItem selectedItem;
  final ValueChanged onChange;
  final String? labelText;

  const CommonDropDown({
    Key? key,
    required this.items,
    required this.selectedItem,
    required this.onChange,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: EdgeInsets.only(bottom: 28),
      child: DropdownSearch<ModelDropDownItem>(
        mode: Mode.MENU,
        showSelectedItem: true,
        items: items,
        itemAsString: (item) => item.displayText,
        maxHeight: items.length > 5 ? 250 : items.length * 50.0,
        onChanged: onChange,
        compareFn: (t1, t2) => t1.key == t2!.key,
        selectedItem: selectedItem,
        dropDownButton: Icon(Icons.arrow_drop_down_sharp),
        dropdownSearchDecoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15, 20, 0, 0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.blueColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: AppColors.greyColor,
            ),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 20,
          ),
          alignLabelWithHint: true,
        ),
        popupItemBuilder: (context, lang, isSelected) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Text(
              lang.displayText,
              style: TextStyle(
                color: isSelected ? AppColors.blueColor : AppColors.greyColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
