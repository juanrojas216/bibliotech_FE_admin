import 'package:auto_size_text/auto_size_text.dart';
import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/editorial/editorial_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'add_editorial.dart';
import 'editorial_editar.dart';

class EditorialesAbm extends ConsumerWidget {
  const EditorialesAbm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var editorialesGet = ref.watch(editorialesABMProvider);
    var editoriales = ref.watch(filtroEditorialProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            icon: const Icon(Icons.arrow_back), color: Colors.black),
        elevation: 0,
        title: AutoSizeText('Sr. PEPE EL GRILLO',
            style: GoogleFonts.poppins(color: Colors.black)),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: AutoSizeText('Editoriales',
                  style:
                      GoogleFonts.poppins(color: Colors.black, fontSize: 20)),
            ),
          ),
          const SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
                onPressed: () {
                  showDialog(context: context, builder: (context) => const AddEditorial());
                }, child: const Text('Nueva editorial')),
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
          child: editorialesGet.when(
            skipLoadingOnRefresh: false,
            data: (_) => Column(children: [
              const SizedBox(height: 10),
              CupertinoSearchTextField(
                onChanged: (value) {
                  ref
                      .read(inputEditorialABMProvider.notifier)
                      .update((_) => value);
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
                                    builder: (_) => EditarEditorial(e.id),
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
                  ref.invalidate(editorialesABMProvider);
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