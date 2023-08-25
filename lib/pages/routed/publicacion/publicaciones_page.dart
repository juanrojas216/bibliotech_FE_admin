
import 'package:bibliotech_admin/pages/routed/publicacion/widgets/widgets_publicacion.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PublicacionesPage extends StatelessWidget {
  const PublicacionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100.h,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Margin(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              SizedBox(
                height: 8.h,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Publicaciones", style: TextStyle(fontSize: 20)),
                    Row(
                      children: [
                        ParametrosPopUp(),
                        SizedBox(width: 20),
                        NuevaPublicacion(),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Expanded(child: TablaPublicaciones()),
            ],
          ),
        ),
      ),
    );
  }
}