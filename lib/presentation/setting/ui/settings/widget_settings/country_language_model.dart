import 'package:zporter_preview/presentation/setting/ui/widget/model_drop_down_item.dart';

class CountryLangModel extends ModelDropDownItem {
  final String langName;
  final String langCode;

  CountryLangModel({
    required this.langCode,
    required this.langName,
  }) : super(displayText: langName, key: langCode);
}
