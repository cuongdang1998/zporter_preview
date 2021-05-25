import 'dart:ui';

class BodyPathDraw {
  String path;
  String diagramName; // Right vs left
  String primaryName;
  String detailedName;
  String groupName;
  Color color;

  BodyPathDraw(
    this.diagramName,
    this.primaryName,
    this.detailedName,
    this.groupName,
    this.color,
    this.path,
  );
}
