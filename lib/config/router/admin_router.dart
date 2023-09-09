
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

import '../../pages/parametrospages/autor/autores_abm.dart';
import '../../pages/parametrospages/carreras_abm.dart';
import '../../pages/parametrospages/categorias/categorias_abm.dart';
import '../../pages/parametrospages/edicion/ediciones_abm.dart';
import '../../pages/parametrospages/editorial/editoriales_abm.dart';
import '../../pages/parametrospages/facultades_abm.dart';
import '../../pages/parametrospages/tipo_publicacion/tipo_abm.dart';
import '../../pages/parametrospages/ubicaciones_abm.dart';

final routesProvider = Provider<GoRouter>((ref) {
  return GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => LoginPage(),
    ),
    GoRoute(
      path: '/publicacion',
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
      builder: (_, __) => const EditorialesAbm(),
    ),
    GoRoute(
      path: '/parametro/edicion',
      builder: (_, __) => const EdicionesAbm(),
    ),
    GoRoute(
      path: '/parametro/autor',
      builder: (_, __) => const AutoresAbm(),
    ),
    GoRoute(
      path: '/parametro/categoria',
      builder: (_, __) => const CategoriasABM(),
    ),
    GoRoute(
      path: '/parametro/ubicacion',
      builder: (_, __) => UbicacionesAbm(),
    ),
    GoRoute(
      path: '/parametro/tipospublicacion',
      builder: (_, __) => const TipoPublicacionAbm(),
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
