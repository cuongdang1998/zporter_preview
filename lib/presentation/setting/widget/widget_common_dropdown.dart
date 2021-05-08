import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CommonDropDown extends StatelessWidget {
  final List<String> languages = [
    "Vietnamese",
    "English",
    "Swedish",
  ];

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
              child: DropdownSearch<String>(
                mode: Mode.MENU,
                showSelectedItem: true,
                items: languages,
                // label: "Language",
                maxHeight: languages.length > 5 ? 250 : languages.length * 50.0,
                onChanged: (value) {},
                selectedItem: "Brazil",
                dropDownButton: Icon(Icons.arrow_drop_down_sharp),
                dropdownSearchDecoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                popupItemBuilder: (context, lang, isSelected) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text(
                      lang,
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
