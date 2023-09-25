
import 'package:bibliotech_admin/pages/creatorpages/Publicacion/nueva_publicacion.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/pages/indexAutores.page.dart';
import 'package:bibliotech_admin/pages/parametrospages/carrerra/pages/indexCarreras.page.dart';
import 'package:bibliotech_admin/pages/parametrospages/categoria/pages/indexCategorias.page.dart';
import 'package:bibliotech_admin/pages/parametrospages/edicion/pages/indexEdiciones.page.dart';
import 'package:bibliotech_admin/pages/parametrospages/editorial/pages/indexEditoriales.page.dart';
import 'package:bibliotech_admin/pages/parametrospages/facultad/pages/indexFacultades.page.dart';
import 'package:bibliotech_admin/pages/parametrospages/tipo_publicacion/pages/indexTipoPublicacion.page.dart';
import 'package:bibliotech_admin/pages/parametrospages/ubicacion/pages/indexUbicaciones.page.dart';
import 'package:bibliotech_admin/pages/routed/autenticacion/login.dart';
import 'package:bibliotech_admin/pages/routed/multa/multas.dart';
import 'package:bibliotech_admin/pages/routed/prestamos/prestamos.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/detalle_page/detalle_publicacion.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/index_page/publicaciones_page.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/index_page/widgets/widgets_publicacion.dart';
import 'package:bibliotech_admin/pages/routed/reporte/reportes.dart';
import 'package:bibliotech_admin/pages/routed/usuario/usuarios.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


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
      path: '/publicacion/create',
      builder: (_, __) => const NuevaPublicacionPage(),
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
      builder: (_, __) => const EditorialesIndex(),
    ),
    GoRoute(
      path: '/parametro/edicion',
      builder: (_, __) => const EdicionesIndex(),
    ),
    GoRoute(
      path: '/parametro/autor',
      builder: (_, __) => const AutoresIndex(),
    ),
    GoRoute(
      path: '/parametro/categoria',
      builder: (_, __) => const CategoriasIndex(),
    ),
    GoRoute(
      path: '/parametro/ubicacion',
      builder: (_, __) => const UbicacionesIndex(),
    ),
    GoRoute(
      path: '/parametro/tipospublicacion',
      builder: (_, __) => const TipoPublicacionIndex(),
    ),
    GoRoute(
      path: '/parametro/facultad',
      builder: (_, __) => const FacultadesIndex(),
    ),
    GoRoute(
      path: '/parametro/carrera',
      builder: (_, __) => const CarrerasIndex(),
    ),
  ]);
});
