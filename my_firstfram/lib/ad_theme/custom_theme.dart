import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData myTheme = ThemeData(
  primarySwatch: Colors.blue,
  textTheme: GoogleFonts.emilysCandyTextTheme(),
  scaffoldBackgroundColor: Colors.blue[100],
);

const Color primaryColor = Color(0xFF2697FF);
const Color secondaryColor = Color(0xFF2A2D3E);
const Color bgColor = Color(0xFF212332);
const defaultPadding = 16.0;

ThemeData darkTheme = ThemeData.dark().copyWith(
  // 1.背景颜色
  scaffoldBackgroundColor: bgColor,
  // 2.文本主题
  textTheme: GoogleFonts.poppinsTextTheme().apply(bodyColor: Colors.white),
  canvasColor: secondaryColor,
);


// 2.按钮主题
// 4.内外边距主题
// 5.字体主题
// 6.节日皮肤