import 'dart:js_interop';

import 'package:bibliotech_admin/config/validations/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

import '../controllers/createPublicacion.controller.dart';
import '../controllers/getAllAutor.controller.dart';
import '../controllers/getAllCategoria.controller.dart';
import '../controllers/getAllEdicion.controller.dart';
import '../controllers/getAllEditorial.controller.dart';
import '../controllers/getAllPlataforma.controller.dart';
import '../controllers/getAllTipoPublicacion.controller.dart';
import '../dto/link.dto.dart';
import '../dto/publicacion.dto.dart';
import '../repository/publicacionDto.repository.dart';
import '../validations/publicacion.validation.dart';
import '../validations/index.dart';
import '../../../../../config/router/admin_router.dart';
import '../../../../../widgets/mostrar_usuario.dart';
import '../../../../../widgets/error_mensaje.dart';
import '../../../../../widgets/crear_entidad.dart';
import '../../../../../models/index.dart';


//CREACIÓN DEL COMPONENTE QUE REPRESENTA EL FORMULARIO DE CREACIÓN
//DE LA PUBLICACIÓN
class CreatePublicacionPage extends ConsumerStatefulWidget {

  const CreatePublicacionPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreatePublicacionPageState();
}

class _CreatePublicacionPageState extends ConsumerState<CreatePublicacionPage> {
  
