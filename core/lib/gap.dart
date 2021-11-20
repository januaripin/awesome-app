import 'package:core/app_colors.dart';
import 'package:flutter/material.dart';

/// Spacer with 8 rule
class Gap extends StatelessWidget {
  const Gap._({Key? key, this.width, this.height}) : super(key: key);

  factory Gap.p8({double scale = 1}) => Gap._(
        width: 8 * scale,
        height: 8 * scale,
      );

  factory Gap.p4() => Gap.p8(scale: 0.5);

  factory Gap.p16() => Gap.p8(scale: 2);

  factory Gap.p24() => Gap.p8(scale: 3);

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) => SizedBox(width: width, height: height);
}
