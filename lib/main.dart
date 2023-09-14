import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:layout/layout.dart';
 import 'package:google_fonts/google_fonts.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final adminRoutes = ref.watch(routesProvider);

    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Layout(
          child: MaterialApp.router(
            title: "Bibliotech",
            routerConfig: adminRoutes, 
            theme: ThemeData(
                textTheme: GoogleFonts.poppinsTextTheme(),
                primarySwatch: Colors.purple),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
