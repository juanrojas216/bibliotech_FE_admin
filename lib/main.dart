import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:layout/layout.dart';
import 'package:bibliotech_admin/pages/main_router_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Layout(
          child: MaterialApp(
            theme: ThemeData(
                textTheme: GoogleFonts.poppinsTextTheme(),
                primarySwatch: Colors.purple),
            debugShowCheckedModeBanner: false,
            home: MainRouterPage(),
          ),
        );
      },
    );
  }
}
