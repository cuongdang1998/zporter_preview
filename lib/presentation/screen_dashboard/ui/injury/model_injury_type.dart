import 'package:flutter/cupertino.dart';

enum InjuryType {
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
  LeftFrontUpperArm,
  RightFrontUpperArm,
  LeftBackUpperArm,
  RightBackUpperArm,

  /// Elbow
  LeftElbow,
  RightElbow,

  /// Lower Arm
  LeftFrontLowerArm,
  RightFrontLowerArm,
  LeftBackULowerArm,
  RightBackLowerArm,

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
  LeftFrontThigh,
  RightFrontThigh,
  LeftBackThigh,
  RightBackThigh,

  /// Knee
  LeftKnee,
  RightKnee,

  /// Calf
  LeftFrontCalf,
  RightFrontCalf,
  LeftBackCalf,
  RightBackCalf,

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
  InjuryParam get injuryParam {
    switch (this) {
      case InjuryType.FrontLeftHead:
        return InjuryParam(
          injuryName: 'Front Left Head',
          injuryPosition: Offset(110, 10),
          tapInjuryAreaPosition: Offset(110, 10),
          tapSizeArea: Size(20, 22),
        );

      case InjuryType.FrontRightHead:
        return InjuryParam(
          injuryName: 'Front Right Head',
          injuryPosition: Offset(130, 10),
          tapInjuryAreaPosition: Offset(130, 10),
          tapSizeArea: Size(20, 22),
        );
      default:
        return InjuryParam(
          injuryName: 'None',
          injuryPosition: Offset(0, 0),
          tapInjuryAreaPosition: Offset(0, 0),
          tapSizeArea: Size(0, 0),
        );
    }
  }
}

class InjuryParam {
  final String injuryName;
  final Offset injuryPosition;
  final Offset tapInjuryAreaPosition;
  final Size tapSizeArea;

  InjuryParam({
    required this.injuryName,
    required this.tapInjuryAreaPosition,
    required this.injuryPosition,
    required this.tapSizeArea,
  });
}
