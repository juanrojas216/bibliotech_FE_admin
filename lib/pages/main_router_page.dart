import 'package:bibliotech_admin/pages/routed/multa/multas.dart';
import 'package:bibliotech_admin/pages/routed/prestamos/prestamos.dart';
import 'package:bibliotech_admin/pages/routed/reporte/reportes.dart';
import 'package:bibliotech_admin/pages/routed/usuario/usuarios.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/publicaciones_page.dart';

class MainRouterPage extends StatelessWidget {
  MainRouterPage({super.key});

  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(controller: _controller),
          Expanded(
            child: Center(
              child: _MainScreen(
                controller: _controller,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({
    super.key,
    required SidebarXController controller,
  }) : _controller = controller;

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      theme: SidebarXTheme(),
      controller: _controller,
      items: const [
        SidebarXItem(
          icon: Icons.bookmark,
          label: 'Publicaciones',
        ),
        SidebarXItem(
          icon: Icons.calendar_month,
          label: 'Préstamo',
        ),
        SidebarXItem(
          icon: Icons.warning,
          label: 'Multas',
        ),
        SidebarXItem(
          icon: Icons.supervised_user_circle,
          label: 'Usuarios',
        ),
        SidebarXItem(
          icon: Icons.punch_clock,
          label: 'Reportes',
        ),
      ],
    );
  }
}

class _MainScreen extends StatelessWidget {
  const _MainScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        switch (controller.selectedIndex) {
          case 0:
            return const PublicacionesPage();
          case 1:
            return const PrestamosPage();
          case 2:
            return const MultasPage();
          case 3:
            return const UsuariosPage();
          case 4:
            return const ReportesPage();
          default:
            return const Text("Index not found");
        }
      },
    );
  }
}
