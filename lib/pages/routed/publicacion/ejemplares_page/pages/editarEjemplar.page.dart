import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/widgets/eliminar_entidad.dart';
import 'package:bibliotech_admin/widgets/modificar_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/deleteEjemplar.controller.dart';
import '../controllers/getAllUbicaciones.controller.dart';
import '../controllers/getAllUbicacionesWith.controller.dart';
import '../controllers/updateEjemplar.controller.dart';
import '../dto/ejemplar_item.dto.dart';
import '../validations/ejemplarUpdate.validation.dart';
import '../validations/nfc.validation.dart';

class EjemplarEditar extends ConsumerStatefulWidget {
  final EjemplarItemDto ejemplarPadre;

  const EjemplarEditar(this.ejemplarPadre, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EjemplarEditarState();
}

class _EjemplarEditarState extends ConsumerState<EjemplarEditar> {
  late EjemplarItemDto ejemplar;

  @override
  void initState() {
    super.initState();
    ejemplar = widget.ejemplarPadre.copyWith();
  }

  @override
  Widget build(BuildContext context) {
    var searchUbicaiones = ref
        .watch(getAllUbicacionLibreWithProvider(ejemplar.ubicacion.id));

    return AlertDialog(
      title: Text('Editar ejemplar',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: SizedBox(
        width: 400,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: ejemplar.id.toString(),
                    readOnly: true,
                    decoration: InputDecoration(
                        isDense: true,
                        labelText: 'ID del ejemplar',
                        labelStyle: TextStyle(
                            fontFamily: GoogleFonts.poppins.toString(),
                            fontSize: 14),
                        border: const OutlineInputBorder()),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    initialValue: ejemplar.estado,
                    readOnly: true,
                    decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Estado del ejemplar',
                        labelStyle: TextStyle(
                            fontFamily: GoogleFonts.poppins.toString(),
                            fontSize: 14),
                        border: const OutlineInputBorder()),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    initialValue: '${ejemplar.valoracion}/10',
                    readOnly: true,
                    decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Valoracion del ejemplar',
                        labelStyle: TextStyle(
                            fontFamily: GoogleFonts.poppins.toString(),
                            fontSize: 14),
                        border: const OutlineInputBorder()),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) => {
                      ejemplar.serialNfc = value,
                      //setState(() {}),
                    },
                    initialValue: ejemplar.serialNfc,
                    validator: (value) {
                      if (nfcEjemplarValidacion(value)) {
                        return null;
                      }
                      return "El serial debe tener una longitud de 16";
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
                  searchUbicaiones.when(
                      data: (ubicaciones) => DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: DropdownButtonFormField<int>(
                              validator: (value) {
                                if (value != null) {
                                  return null;
                                }
                                return "Debe seleccionar una ubicacion";
                              },
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              isDense: true,
                              isExpanded: true,
                              hint: const Text('UBICACION'),
                              value: ejemplar.ubicacion.id,
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins.toString(),
                                  fontSize: 14),
                              items: [
                                ...ubicaciones.map(
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
                                  ejemplar.ubicacion = ubicaciones
                                      .firstWhere((u) => u.id == value);
                                  //setState(() {});
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
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            child: const Text('Cancelar'))
      ],
    );
  }
}
