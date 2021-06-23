import 'dart:io';

import 'package:flutter/material.dart';

class LastSelectedImage extends StatelessWidget {
  const LastSelectedImage({
    Key? key,
    required this.imageFile,
  }) : super(key: key);

  final Future<File?> imageFile;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File?>(
      future: imageFile,
      builder: (_, snapshot) {
        final file = snapshot.data;
        if (file == null) return Container();
        return Image.file(file);
      },
    );
  }
}
