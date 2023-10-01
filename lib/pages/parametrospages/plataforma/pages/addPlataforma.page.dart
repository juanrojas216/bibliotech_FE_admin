import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/plataforma/dto/create_plataforma.dto.dart';
import 'package:bibliotech_admin/pages/parametrospages/plataforma/validations/plataforma.validation.dart';
import 'package:bibliotech_admin/widgets/crear_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/index.dart';

class PlataformaAdd extends ConsumerStatefulWidget {
  const PlataformaAdd({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddPlataformaState();
}

class _AddPlataformaState extends ConsumerState<PlataformaAdd> {
  String nombre = '';
  String url = '';
  String instrucciones = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: 600,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) => {
                    nombre = value,
                    setState(() {}),
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Nombre de la paltaforma',
                      labelStyle: TextStyle(
                          fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
                      border: const OutlineInputBorder()),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  onChanged: (value) => {
                    url = value,
                    setState(() {}),
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Url de la plataforma',
                      labelStyle: TextStyle(
                          fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
                      border: const OutlineInputBorder()),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  maxLines: 15,
                  onChanged: (value) {
                    instrucciones = value;
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Instrucciones',
                      labelStyle: TextStyle(
                          fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
                      border: const OutlineInputBorder()),
                ),
              ],
            ),
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
            onPressed: () {
              if (!plataformaValidacion(nombre, url, instrucciones)) return;
              ref.read(routesProvider).pop();
              showDialog(
                  context: context,
                  builder: (_) => CrearEntidad(
                        entidad: CreatePlataformaDto(
                            nombre: nombre,
                            url: url,
                            instrucciones: instrucciones),
                        nombreProvider: createPlataformaProvider,
                        mensajeResult: 'PLATAFORMA CREADA',
                        mensajeError: 'ERROR AL CREAR PLATAFORMA',
                      ));
            },
            style: ButtonStyle(
              backgroundColor:
                  (!plataformaValidacion(nombre, url, instrucciones))
                      ? const MaterialStatePropertyAll(Colors.grey)
                      : const MaterialStatePropertyAll(Colors.purple),
            ),
            child: const Text('Agregar plataforma')),
        ElevatedButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            child: const Text('Cancelar'))
      ],
    );
  }
}
