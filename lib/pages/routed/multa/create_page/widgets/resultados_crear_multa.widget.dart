import 'dart:js_interop';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

import '../../../../../config/router/admin_router.dart';
import '../controllers/create_multa.controller.dart';
import '../controllers/get_motivos.controller.dart';
import '../../../../../widgets/crear_entidad.dart';
import '../dto/create_multa.dto.dart';
import '../dto/motivo_multa.dto.dart';

class ResultadoCrearMulta extends ConsumerStatefulWidget {
  final int idUsuario;
  final int idPrestamo;

  const ResultadoCrearMulta({
    required this.idUsuario,
    required this.idPrestamo,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResultadoCrearMultaState();
}

class _ResultadoCrearMultaState extends ConsumerState<ResultadoCrearMulta> {
  DateTime? fechaInicio;
  MotivoMultaDto? motivo;

  TextEditingController controllerDiaz = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var search = ref.watch(getMotivosMultaProvider);
    controllerDiaz.text =
        motivo.isNull ? 'Seleccionar motivo de multa' : motivo!.dias.toString();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: search.when(
          data: (data) => SizedBox(
            height: 300,
            width: 800,
            child: Column(
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
                        initialValue: widget.idPrestamo.toString(),
                        readOnly: true,
                        decoration: InputDecoration(
                            isDense: true,
                            labelText: 'ID PRÉSTAMO',
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
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.black45),
                          errorStyle: TextStyle(color: Colors.redAccent),
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.event_note),
                          labelText: 'FECHA INICIO',
                        ),
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
                    Expanded(
                      child: TextFormField(
                        controller: controllerDiaz,
                        readOnly: true,
                        decoration: InputDecoration(
                            isDense: true,
                            labelText: 'CANTIDAD DE DÍAS',
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
                  children: [
                    Text('MOTIVO DE MULTA', style: GoogleFonts.poppins()),
                    const SizedBox(height: 5),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: DropdownButton<int>(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 11),
                        isDense: true,
                        isExpanded: true,
                        hint: const Text('MOTIVO DE MULTA'),
                        value: motivo.isNull ? null : motivo!.id,
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins.toString(),
                            fontSize: 14),
                        items: [
                          ...data.map(
                            (m) => DropdownMenuItem(
                              value: m.id,
                              child: Text(
                                m.nombre,
                                style: GoogleFonts.poppins(),
                              ),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            motivo = data.firstWhere((e) => e.id == value);
                            setState(() {});
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (fechaInicio.isNull || motivo.isNull) return;
                          final createDto = CreateMultaDto(
                            idUsuario: widget.idUsuario.toString(),
                            idMotivoMulta: motivo!.id.toString(),
                            idPrestamo: widget.idPrestamo.toString(),
                            fechaInicioMulta: fechaInicio,
                          );
                          await showDialog(
                              context: context,
                              builder: (_) => CrearEntidad<CreateMultaDto>(
                                    entidad: createDto,
                                    nombreProvider: createMultaProvider,
                                    mensajeResult: 'MULTA CREADA',
                                    mensajeError: 'ERROR AL CREAR MULTA',
                                  ));
                          ref.read(routesProvider).pushReplacement('/multa');
                        },
                        style: ButtonStyle(
                          backgroundColor: fechaInicio.isNull || motivo.isNull
                              ? const MaterialStatePropertyAll(Colors.grey)
                              : const MaterialStatePropertyAll(Colors.purple),
                        ),
                        child: Text(
                          'CREAR MULTA',
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          error: (error, stackTrace) => Center(
              child: ElevatedButton(
                  onPressed: () {
                    ref.invalidate(getMotivosMultaProvider);
                  },
                  child: Text('Reintentar cargar motivos de multa',
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
