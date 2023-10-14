import 'dart:js_interop';

import 'package:bibliotech_admin/widgets/crear_entidad.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'package:bibliotech_admin/config/router/admin_router.dart';

import '../controllers/create_parametro.controller.dart';
import '../dto/create_parametro_multa.dto.dart';
import '../validations/parametro.validation.dart';


class CreateParametroMultaPage extends ConsumerStatefulWidget {
  const CreateParametroMultaPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateParametroMultaPageState();
}

class _CreateParametroMultaPageState
    extends ConsumerState<CreateParametroMultaPage> {

  CreateParametroMultaDto createParametro = CreateParametroMultaDto(
    dias: null,
    nombre: null,
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Card(
        shape: Border.all(color: Colors.grey),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "CREAR PARÁMETRO DE MULTA",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.red),
                        ),
                        onPressed: () {
                          ref.read(routesProvider).pop();
                        },
                        child: Text(
                          'VOLVER',
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
              const Divider(color: Colors.grey),

              //LISTA DE PARAMETROS
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: 800,
                  height: 100,
                  child: ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            initialValue: createParametro.nombre,
                            onChanged: (value) {
                              createParametro.nombre = value;
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'NOMBRE DE PARÁMETRO',
                              labelStyle: TextStyle(
                                  fontFamily: GoogleFonts.poppins.toString(),
                                  fontSize: 14),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            initialValue: createParametro.dias.isNull ? null : createParametro.dias.toString(),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              createParametro.dias = int.tryParse(value) ?? 0;
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'CANTIDAD DE DÍAS',
                              labelStyle: TextStyle(
                                  fontFamily: GoogleFonts.poppins.toString(),
                                  fontSize: 14),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.save,
                            color: createParametroMultaValidacion(createParametro)
                                ? Colors.purple
                                : Colors.grey,
                          ),
                          onPressed: () {
                            if (!createParametroMultaValidacion(createParametro)) return;
                            showCupertinoDialog(
                              context: context,
                              builder: (context) =>
                                  CrearEntidad<CreateParametroMultaDto>(
                                      entidad: createParametro,
                                      nombreProvider: createParametroMultaProvider,
                                      mensajeResult: "PARÁMETRO CREADO",
                                      mensajeError: "ERROR AL CREAR EL PARÁMETRO"),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