  var urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    urlController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    var publicacion = ref.watch(publicacionDtoProvider);
    var plataformasProvider = ref.watch(getAllPlataformasProvider);
    var edicionesProvider = ref.watch(getAllEdicionProvider);
    var tiposProvider = ref.watch(getAllTipoPublicacionProvider);
    var editorialesProvider = ref.watch(getAllEditorialProvider);
    var autoresProvider = ref.watch(getAllAutoresProvider);
    var categoriasProvider = ref.watch(getAllCategoriasProvider);

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
                backgroundColor: (!publicacionValidacion(publicacion))
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
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        child: Margin(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                //? PRIMERA PARTE TITULO-ISBN-NROPAGINAS
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          initialValue: publicacion.tituloPublicacion,
                          onChanged: (value) {
                            publicacion.tituloPublicacion = value;
                            setState(() {});
                          },
                          validator: (value) {
                            if (value != null &&
                                tituloPublicacionValidacion(value)) {
                              return null;
                            }
                            return "El titulo no debe tener una longitud menor a 3 cararteres.";
                          },
                          decoration: InputDecoration(
                              isDense: true,
                              labelText: 'TÍTULO',
                              labelStyle: TextStyle(
                                  fontFamily: GoogleFonts.poppins.toString(),
                                  fontSize: 14),
                              border: const OutlineInputBorder()),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          initialValue: publicacion.isbnPublicacion,
                          onChanged: (value) {
                            publicacion.isbnPublicacion = value;
                            setState(() {});
                          },
                          validator: (value) {
                            if (value != null &&
                                isbnPublicacionValidacion(value)) {
                              return null;
                            }
                            return "El isbn no debe tener una longitud menor a 5 caracteres.";
                          },
                          decoration: InputDecoration(
                              isDense: true,
                              labelText: 'ISBN/ISSN',
                              labelStyle: TextStyle(
                                  fontFamily: GoogleFonts.poppins.toString(),
                                  fontSize: 14),
                              border: const OutlineInputBorder()),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          initialValue: publicacion.nroPaginas.toString(),
                          onChanged: (value) {
                            publicacion.nroPaginas = int.parse(value);
                            setState(() {});
                          },
                          validator: (value) {
                            if (value != null &&
                                int.tryParse(value) != null &&
                                pagesPublicacionValidacion(int.parse(value))) {
                              return null;
                            }
                            return "El número de páginas debe ser mayor a uno";
                          },
                          decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Número de paginas',
                              errorMaxLines: 4,
                              labelStyle: TextStyle(
                                  fontFamily: GoogleFonts.poppins.toString(),
                                  fontSize: 14),
                              border: const OutlineInputBorder()),
                        ),
                      ),
                    ],
                  ),
                ),

                //? SEGUNDA PARTE LINK
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: plataformasProvider.when(
                      skipLoadingOnRefresh: false,
                      data: (plataformas) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      publicacion.link = LinkDto(
                                          estado: null,
                                          plataformaId: null,
                                          url: null);
                                      urlController.text = '';
                                      setState(() {});
                                    },
                                    child: Text('Eliminar link',
                                        style: GoogleFonts.poppins()),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: DropdownButtonFormField<int>(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        isDense: true,
                                        isExpanded: true,
                                        hint: const Text('PLATAFORMA'),
                                        value: publicacion.link.plataformaId,
                                        style: TextStyle(
                                            fontFamily:
                                                GoogleFonts.poppins.toString(),
                                            fontSize: 14),
                                        items: plataformas
                                            .map(
                                              (e) => DropdownMenuItem(
                                                value: e.id,
                                                child: Text(e.nombre),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (value) {
                                          if (value != null) {
                                            publicacion.link.plataformaId =
                                                plataformas
                                                    .firstWhere((plataforma) =>
                                                        plataforma.id == value)
                                                    .id;
                                            setState(() {});
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: TextFormField(
                                      controller: urlController,
                                      onChanged: (value) {
                                        publicacion.link.url = value;
                                        setState(() {});
                                      },
                                      validator: (value) {
                                        if (value != null && isUrl(value)) {
                                          return null;
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText: 'LINK',
                                        labelStyle: TextStyle(
                                            fontFamily:
                                                GoogleFonts.poppins.toString(),
                                            fontSize: 14),
                                        border: const OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: DropdownButtonFormField<String>(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        isDense: true,
                                        isExpanded: true,
                                        hint: const Text('ESTADO'),
                                        value: publicacion.link.estado,
                                        style: TextStyle(
                                            fontFamily:
                                                GoogleFonts.poppins.toString(),
                                            fontSize: 14),
                                        items: const [
                                          DropdownMenuItem(
                                              value: 'ACTIVO',
                                              child: Text('ACTIVO')),
                                          DropdownMenuItem(
                                              value: 'INACTIVO',
                                              child: Text('INACTIVO')),
                                        ],
                                        onChanged: (value) {
                                          if (value != null) {
                                            publicacion.link.estado = value;
                                            setState(() {});
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: !linkPublicacionValidacion(
                                    publicacion.link),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    "Los campos plataforma, url y estado deben estar completos.",
                                    style:
                                        GoogleFonts.poppins(color: Colors.red),
                                  ),
                                ),
                              ),
                            ],
                          ),
                      error: (response, _) => ErrorResultadoWidget(
                            response: response,
                            provider: getAllPlataformasProvider,
                            message: 'Reintentar cargar plataformas',
                          ),
                      loading: () => const LinearProgressIndicator()),
                ),

                //? TERCERA PARTE EDICION - AÑO - TIPO
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: edicionesProvider.when(
                            skipLoadingOnRefresh: false,
                            data: (ediciones) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: DropdownButtonFormField<int>(
                                  validator: (value) {
                                    if (value != null) {
                                      return null;
                                    }
                                    return "Debe seleccionar una edición.";
                                  },
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  isDense: true,
                                  isExpanded: true,
                                  hint: const Text('EDICIÓN'),
                                  value: publicacion.edicion?.id,
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins.toString(),
                                      fontSize: 14),
                                  items: [
                                    ...ediciones.map(
                                      (e) => DropdownMenuItem(
                                        value: e.id,
                                        child: Text(
                                          e.nombre,
                                          style: GoogleFonts.poppins(),
                                        ),
                                      ),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    if (value != null) {
                                      publicacion.edicion =
                                          ediciones.firstWhere(
                                              (edicion) => edicion.id == value);
                                      setState(() {});
                                    }
                                  },
                                ),
                              );
                            },
                            error: (response, _) => ErrorResultadoWidget(
                                  response: response,
                                  provider: getAllEdicionProvider,
                                  message: 'Reintentar cargar ediciones',
                                ),
                            loading: () => const LinearProgressIndicator()),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          initialValue: publicacion.anioPublicacion.toString(),
                          onChanged: (value) {
                            publicacion.anioPublicacion = int.parse(value);
                            setState(() {});
                          },
                          validator: (value) {
                            if (value != null && !int.tryParse(value).isNull &&
                                anioPublicacionValidacion(int.parse(value))) {
                              return null;
                            }
                            return "Debe ingresar un año válido.";
                          },
                          decoration: InputDecoration(
                              isDense: true,
                              labelText: 'AÑO',
                              labelStyle: TextStyle(
                                  fontFamily: GoogleFonts.poppins.toString(),
                                  fontSize: 14),
                              border: const OutlineInputBorder()),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: tiposProvider.when(
                            skipLoadingOnRefresh: false,
                            data: (tipos) => DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: DropdownButtonFormField<int>(
                                    validator: (value) {
                                      if (value != null) {
                                        return null;
                                      }
                                      return "Debe seleccionar un tipo de publicación.";
                                    },
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    isDense: true,
                                    isExpanded: true,
                                    hint: const Text('TIPO DE PUBLICACION'),
                                    value: publicacion.tipo?.id,
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins.toString(),
                                        fontSize: 14),
                                    items: [
                                      ...tipos.map(
                                        (t) => DropdownMenuItem(
                                          value: t.id,
                                          child: Text(
                                            t.nombre,
                                            style: GoogleFonts.poppins(),
                                          ),
                                        ),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      if (value != null) {
                                        publicacion.tipo = tipos.firstWhere(
                                            (tipo) => tipo.id == value);
                                        setState(() {});
                                      }
                                    },
                                  ),
                                ),
                            error: (response, _) => ErrorResultadoWidget(
                                  response: response,
                                  provider: getAllTipoPublicacionProvider,
                                  message:
                                      'Reintentar cargar tipos de publicacion',
                                ),
                            loading: () => const LinearProgressIndicator()),
                      ),
                    ],
                  ),
                ),

                //? CUARTA PARTE CATEGORIA
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child:
                              Text('CATEGORIAS', style: GoogleFonts.poppins()),
                        ),
                        Visibility(
                          visible: publicacion.categorias.isEmpty,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                                'Debe seleccionar al menos 1  categoría.',
                                style: GoogleFonts.poppins(
                                    color: Colors.redAccent)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.maxFinite,
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 11),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: ListView.separated(
                                itemBuilder: (_, i) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      publicacion
                                          .categorias[i].categoria.nombre,
                                      style: GoogleFonts.poppins(),
                                    ),
                                    const SizedBox(height: 5),
                                    Wrap(
                                      spacing: 5,
                                      runSpacing: 5,
                                      children: List.generate(
                                        publicacion
                                            .categorias[i].valores.length,
                                        (index) => FilterChip(
                                          avatar: const Icon(Icons.delete),
                                          label: Text(publicacion.categorias[i]
                                              .valores[index].nombre),
                                          onSelected: (_) {
                                            publicacion.categorias[i].valores
                                                .removeAt(index);
                                            if (publicacion.categorias[i]
                                                .valores.isEmpty) {
                                              publicacion.categorias
                                                  .removeAt(i);
                                            }
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                separatorBuilder: (_, __) => const Divider(),
                                itemCount: publicacion.categorias.length,
                              ),
                            ),
                          ),
                        ),
                        const VerticalDivider(),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            height: 200,
                            child: categoriasProvider.when(
                              data: (listaCategoria) {
                                List<ListTile> items = [];

                                for (var c in listaCategoria) {
                                  items.add(ListTile(
                                      title: Text(c.nombre,
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold))));
                                  for (var v in c.valores) {
                                    items.add(ListTile(
                                      title: Text(v.nombre,
                                          style: GoogleFonts.poppins()),
                                      trailing: const Icon(Icons.add),
                                      onTap: () {
                                        var categoriaOK = publicacion.categorias
                                            .where((ca) =>
                                                ca.categoria.id == c.id);
                                        if (categoriaOK.isEmpty) {
                                          publicacion.categorias = [
                                            ...publicacion.categorias,
                                            CategoriaPublicacion(
                                                categoria: c, valores: [v])
                                          ];
                                        } else {
                                          var valorOk = categoriaOK
                                              .first.valores
                                              .where((va) => va.id == v.id);
                                          if (valorOk.isEmpty) {
                                            categoriaOK.first.valores.add(v);
                                          }
                                        }
                                        setState(() {});
                                      },
                                    ));
                                  }
                                }

                                return SizedBox(
                                  height: 200,
                                  width: 500,
                                  child: ListView.builder(
                                      itemBuilder: (context, index) =>
                                          items[index],
                                      itemCount: items.length),
                                );
                              },
                              error: (response, _) => ErrorResultadoWidget(
                                response: response,
                                provider: getAllCategoriasProvider,
                                message: 'Reintentar cargar categorias',
                              ),
                              loading: () => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                //? QUINTA PARTE EDITORIALES
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child:
                              Text('EDITORIALES', style: GoogleFonts.poppins()),
                        ),
                        Visibility(
                          visible: publicacion.editoriales.isEmpty,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                                'Debe seleccionar al menos 1  editorial.',
                                style: GoogleFonts.poppins(
                                    color: Colors.redAccent)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 11),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                    spacing: 5,
                                    runSpacing: 5,
                                    children: List.generate(
                                      publicacion.editoriales.length,
                                      (index) => FilterChip(
                                        avatar: const Icon(Icons.delete),
                                        label: Text(publicacion
                                            .editoriales[index].nombre),
                                        onSelected: (_) {
                                          publicacion.editoriales
                                              .removeAt(index);
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const VerticalDivider(),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            height: 100,
                            child: editorialesProvider.when(
                              data: (listaEditoriales) {
                                List<ListTile> items = [];
                                for (var e in listaEditoriales) {
                                  items.add(
                                    ListTile(
                                      title: Text(e.nombre,
                                          style: GoogleFonts.poppins()),
                                      trailing: const Icon(Icons.add),
                                      onTap: () {
                                        var editorialOK = publicacion
                                            .editoriales
                                            .where((editorial) =>
                                                e.id == editorial.id);
                                        if (editorialOK.isEmpty) {
                                          publicacion.editoriales.add(e);
                                          setState(() {});
                                        }
                                      },
                                    ),
                                  );
                                }
                                return SizedBox(
                                  height: 100,
                                  child: ListView.builder(
                                      itemBuilder: (context, index) =>
                                          items[index],
                                      itemCount: items.length),
                                );
                              },
                              error: (response, _) => ErrorResultadoWidget(
                                response: response,
                                provider: getAllEditorialProvider,
                                message: 'Reintentar cargar editoriales',
                              ),
                              loading: () => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                //? SEXTA PARTE AUTORES
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text('AUTORES', style: GoogleFonts.poppins()),
                        ),
                        Visibility(
                          visible: publicacion.autores.isEmpty,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text('Debe seleccionar al menos 1  autor.',
                                style: GoogleFonts.poppins(
                                    color: Colors.redAccent)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.maxFinite,
                            height: 100,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 11),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                    spacing: 5,
                                    runSpacing: 5,
                                    children: List.generate(
                                      publicacion.autores.length,
                                      (index) => FilterChip(
                                        avatar: const Icon(Icons.delete),
                                        label: Text(
                                            publicacion.autores[index].nombre),
                                        onSelected: (_) {
                                          publicacion.autores.removeAt(index);
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const VerticalDivider(),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: autoresProvider.when(
                              data: (listaAutores) {
                                List<ListTile> items = [];
                                for (var a in listaAutores) {
                                  items.add(
                                    ListTile(
                                      title: Text(a.nombre,
                                          style: GoogleFonts.poppins()),
                                      trailing: const Icon(Icons.add),
                                      onTap: () {
                                        var autorOk = publicacion.autores
                                            .where((autor) => a.id == autor.id);
                                        if (autorOk.isEmpty) {
                                          publicacion.autores.add(a);
                                          setState(() {});
                                        }
                                      },
                                    ),
                                  );
                                }
                                return SizedBox(
                                  height: 100,
                                  child: ListView.builder(
                                      itemBuilder: (context, index) =>
                                          items[index],
                                      itemCount: items.length),
                                );
                              },
                              error: (response, _) => ErrorResultadoWidget(
                                response: response,
                                provider: getAllAutoresProvider,
                                message: 'Reintentar cargar autores',
                              ),
                              loading: () => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
