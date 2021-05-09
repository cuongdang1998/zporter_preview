import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'model_drop_down_item.dart';

class CommonDropDown extends StatelessWidget {
  final List<ModelDropDownItem> items;
  final ModelDropDownItem selectedItem;
  final ValueChanged onChange;

  const CommonDropDown({
    Key? key,
    required this.items,
    required this.selectedItem,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 55,
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
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.black54,
                    ),
                  ),
                ),
                popupItemBuilder: (context, lang, isSelected) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text(
                      lang.displayText,
                      style: TextStyle(
                          color: isSelected ? Colors.blue : Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 10,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              color: Colors.grey,
              child: Center(
                child: Text(
                  "Language",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
