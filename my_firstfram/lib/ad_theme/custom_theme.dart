import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// 默认主题 -- START
ThemeData myTheme = ThemeData(
  primaryColor: Colors.teal,
  primarySwatch: Colors.blue,
  textTheme: GoogleFonts.emilysCandyTextTheme(),
  scaffoldBackgroundColor: Colors.green[100],
);
// 默认主题 -- END

// 黑暗主题 -- START
const Color primaryColor = Color(0xFF2697FF);
const Color secondaryColor = Color(0xFF2A2D3E);
const Color bgColor = Color(0xFF212332);
const defaultPadding = 16.0;

ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: bgColor, // 1.背景颜色
  textTheme:
      GoogleFonts.poppinsTextTheme().apply(bodyColor: Colors.white), // 2.文本主题
  canvasColor: secondaryColor,
);
// 黑暗主题 -- END

// 按钮主题 --  START
// 按钮主题 --  START

// 内外边距主题 --  START
// 内外边距主题 --  START
// 5.字体主题 --  START
// 6.节日皮肤 --  START