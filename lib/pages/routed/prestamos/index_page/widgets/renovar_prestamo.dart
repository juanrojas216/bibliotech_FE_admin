import 'dart:js_interop';

import 'package:bibliotech_admin/widgets/modificar_entidad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controllers/get_parametros_prestamo.controller.dart';
import '../controllers/renovar_prestamo.controller.dart';
import '../controllers/validar_renovacion.controller.dart';
import '../dto/renovar_prestamo.dto.dart';

class RenovarPrestamo extends ConsumerStatefulWidget {
  final int idPrestamo;

  const RenovarPrestamo(
    this.idPrestamo, {
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RenovarPrestamoState();
}

class _RenovarPrestamoState extends ConsumerState<RenovarPrestamo> {
  
  int? cantidadDiaz;
  DateTime? fechaFinNueva;


  @override
  Widget build(BuildContext context) {
    
    var search = ref.watch(validarRenovacionPrestamoProvider(widget.idPrestamo));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: search.when(
        data: (data) => SizedBox(
          height: 100,
          width: 1000,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Visibility(
              visible: data["renovacion"].cantidadRenovacionesDispoibles > 0,
              replacement: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.not_interested_sharp),
                      SizedBox(height: 5),
                      Text("LIMITE DE RENOVACIONES OCUPADAS"),
                    ],
                  ),
                ),
              ),
              child: ListView(
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            initialValue: data["renovacion"].fechaFinalizacionPrevista,
                            readOnly: true,
                            decoration: InputDecoration(
                                isDense: true,
                                labelText: 'FECHA FIN ACTUAL',
                                labelStyle: TextStyle(
                                    fontFamily: GoogleFonts.poppins.toString(),
                                    fontSize: 14),
                                border: const OutlineInputBorder()),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: DropdownButton<int>(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 11),
                              isDense: true,
                              isExpanded: true,
                              hint: const Text('CANTIDAD DE DIAS A RENOVAR'),
                              value: cantidadDiaz.isNull ? null : cantidadDiaz!,
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins.toString(),
                                  fontSize: 14),
                              items: [
                                ...List.generate(
                                  data["diasMaximo"],
                                  (index) => DropdownMenuItem(
                                    value: index + 1,
                                    child: Text(
                                      'Cantidad de dias - ${index + 1}',
                                      style: GoogleFonts.poppins(),
                                    ),
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                if (value != null) {
                                  cantidadDiaz = value;
                                  fechaFinNueva = (data["renovacion"].fechaFinalizacionPrevista as DateTime).add(Duration(days: cantidadDiaz!)); 
                                  setState(() {});
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            initialValue: fechaFinNueva == null ? data["renovacion"].fechaFinalizacionPrevista : '${fechaFinNueva!.day}-${fechaFinNueva!.month}-${fechaFinNueva!.year}',
                            readOnly: true,
                            decoration: InputDecoration(
                                isDense: true,
                                labelText: 'FECHA FIN ESTIMADA',
                                labelStyle: TextStyle(
                                    fontFamily: GoogleFonts.poppins.toString(),
                                    fontSize: 14),
                                border: const OutlineInputBorder()),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    subtitle: Padding(padding: const EdgeInsets.only(top: 5), child: Text("Renovaciones dispoibles restantes: ${data["renovacion"].cantidadRenovacionesDispoibles}")),
                    trailing: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: !cantidadDiaz.isNull ? const MaterialStatePropertyAll(Colors.purple) : const MaterialStatePropertyAll(Colors.grey),
                      ),
                      child: const Text("RENOVAR PRÉSTAMO"),
                      onPressed: () {
                        if (cantidadDiaz.isNull) return;
                        showCupertinoDialog(
                          context: context,
                          builder: (context) =>
                              ModificarEntidad<RenovarPrestamoDto>(
                                  entidad: RenovarPrestamoDto(
                                      cantidadDiaz: cantidadDiaz,
                                      idPrestamo: widget.idPrestamo),
                                  nombreProvider: renovarPrestamoProvider,
                                  mensajeResult: "PRÉSTAMO RENOVADO",
                                  mensajeError: "ERROR AL RENOVAR EL PRÉSTAMO"),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        error: (error, stackTrace) => Center(
            child: ElevatedButton(
                onPressed: () {
                  ref.invalidate(getParametrosPrestamoProvider);
                },
                child: Text('Reintentar cargar datos',
                    style: GoogleFonts.poppins()))),
        loading: () => const SizedBox(
          height: 1000,
          width: 800,
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
