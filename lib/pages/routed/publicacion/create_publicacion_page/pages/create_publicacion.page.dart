import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/widgets/crear_entidad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';


import '../../../../../widgets/mostrar_usuario.dart';
import '../controllers/createPublicacion.controller.dart';
import '../repository/publicacionDto.repository.dart';
import '../validations/publicacion.validation.dart';
import '../dto/publicacion.dto.dart';
import '../widgets/index.dart';

class CreatePublicacionPage extends ConsumerStatefulWidget {
  const CreatePublicacionPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreatePublicacionPageState();
}

class _CreatePublicacionPageState extends ConsumerState<CreatePublicacionPage> {
  
  var mostrarLink = false;

  @override
  Widget build(BuildContext context) {

    var publicacion = ref.watch(publicacionDtoProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton.filled(
            onPressed: () => {ref.read(routesProvider).pop()},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        elevation: 0,
        title: AutoSizeText('Nueva publicacion',
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 20)),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                if (!publicacionValidacion(publicacion)) return;
                showDialog(
                  context: context,
                  builder: (_) => CrearEntidad<PublicacionDto>(
                      entidad: publicacion,
                      nombreProvider: createPublicacionProvider,
                      mensajeResult: 'PUBLICACIÓN CREADA',
                      mensajeError: 'ERROR AL CREAR PUBLICACIÓN'),
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    (!publicacionValidacion(publicacion))
                        ? const MaterialStatePropertyAll(Colors.grey)
                        : const MaterialStatePropertyAll(Colors.purple),
              ),
              child: const Row(
                children: [
                  Icon(Icons.save_alt),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Crear publicación'),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Center(child: MostrarUsuario()),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Margin(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TituloInput(),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: IsbnInput(),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: PagesInput(),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const LinkInput(), 
              ),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const Row(
                  children: [
                    Expanded(child: EdicionInput()),
                    SizedBox(width: 10),
                    Expanded(child: AnioInput()),
                    SizedBox(width: 10),
                    Expanded(child: TipoInput()),
                  ],
                ),
              ),
              const CategoriasPublicacion(),
              const EditorialesPublicacion(),
              const AutoresPublicacion(),
            ],
          ),
        ),
      ),
    );
  }
}
