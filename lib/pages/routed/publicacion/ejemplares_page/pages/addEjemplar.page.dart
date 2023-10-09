import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/widgets/crear_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/createEjemplar.controller.dart';
import '../controllers/getAllUbicaciones.controller.dart';
import '../dto/create_ejemplar.dto.dart';
import '../repository/ubicaciones.repository.dart';
import '../validations/ejemplar.validation.dart';

class EjemplarAdd extends ConsumerStatefulWidget {
  
  final int idPublicacion;

  const EjemplarAdd({required this.idPublicacion, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddEjemplarState();
}

class _AddEjemplarState extends ConsumerState<EjemplarAdd> {
  String serialNFC = '';
  int? ubicacion;

  @override
  Widget build(BuildContext context) {
    var _ = ref.watch(ubicacionesProvider);

    return AlertDialog(
      title: Text('Nuevo ejemplar',
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
                    serialNFC = value,
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
                            hint: const Text('UBICACIÓN'),
                            value: ubicacion,
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
                                ubicacion = ref
                                    .read(ubicacionesProvider)
                                    .firstWhere((u) => u.id == value)
                                    .id;
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
              final ejemplarDto = EjemplarDto(
                publicacionId: widget.idPublicacion,
                serialNFC: serialNFC,
                ubicacionId: ubicacion,
              );
              if (!ejemplarValidacion(ejemplarDto)) return;
              ref.read(routesProvider).pop();
              showDialog(
                  context: context,
                  builder: (_) => CrearEntidad<EjemplarDto>(
                        entidad: ejemplarDto,
                        nombreProvider: createEjemplarProvider,
                        mensajeResult: 'EJEMPLAR CREADO',
                        mensajeError: 'ERROR AL CREAR EJEMPLAR',
                      ));
            },
            style: ButtonStyle(
              backgroundColor: ejemplarValidacion(EjemplarDto(
                publicacionId: widget.idPublicacion,
                serialNFC: serialNFC,
                ubicacionId: ubicacion,
              ))
                  ? const MaterialStatePropertyAll(Colors.purple)
                  : const MaterialStatePropertyAll(Colors.grey),
            ),
            child: const Text('Agregar ejemplar')),
        ElevatedButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            child: const Text('Cancelar'))
      ],
    );
  }
}
