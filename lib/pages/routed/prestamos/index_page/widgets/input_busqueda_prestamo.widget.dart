import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/get_prestamos.controller.dart';
import '../validations/index.dart';

class InputBusquedaPrestamo extends ConsumerStatefulWidget {
  const InputBusquedaPrestamo({super.key});

  @override
  InputBusquedaState createState() => InputBusquedaState();
}

class InputBusquedaState extends ConsumerState<InputBusquedaPrestamo> {
  @override
  Widget build(BuildContext context) {

    var search = ref.watch(busquedaPrestamoProvider);

    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              hintText: 'Búsqueda por dni de usuario',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
            onChanged: (value) {
              ref
                  .read(busquedaPrestamoProvider.notifier)
                  .update((state) => state.copyWith(dni: value));
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
              hintText: 'Búsqueda por título de publicación',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
            onChanged: (value) {
              ref
                  .read(busquedaPrestamoProvider.notifier)
                  .update((state) => state.copyWith(tituloPublicacion: value));
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
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                suffixIcon: const Icon(Icons.event_note, size: 18),
                labelText: 'Fecha Desde',
                labelStyle: GoogleFonts.poppins(fontSize: 15)),
            lastDate: DateTime.now(),
            initialValue: search.fechaDesde,
            mode: DateTimeFieldPickerMode.date,
            autovalidateMode: AutovalidateMode.always,
            onDateSelected: (DateTime value) {
              ref
                  .read(busquedaPrestamoProvider.notifier)
                  .update((state) => state.copyWith(fechaDesde: value));
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
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                suffixIcon: const Icon(Icons.event_note, size: 18),
                labelText: 'Fecha Hasta',
                labelStyle: GoogleFonts.poppins(fontSize: 14)),
            lastDate: DateTime.now(),
            initialValue: search.fechaHasta,
            mode: DateTimeFieldPickerMode.date,
            autovalidateMode: AutovalidateMode.always,
            onDateSelected: (DateTime value) {
              ref
                  .read(busquedaPrestamoProvider.notifier)
                  .update((state) => state.copyWith(fechaHasta: value));
              setState(() {});
            },
          ),
        ),
        const SizedBox(width: 10),
        const BotonBusqueda(),
      ],
    );
  }
}

class BotonBusqueda extends ConsumerWidget {
  const BotonBusqueda({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    var search = ref.watch(busquedaPrestamoProvider);

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: !searchPrestamoValidacion(
          search.dni,
          search.tituloPublicacion,
          search.fechaDesde,
          search.fechaHasta,
        )
            ? const MaterialStatePropertyAll(Colors.grey)
            : const MaterialStatePropertyAll(Colors.purple),
      ),
      onPressed: () {
        if (!searchPrestamoValidacion(
          search.dni,
          search.tituloPublicacion,
          search.fechaDesde,
          search.fechaHasta,
        )) return;
        ref.invalidate(searchPrestamosProvider);
      },
      child: Text('Buscar resultados', style: GoogleFonts.poppins()),
    );
  }
}