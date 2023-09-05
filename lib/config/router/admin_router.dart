import 'package:bibliotech_admin/pages/parametrospages/editoriales_abm.dart';
import 'package:bibliotech_admin/pages/routed/autenticacion/login.dart';
import 'package:bibliotech_admin/pages/routed/multa/multas.dart';
import 'package:bibliotech_admin/pages/routed/prestamos/prestamos.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/detalle_page/detalle_publicacion.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/publicacion_page/publicaciones_page.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/publicacion_page/widgets/widgets_publicacion.dart';
import 'package:bibliotech_admin/pages/routed/reporte/reportes.dart';
import 'package:bibliotech_admin/pages/routed/usuario/usuarios.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../pages/parametrospages/autores_abm.dart';
import '../../pages/parametrospages/carreras_abm.dart';
import '../../pages/parametrospages/categorias_abm.dart';
import '../../pages/parametrospages/ediciones_abm.dart';
import '../../pages/parametrospages/facultades_abm.dart';
import '../../pages/parametrospages/tipospublicacion_abm.dart';
import '../../pages/parametrospages/ubicaciones_abm.dart';

final routesProvider = Provider<GoRouter>((ref) {
  return GoRouter(routes: [
    GoRoute(
      path: '/publicacion',
      builder: (_, __) => LoginPage(),
    ),
    GoRoute(
      path: '/',
      builder: (_, __) => const PublicacionesPage(),
    ),
    GoRoute(
      path: '/multa',
      builder: (_, __) => const MultasPage(),
    ),
    GoRoute(
      path: '/prestamo',
      builder: (_, __) => const PrestamosPage(),
    ),
    GoRoute(
      path: '/reporte',
      builder: (_, __) => const ReportesPage(),
    ),
    GoRoute(
      path: '/usuario',
      builder: (_, __) => const UsuariosPage(),
    ),
    GoRoute(
      path: '/publicacion/create',
      builder: (_, __) => const NuevaPublicacion(),
    ),
    GoRoute(
      path: '/publicacion/detalle',
      builder: (_, rs) => DetallePublicacion(publicacionId: rs.extra as int),
    ),
    GoRoute(
      path: '/parametro/editorial',
      builder: (_, __) => EditorialesAbm(),
    ),
    GoRoute(
      path: '/parametro/edicion',
      builder: (_, __) => EdicionesAbm(),
    ),
    GoRoute(
      path: '/parametro/autor',
      builder: (_, __) => AutoresAbm(),
    ),
    GoRoute(
      path: '/parametro/categoria',
      builder: (_, __) => CategoriasAbm(),
    ),
    GoRoute(
      path: '/parametro/ubicacion',
      builder: (_, __) => UbicacionesAbm(),
    ),
    GoRoute(
      path: '/parametro/tipospublicacion',
      builder: (_, __) => TiposPublicacionAbm(),
    ),
    GoRoute(
      path: '/parametro/facultad',
      builder: (_, __) => FacultadesAbm(),
    ),
    GoRoute(
      path: '/parametro/carrera',
      builder: (_, __) => CarrerasAbm(),
    ),
  ]);
});
