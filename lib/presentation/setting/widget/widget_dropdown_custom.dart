import 'package:flutter/material.dart';

const _sizeIcon = 20.0;

class CustomDropDown extends StatelessWidget {
  final List<String> data;
  final String value;
  final ValueChanged<String> onChanged;

  const CustomDropDown({
    Key? key,
    required this.data,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                style: TextStyle(),
                isDense: true,
                dropdownColor: Colors.grey,
                icon: Icon(Icons.arrow_drop_down_outlined),
                iconSize: _sizeIcon,
                onChanged: (newValue) {
                  onChanged(newValue!);
                },
                items: data.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
