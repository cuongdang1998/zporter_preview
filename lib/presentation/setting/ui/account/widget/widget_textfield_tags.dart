import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

class TextFieldTags extends StatefulWidget {
  final TagsStyle tagsStyle;
  final TextFieldStyle textFieldStyle;
  final void Function(String tag) onTag;

  final void Function(String tag) onDelete;

  final List<String>? initialTags;

  const TextFieldTags({
    Key? key,
    required this.tagsStyle,
    required this.textFieldStyle,
    required this.onTag,
    required this.onDelete,
    this.initialTags,
  }) : super(key: key);

  @override
  _TextFieldTagsState createState() => _TextFieldTagsState();
}

class _TextFieldTagsState extends State<TextFieldTags> {
  List<String> _tagsStringContent = [];
  TextEditingController _textEditingController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  bool _showPrefixIcon = false;
  double? _deviceWidth;

  @override
  void initState() {
    super.initState();
    if (widget.initialTags != null && widget.initialTags!.isNotEmpty) {
      _showPrefixIcon = true;
      _tagsStringContent = widget.initialTags!;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _deviceWidth = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _scrollController.dispose();
  }

  List<Widget> get _getTags {
    List<Widget> _tags = [];
    for (var i = 0; i < _tagsStringContent.length; i++) {
      String tagText = widget.tagsStyle.showHashTag
          ? "#${_tagsStringContent[i]}"
          : _tagsStringContent[i];
      var tag = Container(
        padding: widget.tagsStyle.tagPadding,
        decoration: widget.tagsStyle.tagDecoration,
        margin: widget.tagsStyle.tagMargin,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: widget.tagsStyle.tagTextPadding,
              child: Text(
                tagText,
                style: widget.tagsStyle.tagTextStyle,
              ),
            ),
            Padding(
              padding: widget.tagsStyle.tagCancelIconPadding,
              child: GestureDetector(
                onTap: () {
                  widget.onDelete(_tagsStringContent[i]);

                  if (_tagsStringContent.length == 1 && _showPrefixIcon) {
                    setState(() {
                      _tagsStringContent.remove(_tagsStringContent[i]);
                      _showPrefixIcon = false;
                    });
                  } else {
                    setState(() {
                      _tagsStringContent.remove(_tagsStringContent[i]);
                    });
                  }
                },
                child: widget.tagsStyle.tagCancelIcon,
              ),
            ),
          ],
        ),
      );
      _tags.add(tag);
    }
    return _tags;
  }

  void _animateTransition() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: AppColors.blueColor,
      ),
      child: TextField(
        controller: _textEditingController,
        autocorrect: false,
        cursorColor: widget.textFieldStyle.cursorColor,
        style: widget.textFieldStyle.textStyle,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: widget.textFieldStyle.contentPadding,
          isDense: widget.textFieldStyle.isDense,
          helperText: widget.textFieldStyle.helperText,
          helperStyle: widget.textFieldStyle.helperStyle,
          hintText: !_showPrefixIcon ? widget.textFieldStyle.hintText : null,
          hintStyle: !_showPrefixIcon ? widget.textFieldStyle.hintStyle : null,
          filled: widget.textFieldStyle.textFieldFilled,
          fillColor: widget.textFieldStyle.textFieldFilledColor,
          enabled: widget.textFieldStyle.textFieldEnabled,
          border: widget.textFieldStyle.textFieldBorder,
          focusedBorder: widget.textFieldStyle.textFieldFocusedBorder,
          disabledBorder: widget.textFieldStyle.textFieldDisabledBorder,
          enabledBorder: widget.textFieldStyle.textFieldEnabledBorder,
          prefixIcon: _showPrefixIcon
              ? ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: _deviceWidth! * 0.725),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _getTags,
                      ),
                    ),
                  ),
                )
              : null,
        ),
        onSubmitted: (value) {
          var val = value.trim().toLowerCase();
          if (value.length > 0) {
            _textEditingController.clear();
            if (!_tagsStringContent.contains(val)) {
              widget.onTag(val);
              if (!_showPrefixIcon) {
                setState(() {
                  _tagsStringContent.add(val);
                  _showPrefixIcon = true;
                });
              } else {
                setState(() {
                  _tagsStringContent.add(val);
                });
              }
              this._animateTransition();
            }
          }
        },
        onChanged: (value) {
          var splitTagsList = value.split(" ");
          var lastLastTag = splitTagsList.length > 1
              ? splitTagsList[splitTagsList.length - 2].trim().toLowerCase()
              : '';

          if (value.contains(" ")) {
            if (lastLastTag.length > 0) {
              _textEditingController.clear();

              if (!_tagsStringContent.contains(lastLastTag)) {
                widget.onTag(lastLastTag);

                if (!_showPrefixIcon) {
                  setState(() {
                    _tagsStringContent.add(lastLastTag);
                    _showPrefixIcon = true;
                  });
                } else {
                  setState(() {
                    _tagsStringContent.add(lastLastTag);
                  });
                }
                this._animateTransition();
              }
            }
          }
        },
      ),
    );
  }
}

//Models

class TagsStyle {
  final EdgeInsets tagPadding;

  final EdgeInsets tagMargin;

  final BoxDecoration tagDecoration;

  final TextStyle? tagTextStyle;

  final EdgeInsets tagTextPadding;

  final EdgeInsets tagCancelIconPadding;

  final Widget tagCancelIcon;

  final bool showHashTag;

  TagsStyle({
    this.tagTextPadding = const EdgeInsets.all(0.0),
    this.tagCancelIconPadding = const EdgeInsets.only(left: 1.0),
    this.tagPadding = const EdgeInsets.all(4.0),
    this.tagMargin = const EdgeInsets.symmetric(horizontal: 4.0),
    this.tagDecoration =
        const BoxDecoration(color: Color.fromARGB(255, 74, 137, 92)),
    this.tagTextStyle,
    this.showHashTag = false,
    this.tagCancelIcon = const Icon(
      Icons.cancel,
      size: 18.0,
      color: Colors.green,
    ),
  });
}

class TextFieldStyle {
  final Color? textFieldFilledColor;

  final bool? textFieldFilled;

  final EdgeInsets? contentPadding;

  final TextStyle? textStyle;

  final Color? cursorColor;

  final bool? isDense;

  final String? helperText;

  final TextStyle? helperStyle;

  final String? hintText;

  final TextStyle? hintStyle;

  final bool textFieldEnabled;

  final InputBorder? textFieldBorder;
  final InputBorder? textFieldFocusedBorder;
  final InputBorder? textFieldDisabledBorder;
  final InputBorder? textFieldEnabledBorder;

  TextFieldStyle({
    this.textFieldFilled = false,
    this.helperText,
    this.helperStyle,
    this.textStyle,
    this.cursorColor,
    this.hintText,
    this.hintStyle,
    this.contentPadding,
    this.textFieldFilledColor,
    this.isDense = true,
    this.textFieldEnabled = true,
    this.textFieldBorder,
    this.textFieldFocusedBorder,
    this.textFieldDisabledBorder,
    this.textFieldEnabledBorder,
  });
}
