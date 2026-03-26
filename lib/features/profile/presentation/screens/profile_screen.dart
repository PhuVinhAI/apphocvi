import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mix/mix.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final containerStyle = BoxStyler().alignment(Alignment.center);

    final textStyle = TextStyler()
        .fontSize(18)
        .fontWeight(FontWeight.w600)
        .color(Colors.grey.shade800);

    final iconStyle = IconStyler().size(64).color(Colors.grey.shade300);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Hồ sơ cá nhân'),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Box(
        style: containerStyle,
        child: ColumnBox(
          style: FlexBoxStyler().mainAxisSize(MainAxisSize.min).spacing(16).crossAxisAlignment(CrossAxisAlignment.center),
          children: [
            StyledIcon(icon: LucideIcons.userCircle, style: iconStyle),
            StyledText('Tính năng đang phát triển', style: textStyle),
          ],
        ),
      ),
    );
  }
}