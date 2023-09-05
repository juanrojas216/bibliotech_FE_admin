import 'package:auto_size_text/auto_size_text.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/detalle_page/categorias_controller.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/detalle_page/detalle_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'categorias_dialog.dart';

class CategoriasPublicacion extends ConsumerWidget {
  const CategoriasPublicacion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    var detallePublicacionCategorias = ref.watch(detallePublicacionProvider).categorias;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text('CATEGORIAS', style: GoogleFonts.poppins()),
            ),
            ElevatedButton(
                onPressed: () {
                  ref.invalidate(inputCategoriaProvider);
                  showCupertinoDialog(
                    context: context,
                    builder: (_) => const AlertCategoria(),
                  );
                },
                child: Text('MODIFICAR', style: GoogleFonts.poppins()),
              )
          ],
        ),
        Container(
          width: double.maxFinite,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.separated(
                itemBuilder: (_, i) => CategoriaItem(index: i),
                separatorBuilder: (_, __) => const Divider(),
                itemCount: detallePublicacionCategorias!.length,
              ),
          ),
        ),
      ],
    );
  }
}


class CategoriaItem extends ConsumerStatefulWidget {
  
  final int index;

  const CategoriaItem({
    super.key,
    required this.index,
  });

  @override
  FiltroItemCategoriaState createState() => FiltroItemCategoriaState();
}

class FiltroItemCategoriaState extends ConsumerState<CategoriaItem> {
  
  @override
  Widget build(BuildContext context) {
    
    var detallePublicacionCategorias = ref.watch(detallePublicacionProvider).categorias![widget.index];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          detallePublicacionCategorias.nombreCategoria,
          style: GoogleFonts.poppins(),
        ),
        const SizedBox(height: 5),
        Wrap(
          spacing: 5,
          runSpacing: 5,
          children: List.generate(
            detallePublicacionCategorias.valores.length,
            (index) => FilterChip(
              avatar: const Icon(Icons.delete),
              label: Text(detallePublicacionCategorias.valores[index].nombreValor),
              onSelected: (_) {
                ref.read(detallePublicacionProvider.notifier).deleteValor(widget.index, index);
                setState(() {});
              },
            ),
          ),
        ),
      ],
    );
  }
}