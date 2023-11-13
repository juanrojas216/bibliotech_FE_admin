import 'dart:js_interop';

import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

import '../controllers/create_prestamo.controller.dart';
import '../controllers/get_cantidad_dias_prestamo.controller.dart';
import '../controllers/get_ejemplares.controller.dart';
import '../../../../../widgets/crear_entidad.dart';
import '../dto/create_prestamo.dto.dart';
import '../dto/ejemplar_prestamo.dto copy.dart';

class ResultadoCrearPrestamo extends ConsumerStatefulWidget {
  final int idUsuario;
  final int idPublicacion;

  const ResultadoCrearPrestamo({
    required this.idUsuario,
    required this.idPublicacion,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResultadoCrearMultaState();
}

class _ResultadoCrearMultaState extends ConsumerState<ResultadoCrearPrestamo> {
  DateTime? fechaInicio;
  int? cantidadDiaz;
  EjemplarPrestamoDto? ejemplar;

  TextEditingController controllerDiaz = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var search = ref.watch(searchEjemplaresProvider(widget.idPublicacion));
    var searchCantidadDiazMax = ref.watch(getCantidadDiasPrestamo);
    controllerDiaz.text = fechaInicio.isNull || cantidadDiaz.isNull
        ? 'Seleccionar fecha inicio y dias'
        : '${fechaInicio!.add(Duration(days: cantidadDiaz!)).day}-${fechaInicio!.add(Duration(days: cantidadDiaz!)).month}-${fechaInicio!.add(Duration(days: cantidadDiaz!)).year}';

    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: search.when(
          skipLoadingOnRefresh: false,
          data: (data) => SizedBox(
            height: 300,
            width: 800,
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextFormField(
                          initialValue: widget.idUsuario.toString(),
                          readOnly: true,
                          decoration: InputDecoration(
                              isDense: true,
                              labelText: 'ID USUARIO',
                              labelStyle: TextStyle(
                                  fontFamily: GoogleFonts.poppins.toString(),
                                  fontSize: 14),
                              border: const OutlineInputBorder()),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          initialValue: widget.idPublicacion.toString(),
                          readOnly: true,
                          decoration: InputDecoration(
                              isDense: true,
                              labelText: 'ID PUBLICACIÓN',
                              labelStyle: TextStyle(
                                  fontFamily: GoogleFonts.poppins.toString(),
                                  fontSize: 14),
                              border: const OutlineInputBorder()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: DateTimeFormField(
                          validator: (value) {
                            if (value == null) {
                              return "Debe seleccionar una fecha";
                            } else if (DateTime.now().isAfter(value)) {
                              return "Debe seleccionar una fecha posterios a la actual o la actual";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.black45),
                            errorStyle: TextStyle(color: Colors.redAccent),
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.event_note),
                            labelText: 'FECHA INICIO',
                          ),
                          dateFormat: DateFormat('dd-MM-yyyy'),
                          firstDate: DateTime.now(),
                          mode: DateTimeFieldPickerMode.date,
                          autovalidateMode: AutovalidateMode.always,
                          onDateSelected: (DateTime value) {
                            fechaInicio = value;
                            setState(() {});
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      searchCantidadDiazMax.when(
                        data: (data) => Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: DropdownButtonFormField<int>(
                              validator: (value) {
                                if (value != null) {
                                  return null;
                                }
                                return "Debe seleccionar la cantidad de días";
                              },
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              isDense: true,
                              isExpanded: true,
                              hint: const Text('CANTIDAD DE DÍAS'),
                              value: cantidadDiaz.isNull ? null : cantidadDiaz!,
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins.toString(),
                                  fontSize: 14),
                              items: [
                                ...List.generate(
                                  int.parse(data),
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
                                  setState(() {});
                                }
                              },
                            ),
                          ),
                        ),
                        error: (error, stackTrace) => Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  ref.invalidate(getCantidadDiasPrestamo);
                                },
                                child: Text(
                                    'Reintentar cargar máximo días préstamo',
                                    style: GoogleFonts.poppins()))),
                        loading: () => const Expanded(
                            child: LinearProgressIndicator()),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: controllerDiaz,
                          readOnly: true,
                          decoration: InputDecoration(
                              isDense: true,
                              labelText: 'FECHA FIN',
                              labelStyle: TextStyle(
                                  fontFamily: GoogleFonts.poppins.toString(),
                                  fontSize: 14),
                              border: const OutlineInputBorder()),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('EJEMPLAR', style: GoogleFonts.poppins()),
                      const SizedBox(height: 5),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: DropdownButtonFormField<int>(
                          validator: (value) {
                            if (value != null) {
                              return null;
                            }
                            return "Debe seleccionar un ejemplar";
                          },
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          isDense: true,
                          isExpanded: true,
                          hint: const Text('EJEMPLAR'),
                          value: ejemplar.isNull ? null : ejemplar!.id,
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins.toString(),
                              fontSize: 14),
                          items: [
                            ...data["ejemplares"].map(
                              (e) => DropdownMenuItem<int>(
                                value: e.id,
                                child: Text(
                                  'Ejemplar #${e.id} - Valoracion ${e.valoracion}',
                                  style: GoogleFonts.poppins(),
                                ),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              ejemplar = data["ejemplares"]
                                  .firstWhere((e) => e.id == value);
                              setState(() {});
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const Flexible(child: SizedBox(height: 20)),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (fechaInicio.isNull ||
                                ejemplar.isNull ||
                                cantidadDiaz.isNull) return;
                            final createDto = CreatePrestamoDto(
                              idUsuario: widget.idUsuario,
                              ejemplarId: ejemplar?.id,
                              fechaInicioPrestamo: fechaInicio,
                              fechaFinPrestamo: fechaInicio!
                                  .add(Duration(days: cantidadDiaz!)),
                            );
                            await showDialog(
                                context: context,
                                builder: (_) => CrearEntidad<CreatePrestamoDto>(
                                      entidad: createDto,
                                      nombreProvider: createPrestamoProvider,
                                      mensajeResult: 'PRESTAMO CREADA',
                                      mensajeError: 'ERROR AL CREAR PRESTAMO',
                                    ));
                            //ref.read(routesProvider).pushReplacement('/prestamo');
                          },
                          style: ButtonStyle(
                            backgroundColor: (fechaInicio.isNull ||
                                    ejemplar.isNull ||
                                    cantidadDiaz.isNull)
                                ? const MaterialStatePropertyAll(Colors.grey)
                                : const MaterialStatePropertyAll(Colors.purple),
                          ),
                          child: Text(
                            'CREAR PRÉSTAMO',
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          error: (error, stackTrace) => Center(
              child: ElevatedButton(
                  onPressed: () {
                    ref.invalidate(searchEjemplaresProvider);
                  },
                  child: Text('Reintentar cargar ejemplares',
                      style: GoogleFonts.poppins()))),
          loading: () => const SizedBox(
            height: 1000,
            width: 800,
            child: Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
