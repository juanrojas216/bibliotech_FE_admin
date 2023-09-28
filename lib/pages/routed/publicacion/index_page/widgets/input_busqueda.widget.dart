import 'package:bibliotech_admin/pages/routed/publicacion/index_page/validations/search.validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/get_publicaciones.controller.dart';
import '../dto/search_publicacion.dto.dart';

class InputBusqueda extends ConsumerStatefulWidget {
  const InputBusqueda({super.key});

  @override
  InputBusquedaState createState() => InputBusquedaState();
}

class InputBusquedaState extends ConsumerState<InputBusqueda> {
  String titulo = '';
  String autor = '';
  String anio = '';
  String isbn = '';

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
              hintText: 'Búsqueda por título',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
            onChanged: (value) {
              titulo = value;
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
              hintText: 'Búsqueda por autor',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
            onChanged: (value) {
              autor = value;
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
              hintText: 'Búsqueda por año',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) {
              anio = value;
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
              hintText: 'Búsqueda por ISBN',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) {
              isbn = value;
              setState(() {});
            },
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 10),
        BotonBusqueda(titulo: titulo, anio: anio, autor: autor, isbn: isbn),
      ],
    );
  }
}

class BotonBusqueda extends ConsumerWidget {
  final String titulo;
  final String autor;
  final String anio;
  final String isbn;

  const BotonBusqueda({
    required this.titulo,
    required this.autor,
    required this.anio,
    required this.isbn,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: (!searchPublicacionValidacion(titulo, autor, anio, isbn))
              ? const MaterialStatePropertyAll(Colors.grey)
              : const MaterialStatePropertyAll(Colors.purple)),
      onPressed: () {
        if (!searchPublicacionValidacion(titulo, autor, anio, isbn)) return;
        ref.read(
          searchPublicacionesProvider(
            SearchPublicacionDto(
              titulo: titulo,
              anio: anio,
              autor: autor,
              isbn: isbn,
            ),
          ),
        );
      },
      child: Text('Buscar resultados', style: GoogleFonts.poppins()),
    );
  }
}
