import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/get_multas.controller.dart';
import '../dto/search_multa.dto.dart';
import '../validations/index.dart';

class InputBusquedaMulta extends ConsumerStatefulWidget {
  const InputBusquedaMulta({super.key});

  @override
  InputBusquedaState createState() => InputBusquedaState();
}

class InputBusquedaState extends ConsumerState<InputBusquedaMulta> {
  String? idUsuario;
  String? idPrestamo;
  DateTime? fechaDesde;
  DateTime? fechaHasta;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              hintText: 'Búsqueda por id de usuario',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
            onChanged: (value) {
              idUsuario = value;
              setState(() {});
            },
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              hintText: 'Búsqueda por id de préstamo',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
            onChanged: (value) {
              idPrestamo = value;
              setState(() {});
            },
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: DateTimeFormField(
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              hintStyle: const TextStyle(color: Colors.black45),
              errorStyle: const TextStyle(color: Colors.redAccent),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))
              ),
              suffixIcon: const Icon(Icons.event_note, size: 18),
              labelText: 'Fecha Desde',
              labelStyle: GoogleFonts.poppins(fontSize: 15)
            ),
            lastDate: DateTime.now(),
            initialValue: fechaDesde,
            mode: DateTimeFieldPickerMode.date,
            autovalidateMode: AutovalidateMode.always,
            onDateSelected: (DateTime value) {
              fechaDesde = value;
              setState(() {});
            },
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: DateTimeFormField(
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              hintStyle: const TextStyle(color: Colors.black45),
              errorStyle: const TextStyle(color: Colors.redAccent),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))
              ),
              suffixIcon: const Icon(Icons.event_note, size: 18),
              labelText: 'Fecha Hasta',
              labelStyle: GoogleFonts.poppins(fontSize: 14)
            ),
            lastDate: DateTime.now(),
            initialValue: fechaDesde,
            mode: DateTimeFieldPickerMode.date,
            autovalidateMode: AutovalidateMode.always,
            onDateSelected: (DateTime value) {
              fechaDesde = value;
              setState(() {});
            },
          ),
        ),
        const SizedBox(width: 10),
        BotonBusqueda(idUsuario: idUsuario, idPrestamo: idPrestamo, fechaDesde: fechaDesde, fechaHasta: fechaHasta),
      ],
    );
  }
}

class BotonBusqueda extends ConsumerWidget {
  final String? idUsuario;
  final String? idPrestamo;
  final DateTime? fechaDesde;
  final DateTime? fechaHasta;

  const BotonBusqueda({
    required this.idUsuario,
    required this.idPrestamo,
    required this.fechaDesde,
    required this.fechaHasta,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              (!searchMultaValidacion(idPrestamo, idUsuario, fechaDesde, fechaHasta))
                  ? const MaterialStatePropertyAll(Colors.grey)
                  : const MaterialStatePropertyAll(Colors.purple)),
      onPressed: () {
        if (!searchMultaValidacion(idPrestamo, idUsuario, fechaDesde, fechaHasta)) return;
        ref.read(
          searchMultasProvider(
            SearchMultaDto(
              idPrestamo: idPrestamo,
              idUsuario: idUsuario,
              fechaDesde: fechaDesde,
              fechaHasta: fechaHasta,
            ),
          ),
        );
      },
      child: Text('Buscar resultados', style: GoogleFonts.poppins()),
    );
  }
}
