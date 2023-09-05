import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../publicacion_controller.dart';

class InputBusqueda extends ConsumerWidget {
  const InputBusqueda({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              hintText: 'Búsqueda por título',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
            onChanged: (value) => {
              ref.read(entradaBusquedaTituloProvider.notifier).state = value,
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
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              hintText: 'Búsqueda por autor',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
            onChanged: (value) => {
              ref.read(entradaBusquedaAutorProvider.notifier).state = value,
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
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              hintText: 'Búsqueda por anio',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) => {
              ref.read(entradaBusquedaAnioProvider.notifier).state = value,
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
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              hintText: 'Búsqueda por ISBN',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) => {
              ref.read(entradaBusquedaISBNProvider.notifier).state = value,
            },
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 10),
        const BotonBusqueda(),
      ],
    );
  }
}

class BotonBusqueda extends ConsumerWidget {
  const BotonBusqueda({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var inputTituloBusqueda = ref.watch(entradaBusquedaTituloProvider);
    var inputAutorBusqueda = ref.watch(entradaBusquedaAutorProvider);
    var inputAnioBusqueda = ref.watch(entradaBusquedaAnioProvider);
    var inputISBNBusqueda = ref.watch(entradaBusquedaISBNProvider);

    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: (inputTituloBusqueda.trim().isEmpty &&
                  inputAutorBusqueda.trim().isEmpty &&
                  inputAnioBusqueda.trim().isEmpty &&
                  inputISBNBusqueda.trim().isEmpty)
              ? const MaterialStatePropertyAll(Colors.grey)
              : const MaterialStatePropertyAll(Colors.purple)),
      onPressed: () {
        if (inputTituloBusqueda.trim().isEmpty &&
            inputAutorBusqueda.trim().isEmpty &&
            inputAnioBusqueda.trim().isEmpty &&
            inputISBNBusqueda.trim().isEmpty) {
          ref.read(mostrarResultadosProvider.notifier).update((state) => false);
          return;
        }
        ref.read(mostrarResultadosProvider.notifier).update((state) => true);
        ref.invalidate(tablaResultadosProvider);
      },
      child: Text('Buscar resultados', style: GoogleFonts.poppins()),
    );
  }
}
