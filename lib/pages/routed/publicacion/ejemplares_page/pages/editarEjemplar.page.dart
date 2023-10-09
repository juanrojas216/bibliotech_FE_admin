import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/models/index.dart';
import 'package:bibliotech_admin/widgets/eliminar_entidad.dart';
import 'package:bibliotech_admin/widgets/modificar_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/deleteEjemplar.controller.dart';
import '../controllers/getAllUbicaciones.controller.dart';
import '../controllers/updateEjemplar.controller.dart';
import '../repository/ejemplares.repository.dart';
import '../repository/ubicaciones.repository.dart';
import '../validations/ejemplarUpdate.validation.dart';


class EjemplarEditar extends ConsumerStatefulWidget {
  
  final int idEjemplar;

  const EjemplarEditar(this.idEjemplar, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EjemplarEditarState();
}

class _EjemplarEditarState extends ConsumerState<EjemplarEditar> {

  late Ejemplar ejemplar;

  @override
  void initState() {
    ejemplar = ref.read(ejemplaresProvider).firstWhere((e) => e.id == widget.idEjemplar).copyWith();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Editar ejemplar',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: SizedBox(
        width: 400,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) => {
                    ejemplar.serialNfc = int.parse(value),
                    setState(() {}),
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Serial NFC',
                      labelStyle: TextStyle(
                          fontFamily: GoogleFonts.poppins.toString(),
                          fontSize: 14),
                      border: const OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                ref.read(getAllUbicacionLibreProvider).when(
                    data: (_) => DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: DropdownButton<int>(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 11),
                            isDense: true,
                            isExpanded: true,
                            hint: const Text('UBICACION'),
                            value: ejemplar.ubicacion?.id,
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins.toString(),
                                fontSize: 14),
                            items: [
                              ...ref.read(ubicacionesProvider).map(
                                    (u) => DropdownMenuItem(
                                      value: u.id,
                                      child: Text(
                                        u.descripcion,
                                        style: GoogleFonts.poppins(),
                                      ),
                                    ),
                                  ),
                            ],
                            onChanged: (value) {
                              if (value != null) {
                                ejemplar.ubicacion = ref
                                    .read(ubicacionesProvider)
                                    .firstWhere((u) => u.id == value);
                                setState(() {});
                              }
                            },
                          ),
                        ),
                    error: (_, __) => ElevatedButton(
                          onPressed: () {
                            ref.invalidate(getAllUbicacionLibreProvider);
                          },
                          child: Text(
                            'Reintentar cargar ubicaciones',
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                    loading: () => const LinearProgressIndicator()),
              ],
            ),
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        ElevatedButton(
            onPressed: () {
              if (!ejemplarUpdateValidacion(ejemplar)) return;
              ref.read(routesProvider).pop();
              showDialog(
                  context: context,
                  builder: (_) => ModificarEntidad(
                      entidad: ejemplar,
                      nombreProvider: updateEjemplarProvider,
                      mensajeResult: 'EJEMPLAR MODIFICADO',
                      mensajeError: 'ERROR AL MODIFICAR EJEMPLAR'));
            },
            style: ButtonStyle(
              backgroundColor: (!ejemplarUpdateValidacion(ejemplar))
                  ? const MaterialStatePropertyAll(Colors.grey)
                  : const MaterialStatePropertyAll(Colors.purple),
            ),
            child: const Text('Modificar ejemplar')),
        ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.redAccent)),
          onPressed: () {
            ref.read(routesProvider).pop();
            showDialog(
                context: context,
                builder: (_) => EliminarEntidad(
                    nombreProvider: deleteEjemplarProvider(widget.idEjemplar),
                    mensajeResult: 'EJEMPLAR ELIMINADO',
                    mensajeError: 'ERROR AL ELIMINAR EJEMPLAR'));
          },
          child: Text('Eliminar ejemplar',
              style: GoogleFonts.poppins(), textAlign: TextAlign.center),
        ),
        ElevatedButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            child: const Text('Cancelar'))
      ],
    );
  }
}
