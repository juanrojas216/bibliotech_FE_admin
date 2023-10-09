import 'package:auto_size_text/auto_size_text.dart';
import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/editorial/controllers/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/editorial/pages/addEditorial.page.dart';
import 'package:bibliotech_admin/pages/parametrospages/editorial/pages/editarEditorial.page.dart';
import 'package:bibliotech_admin/pages/parametrospages/editorial/services/filterEditoriales.services.dart';
import 'package:bibliotech_admin/widgets/mostrar_usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class EditorialesIndex extends ConsumerStatefulWidget {
  const EditorialesIndex({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditorialesIndexState();
}

class _EditorialesIndexState extends ConsumerState<EditorialesIndex> {

  late String filtro;

  @override
  void initState() {
    super.initState();
    filtro = '';
  }

   @override
  Widget build(BuildContext context) {
    
    var editoriales = ref.watch(filtroEditorialesProvider(filtro));
    var _ = ref.watch(getAllEditorialProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black),
        elevation: 0,
        title: AutoSizeText('Editoriales',
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 20)),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => const EditorialAdd());
                },
                child: const Text('Nueva editorial')),
          ),
          const SizedBox(width: 20),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Center(child: MostrarUsuario()),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Center(
        child: Container(
          height: 100.h,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: const Border.fromBorderSide(
                BorderSide(color: Colors.grey, width: 2)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ref.read(getAllEditorialProvider).when(
            skipLoadingOnRefresh: false,
            data: (_) => Column(children: [
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    label: Text('Buscador', style: GoogleFonts.poppins()),
                    border: const OutlineInputBorder()),
                initialValue: filtro,
                onChanged: (value) {
                  filtro = value;
                  setState(() {});
                },
              ),
              const SizedBox(height: 10),
              Flexible(
                child: ListView(
                  children: editoriales
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(16)),
                              child: ListTile(
                                trailing: const Icon(Icons.more_vert),
                                title: Text(e.nombre),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => EditorialEditar(e.id),
                                  );
                                },
                              ),
                            ),
                          ))
                      .toList(),
                ),
              )
            ]),
            error: (__, _) => Center(
              child: ElevatedButton(
                child: const Text('Reintentar cargar editoriales'),
                onPressed: () {
                  ref.invalidate(getAllEditorialProvider);
                },
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
