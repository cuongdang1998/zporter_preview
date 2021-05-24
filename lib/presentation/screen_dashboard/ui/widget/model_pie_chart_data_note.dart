import 'package:flutter/material.dart';

class PieChartDataNoteModel {
  final double percent;
  final Color colorSection;
  final String sectionNote;

  PieChartDataNoteModel({
    required this.percent,
    required this.colorSection,
    required this.sectionNote,
  });
}