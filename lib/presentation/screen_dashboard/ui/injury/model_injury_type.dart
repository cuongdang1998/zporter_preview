import 'package:flutter/cupertino.dart';

enum InjuryType {
  /// None
  NoneInjury,

  /// Head
  FrontLeftHead,
  FrontRightHead,
  BackLeftHead,
  BackRightHead,

  /// Neck
  FrontNeck,
  BackNeck,

  /// Shoulder
  LeftShoulder,
  RightShoulder,

  /// Chest
  LeftChest,
  RightChest,

  /// Upper arm
  FrontLeftUpperArm,
  FrontRightUpperArm,
  BackLeftUpperArm,
  BackRightUpperArm,

  /// Elbow
  FrontLeftElbow,
  FrontRightElbow,
  BackLeftElbow,
  BackRightElbow,

  /// Lower Arm
  FrontLeftLowerArm,
  FrontRightLowerArm,
  BackLeftLowerArm,
  BackRightLowerArm,

  /// Wrist (Co tay)
  LeftWrist,
  RightWrist,

  /// Back
  LeftBack,
  RightBack,

  /// Abdomen (bung)
  Abdomen,

  /// Buttocks (Mong)
  LeftButtock,
  RightButtock,

  /// Thigh
  FrontLeftThigh,
  FrontRightThigh,
  BackLeftThigh,
  BackRightThigh,

  /// Knee
  LeftKnee,
  RightKnee,

  /// Calf
  FrontLeftCalf,
  FrontRightCalf,
  BackLeftCalf,
  BackRightCalf,

  /// Ankle
  LeftOutAnkle,
  RightOutAnkle,
  LeftInAnkle,
  RightInAnkle,

  /// Instep (Mu ban chan)
  LeftInstep,
  RightInstep,
}

extension InjuryTypeExtension on InjuryType {
  OriginalInjuryParams get originalInjuryParam {
    switch (this) {
      case InjuryType.FrontLeftHead:
        return OriginalInjuryParams(
          injuryName: 'Front Left Head',
          injuryPosition: Offset(120, 22),
          // tapInjuryAreaPosition: Offset(110, 10),
          tapSizeArea: Size(20, 22),
          isFront: true,
        );

      case InjuryType.FrontRightHead:
        return OriginalInjuryParams(
          injuryName: 'Front Right Head',
          injuryPosition: Offset(140, 22),
          // tapInjuryAreaPosition: Offset(130, 10),
          tapSizeArea: Size(20, 22),
          isFront: true,
        );
      case InjuryType.FrontLeftUpperArm:
        return OriginalInjuryParams(
          injuryName: 'Left Front Upper Arm',
          injuryPosition: Offset(130, 10),
          // tapInjuryAreaPosition: Offset(52, 132),
          tapSizeArea: Size(24, 37),
          isFront: true,
        );
      case InjuryType.FrontLeftUpperArm:
        return OriginalInjuryParams(
          injuryName: 'Front Left UpperArm',
          injuryPosition: Offset(52, 132),
          // tapInjuryAreaPosition: Offset(52, 132),
          tapSizeArea: Size(24, 37),
          isFront: true,
        );
      case InjuryType.FrontLeftElbow:
        return OriginalInjuryParams(
          injuryName: 'Front Left Elbow',
          injuryPosition: Offset(44, 165),
          // tapInjuryAreaPosition: Offset(44, 165),
          tapSizeArea: Size(24, 22),
          isFront: true,
        );
      case InjuryType.FrontLeftLowerArm:
        return OriginalInjuryParams(
          injuryName: 'Front Left Lower Arm',
          injuryPosition: Offset(44, 165),
          // tapInjuryAreaPosition: Offset(34, 184),
          tapSizeArea: Size(24, 22),
          isFront: true,
        );
      default:
        return OriginalInjuryParams(
          injuryName: 'None',
          injuryPosition: Offset(0, 0),
          // tapInjuryAreaPosition: Offset(0, 0),
          tapSizeArea: Size(0, 0),
          isFront: true,
        );
    }
  }
}

class OriginalInjuryParams {
  final String injuryName;
  final Offset injuryPosition;

  // final Offset tapInjuryAreaPosition;
  final Size tapSizeArea;
  final int injuryLevel;
  final bool isFront;

  OriginalInjuryParams({
    this.injuryLevel = 0,
    required this.injuryName,
    // required this.tapInjuryAreaPosition,
    required this.injuryPosition,
    required this.tapSizeArea,
    required this.isFront,
  });
}

class InjuryModel {
  InjuryType injuryType;
  int injuryLevel;

  InjuryModel({
    required this.injuryType,
    this.injuryLevel = 0,
  });
}
