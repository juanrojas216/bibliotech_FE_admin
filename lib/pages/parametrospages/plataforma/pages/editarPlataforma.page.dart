import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/plataforma/controllers/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/plataforma/repository/plataformas.repository.dart';
import 'package:bibliotech_admin/widgets/eliminar_entidad.dart';
import 'package:bibliotech_admin/widgets/modificar_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../validations/plataforma.validation.dart';

class PlataformaEditar extends ConsumerStatefulWidget {
  final int idPlataforma;

  const PlataformaEditar(this.idPlataforma, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PlataformaEditarState();
}

class _PlataformaEditarState extends ConsumerState<PlataformaEditar> {
  
  late Plataforma plataforma;

  @override
  void initState() {
    super.initState();
    plataforma = ref
        .read(plataformasProvider)
        .firstWhere((e) => widget.idPlataforma == e.id).copyWith();
  }

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text('Editar plataforma',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: SizedBox(
        width: 600,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                TextFormField(
                  initialValue: plataforma.nombre,
                  onChanged: (value) => {
                    plataforma.nombre = value,
                    setState(() {}),
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Nuevo nombre de la paltaforma',
                      labelStyle: TextStyle(
                          fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
                      border: const OutlineInputBorder()),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: plataforma.url,
                  onChanged: (value) => {
                    plataforma.url = value,
                    setState(() {}),
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Nuevo url de la plataforma',
                      labelStyle: TextStyle(
                          fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
                      border: const OutlineInputBorder()),
                ),
                const SizedBox(height: 10),
                TextFormField(
                        maxLines: 15,
                        initialValue: plataforma.instrucciones,
                        onChanged: (value) {
                          plataforma.instrucciones = value;
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            isDense: true,
                            labelText: 'Instrucciones',
                            labelStyle: TextStyle(
                                fontFamily: GoogleFonts.poppins.toString(),
                                fontSize: 14),
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
            if (!plataformaValidacion(plataforma.nombre, plataforma.url, plataforma.instrucciones)) return;
            ref.read(routesProvider).pop();
            showDialog(
                context: context,
                builder: (_) => ModificarEntidad(
                    entidad: plataforma,
                    nombreProvider: updatePlataformaProvider,
                    mensajeResult: 'PLATAFORMA MODIFICADA',
                    mensajeError: 'ERROR AL MODIFICAR PLATAFORMA'));
          },
          style: ButtonStyle(
              backgroundColor:
                  (!plataformaValidacion(plataforma.nombre, plataforma.url, plataforma.instrucciones))
                      ? const MaterialStatePropertyAll(Colors.grey)
                      : const MaterialStatePropertyAll(Colors.purple),
            ),
          child: Text('Guardar cambios',
              style: GoogleFonts.poppins(), textAlign: TextAlign.center),
        ),
        ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.redAccent)),
          onPressed: () {
            ref.read(routesProvider).pop();
            showDialog(
                context: context,
                builder: (_) => EliminarEntidad(
                    nombreProvider: deletePlataformaProvider(widget.idPlataforma),
                    mensajeResult: 'PLATAFORMA ELIMINADA',
                    mensajeError: 'ERROR AL ELIMINAR PLATAFORMA'));
          },
          child: Text('Eliminar plataforma',
              style: GoogleFonts.poppins(), textAlign: TextAlign.center),
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(routesProvider).pop();
          },
          child: Text('Cancelar',
              style: GoogleFonts.poppins(), textAlign: TextAlign.center),
        )
      ],
    );
  }
}
