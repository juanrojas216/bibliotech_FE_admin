import 'package:bibliotech_admin/config/auth/auth.service.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/pages/indexAutores.page.dart';
import 'package:bibliotech_admin/pages/parametrospages/carrerra/pages/indexCarreras.page.dart';
import 'package:bibliotech_admin/pages/parametrospages/categoria/pages/indexCategorias.page.dart';
import 'package:bibliotech_admin/pages/parametrospages/edicion/pages/indexEdiciones.page.dart';
import 'package:bibliotech_admin/pages/parametrospages/editorial/pages/indexEditoriales.page.dart';
import 'package:bibliotech_admin/pages/parametrospages/facultad/pages/indexFacultades.page.dart';
import 'package:bibliotech_admin/pages/parametrospages/plataforma/pages/indexPlataformas.page.dart';
import 'package:bibliotech_admin/pages/parametrospages/tipo_publicacion/pages/indexTipoPublicacion.page.dart';
import 'package:bibliotech_admin/pages/parametrospages/ubicacion/pages/indexUbicaciones.page.dart';
import 'package:bibliotech_admin/pages/routed/autenticacion/page/login.dart';
import 'package:bibliotech_admin/pages/routed/multa/index_page/pages/multas.page.dart';
import 'package:bibliotech_admin/pages/routed/prestamos/index_page/pages/prestamos.page.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/create_publicacion_page/pages/create_publicacion.page.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/detalle_publicacion_page/pages/update_publicacion.page.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/ejemplares_page/pages/ejemplares.page.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/index_page/pages/publicaciones.page.dart';
import 'package:bibliotech_admin/pages/routed/reporte/reportes.dart';
import 'package:bibliotech_admin/pages/routed/usuario/pages/usuarios.page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../pages/routed/publicacion/index_page/widgets/index.dart';
import '../../pages/routed/usuario/pages/updateUsuario.page.dart';

final routesProvider = Provider<GoRouter>((ref) {
  return GoRouter(routerNeglect: true, routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => LoginPage(),
    ),
    GoRoute(
      path: '/publicacion',
      builder: (_, __) => const PublicacionesIndex(),
      redirect: (__, _) => _redirect(),
    ),
    GoRoute(
      path: '/publicacion/create',
      builder: (_, __) => const CreatePublicacionPage(),
      redirect: (__, _) => _redirect(),
    ),
    GoRoute(
      path: '/multa',
      builder: (_, __) => const MultasIndex(),
      redirect: (__, _) => _redirect(),
    ),
    // GoRoute(
    //   path: '/multa/usuario',
    //   builder: (_, __) => const SelectUserPage(),
    //   redirect: (__, _) => _redirect(),
    // ),
    // GoRoute(
    //   path: '/multa/prestamo',
    //   builder: (_, __) => const SelectPrestamoPage(),
    //   redirect: (__, _) => _redirect(),
    // ),
    // GoRoute(
    //   path: '/seleccionar-prestamo',
    //   builder: (_, __) => const SelectPrestamoPage(),
    //   redirect: (__, _) => _redirect(),
    // ),
    // GoRoute(
    //   path: '/creacion',
    //   builder: (_, __) => const SelectPrestamoPage(),
    //   redirect: (__, _) => _redirect(),
    // )
    GoRoute(
      path: '/prestamo',
      builder: (_, __) => const PrestamoPage(),
      redirect: (__, _) => _redirect(),
    ),
    GoRoute(
      path: '/reporte',
      builder: (_, __) => const ReportesPage(),
      redirect: (__, _) => _redirect(),
    ),
    GoRoute(
      path: '/usuario',
      builder: (_, __) => const UsuariosIndex(),
      redirect: (__, _) => _redirect(),
    ),
    GoRoute(
      path: '/usuario/detalle',
      builder: (_, rs) => UsuarioUpdate(idUsuario: rs.extra as int),
      redirect: (__, _) => _redirect(),
    ),
    
    GoRoute(
      path: '/publicacion/create',
      builder: (_, __) => const NuevaPublicacion(),
      redirect: (__, _) => _redirect(),
    ),
    GoRoute(
      path: '/publicacion/detalle',
      builder: (_, rs) => UpdatePublicacionPage(publicacionId: rs.extra as int),
      redirect: (__, _) => _redirect(),
    ),
    GoRoute(
      path: '/publicacion/ejemplares',
      builder: (_, rs) => EjemplaresIndex(idPublicacion: rs.extra as int),
      redirect: (__, _) => _redirect(),
    ),
    GoRoute(
      path: '/parametro/editorial',
      builder: (_, __) => const EditorialesIndex(),
      redirect: (__, _) => _redirect(),
    ),
    GoRoute(
      path: '/parametro/edicion',
      builder: (_, __) => const EdicionesIndex(),
      redirect: (__, _) => _redirect(),
    ),
    GoRoute(
      path: '/parametro/autor',
      builder: (_, __) => const AutoresIndex(),
      redirect: (__, _) => _redirect(),
    ),
    GoRoute(
      path: '/parametro/categoria',
      builder: (_, __) => const CategoriasIndex(),
      redirect: (__, _) => _redirect(),
    ),
    GoRoute(
      path: '/parametro/ubicacion',
      builder: (_, __) => const UbicacionesIndex(),
      redirect: (__, _) => _redirect(),
    ),
    GoRoute(
      path: '/parametro/tipospublicacion',
      builder: (_, __) => const TipoPublicacionIndex(),
      redirect: (__, _) => _redirect(),
    ),
    GoRoute(
      path: '/parametro/facultad',
      builder: (_, __) => const FacultadesIndex(),
      redirect: (__, _) => _redirect(),
    ),
    GoRoute(
      path: '/parametro/carrera',
      builder: (_, __) => const CarrerasIndex(),
      redirect: (__, _) => _redirect(),
    ),
    GoRoute(
      path: '/parametro/plataforma',
      builder: (_, __) => const PlataformasIndex(),
      redirect: (__, _) => _redirect(),
    ),
  ]);
});

String? _redirect() {
  return Auth.isActive ? null : '/';
}
