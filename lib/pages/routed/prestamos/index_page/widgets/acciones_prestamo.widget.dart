import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/widgets/modificar_entidad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controllers/cambio_estado_prestamo.controller.dart';
import '../dto/estado_prestamo.dto.dart';
import '../pages/detalle_prestamo.page.dart';
import '../pages/renovar_prestamo.page.dart';

void accionesPrestamo(BuildContext context, WidgetRef ref, int id) {
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
                ref.read(routesProvider).pop();
                showCupertinoDialog(
                  context: context,
                  builder: (context) => DetallePrestamoPage(id),
                );
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
          const SizedBox(height: 10),
          DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16)),
            child: CupertinoListTile.notched(
              onTap: () {
                ref.read(routesProvider).pop();
                showCupertinoDialog(
                  context: context,
                  builder: (_) => ModificarEntidad<EstadoPrestamoDto>(
                      entidad:
                          EstadoPrestamoDto(idPrestamo: id, estado: "RETIRADO"),
                      nombreProvider: updateEstadoPrestamoProvider,
                      mensajeResult: "ESTADO DE PRÉSTAMO MODIFICADO A RETIRADO",
                      mensajeError: "ERROR AL MODIFCAR EL ESTADO DEL PRÉSTAMO"),
                );
              },
              leading: const Icon(Icons.check),
              trailing: const Icon(Icons.arrow_forward_ios),
              title: Text(
                'REGISTRAR RETIRO',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16)),
            child: CupertinoListTile.notched(
              onTap: () {
                ref.read(routesProvider).pop();
                showCupertinoDialog(
                  context: context,
                  builder: (_) => ModificarEntidad<EstadoPrestamoDto>(
                      entidad:
                          EstadoPrestamoDto(idPrestamo: id, estado: "DEVUELTO"),
                      nombreProvider: updateEstadoPrestamoProvider,
                      mensajeResult: "ESTADO DE PRÉSTAMO MODIFICADO A DEVUELTO",
                      mensajeError: "ERROR AL MODIFCAR EL ESTADO DEL PRÉSTAMO"),
                );
              },
              leading: const Icon(Icons.check),
              trailing: const Icon(Icons.arrow_forward_ios),
              title: Text(
                'REGISTRAR DEVOLUCIÓN',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16)),
            child: CupertinoListTile.notched(
              onTap: () {
                ref.read(routesProvider).pop();
                showCupertinoDialog(
                  context: context,
                  builder: (_) => ModificarEntidad<EstadoPrestamoDto>(
                      entidad:
                          EstadoPrestamoDto(idPrestamo: id, estado: "FINALIZADO"),
                      nombreProvider: updateEstadoPrestamoProvider,
                      mensajeResult: "ESTADO DE PRÉSTAMO MODIFICADO A FINALIZADO",
                      mensajeError: "ERROR AL MODIFCAR EL ESTADO DEL PRÉSTAMO"),
                );
              },
              leading: const Icon(Icons.check),
              trailing: const Icon(Icons.arrow_forward_ios),
              title: Text(
                'FINALIZAR PRÉSTAMO',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16)),
            child: CupertinoListTile.notched(
              onTap: () {
                ref.read(routesProvider).pop();
                showCupertinoDialog(
                  context: context,
                  builder: (_) => RenovarPrestamoPage(id),
                );
              },
              leading: const Icon(Icons.check),
              trailing: const Icon(Icons.arrow_forward_ios),
              title: Text(
                'RENOVAR PRÉSTAMO',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(),
              ),
            ),
          ),
          const SizedBox(height: 10),
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
