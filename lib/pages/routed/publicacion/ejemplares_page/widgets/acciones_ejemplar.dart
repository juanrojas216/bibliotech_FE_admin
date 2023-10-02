import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/ejemplares_page/controllers/cambiarEstado.controller.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/ejemplares_page/dto/cambiar_estado.dto.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/ejemplares_page/repository/ejemplares.repository.dart';
import 'package:bibliotech_admin/widgets/modificar_entidad.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void accionesEjemplar(BuildContext context, WidgetRef ref, int id) {
  
  final estado = ref.read(ejemplaresProvider).firstWhere((e) => e.id == id).estados.last;

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('ACCIONES', textAlign: TextAlign.center),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16)),
            child: CupertinoListTile.notched(
              onTap: () {
                ref.read(routesProvider).push('/ejemplar/detalle', extra: id);
              },
              leading: const Icon(Icons.plagiarism_outlined),
              trailing: const Icon(Icons.arrow_forward_ios),
              title: Text(
                'Ver detalle',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16)),
            child: CupertinoListTile.notched(
              onTap: () {
                ref
                    .read(routesProvider)
                    .push('/ejemplar/comentarios', extra: id);
              },
              leading: const Icon(Icons.comment),
              trailing: const Icon(Icons.arrow_forward_ios),
              title: Text(
                'Ver comentarios',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Visibility(
            visible: estado.nombre != 'EXTRAVIADO',
            child: Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(16)),
                  child: CupertinoListTile.notched(
                    onTap: () {
                      ref.read(routesProvider).pop();
                      showDialog(
                          context: context,
                          builder: (_) => ModificarEntidad(
                              //TODO: IMPLEMENTAR ID USUARIO
                              entidad: CambiarEstadoDto(
                                  idEjemplar: id,
                                  idUsuario: 0,
                                  nombreEstado: 'EXTRAVIADO'),
                              nombreProvider: cambiarEstadoEjemplarProvider,
                              mensajeResult: 'EJEMPLAR MARCADO A EXTRAVIADO',
                              mensajeError:
                                  'ERROR AL MARCAR COMO EXTRAVIADO AL EJEMPLAR'));
                    },
                    leading: const Icon(Icons.account_tree_outlined),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    title: Text(
                      'Ejemplar extraviado',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Visibility(
            visible: estado.nombre != 'DISPONIBLE',
            child: Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(16)),
                  child: CupertinoListTile.notched(
                    onTap: () {
                      ref.read(routesProvider).pop();
                      showDialog(
                          context: context,
                          builder: (_) => ModificarEntidad(
                              //TODO: IMPLEMENTAR ID USUARIO
                              entidad: CambiarEstadoDto(
                                  idEjemplar: id,
                                  idUsuario: 0,
                                  nombreEstado: 'REPARACION'),
                              nombreProvider: cambiarEstadoEjemplarProvider,
                              mensajeResult: 'EJEMPLAR EN REPARACIÓN',
                              mensajeError:
                                  'ERROR AL MARCAR EN REPARACIÓN AL EJEMPLAR'));
                    },
                    leading: const Icon(Icons.account_tree_outlined),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    title: Text(
                      'Ejemplar en reparación',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Visibility(
            visible: estado.nombre == 'EXTRAVIADO' || estado.nombre == 'REPARACION',
            child: Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(16)),
                  child: CupertinoListTile.notched(
                    onTap: () {
                      ref.read(routesProvider).pop();
                      showDialog(
                          context: context,
                          builder: (_) => ModificarEntidad(
                              //TODO: IMPLEMENTAR ID USUARIO
                              entidad: CambiarEstadoDto(
                                  idEjemplar: id,
                                  idUsuario: 0,
                                  nombreEstado: 'DISPONIBLE'),
                              nombreProvider: cambiarEstadoEjemplarProvider,
                              mensajeResult: 'EJEMPLAR DISPONIBLE',
                              mensajeError:
                                  'ERROR AL MARCAR EN DISPONIBLE AL EJEMPLAR'));
                    },
                    leading: const Icon(Icons.account_tree_outlined),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    title: Text(
                      'Ejemplar disponible',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(bottom: 20),
      actions: [
        ElevatedButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            child: const Text('CANCELAR'))
      ],
    ),
  );
}
