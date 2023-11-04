import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/widgets/eliminar_entidad.dart';
import 'package:bibliotech_admin/widgets/modificar_entidad.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/cambiarEstado.controller.dart';
import '../controllers/deleteEjemplar.controller.dart';
import '../controllers/updateEjemplar.controller.dart';
import '../dto/cambiar_estado.dto.dart';
import '../dto/ejemplar_item.dto.dart';
import '../pages/editarEjemplar.page.dart';

Widget accionesEjemplar(
    BuildContext context, WidgetRef ref, EjemplarItemDto ejemplar) {
  return AlertDialog(
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
              showCupertinoDialog(
                  context: context,
                  builder: (context) => EjemplarEditar(ejemplar));
              // ref.read(routesProvider).push('/ejemplar/detalle', extra: ejemplar);
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
        Visibility(
          visible: ejemplar.tieneComentarios,
          child: Column(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(16)),
                child: CupertinoListTile.notched(
                  onTap: () {
                    ref
                        .read(routesProvider)
                        .push('/ejemplar/comentarios', extra: ejemplar.id);
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
            ],
          ),
        ),
        Visibility(
          visible: ejemplar.estado == 'PRESTADO',
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
                            entidad: ejemplar.copyWith(estado: "PRESTADO"),
                            nombreProvider: updateEjemplarProvider,
                            mensajeResult: 'EJEMPLAR EXTRAVIADO',
                            mensajeError:
                                'ERROR AL MODIFICAR COMO EXTRAVIADO AL EJEMPLAR'));
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
          visible: ejemplar.estado == 'DISPONIBLE',
          child: Column(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(16)),
                child: CupertinoListTile.notched(
                  onTap: () async {
                    await showDialog(
                        context: context,
                        builder: (_) => ModificarEntidad(
                            entidad: ejemplar.copyWith(estado: "EN_REPARACION"),
                            nombreProvider: updateEjemplarProvider,
                            mensajeResult: 'EJEMPLAR EN REPARACIÓN',
                            mensajeError:
                                'ERROR AL MODIFCAR EN REPARACIÓN AL EJEMPLAR'));
                    ref.read(routesProvider).pop();
                    // ModificarEntidad(
                    //     entidad: CambiarEstadoDto(
                    //         idEjemplar: ejemplar.id,
                    //         nombreEstado: 'REPARACION'),
                    //     nombreProvider: cambiarEstadoEjemplarProvider,
                    //     mensajeResult: 'EJEMPLAR EN REPARACIÓN',
                    //     mensajeError:
                    //         'ERROR AL MARCAR EN REPARACIÓN AL EJEMPLAR'));
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
          visible: List.from(["EXTRAVIADO", "EN_REPARACION"])
              .contains(ejemplar.estado),
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
                            entidad: ejemplar.copyWith(estado: "DISPONIBLE"),
                            nombreProvider: updateEjemplarProvider,
                            mensajeResult: 'EJEMPLAR DISPONIBLE',
                            mensajeError:
                                'ERROR AL MOFICIAR EN DISPONIBLE AL EJEMPLAR'));
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
        Visibility(
          visible: List.from(["EXTRAVIADO", "DISPONIBLE", "EN_REPARACION"])
              .contains(ejemplar.estado),
          child: DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(16)),
            child: CupertinoListTile.notched(
              onTap: () async {
                await showCupertinoDialog(
                  context: context,
                  builder: (context) => EliminarEntidad(
                      nombreProvider: deleteEjemplarProvider(ejemplar.id),
                      mensajeResult: "EJEMPLAR ELIMINADO",
                      mensajeError: "NO SE PUEDO ELIMINAR EL EJEMPLAR"),
                );
                ref.read(routesProvider).pop();
              },
              leading: const Icon(Icons.plagiarism_outlined),
              trailing: const Icon(Icons.arrow_forward_ios),
              title: Text(
                'Eliminar ejemplar',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(),
              ),
            ),
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
  );
}
