import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final _formKey = GlobalKey<FormBuilderState>();

class NuevaPublicacionScreen extends StatefulWidget {
  const NuevaPublicacionScreen({super.key});

  @override
  State<NuevaPublicacionScreen> createState() => _NuevaPublicacionScreenState();
}

class _NuevaPublicacionScreenState extends State<NuevaPublicacionScreen> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _ageHasError = false;
  bool _genderHasError = false;

  var genderOptions = ['Male', 'Female', 'Other'];

  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Crear publicación",
                  style: TextStyle(fontSize: 30),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                )
              ],
            ),
            FormBuilder(
              key: _formKey,
              // enabled: false,
              onChanged: () {
                _formKey.currentState!.save();
                debugPrint(_formKey.currentState!.value.toString());
              },
              autovalidateMode: AutovalidateMode.disabled,
              // initialValue: const {
              //   'movie_rating': 5,
              //   'best_language': 'Dart',
              //   'age': '13',
              //   'gender': 'Male',
              //   'languages_filter': ['Dart']
              // },
              skipDisabled: true,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 15),
                  tituloISBEdicion(), // TITULO ISBN EDICION
                  const SizedBox(
                    height: 20,
                  ),
                  editorialAnoTipo(), //EDITORIAL AÑO TIPO
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Autores",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  autores(),
                  const SizedBox(height: 25),
                  const Text(
                    "Categorías",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  categorias(),
                  const SizedBox(height: 25),
                  FormBuilderTextField(
                    name: 'link',
                    decoration: const InputDecoration(
                        labelText: 'LINK',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.saveAndValidate() ?? false) {
                        debugPrint(_formKey.currentState?.value.toString());
                      } else {
                        debugPrint(_formKey.currentState?.value.toString());
                        debugPrint('validation failed');
                      }
                    },
                    child: const Text(
                      'Crear',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      _formKey.currentState?.reset();
                    },
                    // color: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      'Borrar',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    )));
  }

  Container categorias() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border.fromBorderSide(
              BorderSide(color: Colors.grey, width: 2)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
                margin: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey)),
                width: 75.w,
                child: const Text("SIN CATEGORIAS")),
            FilledButton(
                onPressed: () {}, child: const Text("Añadir categoría")),
            const SizedBox(
              width: 15,
            )
          ],
        ));
  }

  Container autores() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border.fromBorderSide(
              BorderSide(color: Colors.grey, width: 2)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
                margin: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey)),
                width: 78.w,
                child: const Text("SIN AUTORES")),
            FilledButton(onPressed: () {}, child: const Text("Añadir autor")),
            const SizedBox(
              width: 15,
            )
          ],
        ));
  }

  Row tituloISBEdicion() {
    return Row(
      children: [
        SizedBox(
          width: 28.w,
          child: FormBuilderTextField(
            autovalidateMode: AutovalidateMode.always,
            name: 'titulo',
            decoration: InputDecoration(
              labelText: 'TÍTULO',
              suffixIcon: _ageHasError
                  ? const Icon(Icons.error, color: Colors.red)
                  : const Icon(Icons.check, color: Colors.green),
            ),
            onChanged: (val) {
              setState(() {
                _ageHasError =
                    !(_formKey.currentState?.fields['age']?.validate() ??
                        false);
              });
            },
            // valueTransformer: (text) => num.tryParse(text),
            // validator: FormBuilderValidators.compose([
            //   FormBuilderValidators.required(),
            //   FormBuilderValidators.numeric(),
            //   FormBuilderValidators.max(70),
            // ]),
            // initialValue: '12',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
          ),
        ),
        SizedBox(
          width: 9.h,
        ),
        SizedBox(
          height: 54,
          width: 28.w,
          child: FormBuilderTextField(
            autovalidateMode: AutovalidateMode.always,
            name: 'isbn',
            decoration: InputDecoration(
              labelText: 'ISBN/ISSN',
              suffixIcon: _ageHasError
                  ? const Icon(Icons.error, color: Colors.red)
                  : const Icon(Icons.check, color: Colors.green),
            ),
            onChanged: (val) {
              setState(() {
                _ageHasError =
                    !(_formKey.currentState?.fields['age']?.validate() ??
                        false);
              });
            },
            // valueTransformer: (text) => num.tryParse(text),
            // validator: FormBuilderValidators.compose([
            //   FormBuilderValidators.required(),
            //   FormBuilderValidators.numeric(),
            //   FormBuilderValidators.max(70),
            // ]),
            // initialValue: '12',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
          ),
        ),
        SizedBox(
          width: 10.h,
        ),
        SizedBox(
          height: 54,
          width: 28.w,
          child: FormBuilderDropdown<String>(
            name: 'edicion',
            decoration: InputDecoration(
              labelText: 'EDICION',
              suffix: _genderHasError
                  ? const Icon(Icons.error)
                  : const Icon(Icons.check),
              hintText: 'Seleccionar edición',
            ),
            // validator: FormBuilderValidators.compose(
            //     [FormBuilderValidators.required()]),
            items: genderOptions
                .map((gender) => DropdownMenuItem(
                      alignment: AlignmentDirectional.center,
                      value: gender,
                      child: Text(gender),
                    ))
                .toList(),
            onChanged: (val) {
              setState(() {
                _genderHasError =
                    !(_formKey.currentState?.fields['gender']?.validate() ??
                        false);
              });
            },
            valueTransformer: (val) => val?.toString(),
          ),
        ),
      ],
    );
  }

  Row editorialAnoTipo() {
    return Row(
      children: [
        SizedBox(
            width: 28.w,
            child: SizedBox(
              height: 54,
              width: 28.w,
              child: FormBuilderDropdown<String>(
                name: 'editorial',
                decoration: InputDecoration(
                  labelText: 'EDITORIAL',
                  suffix: _genderHasError
                      ? const Icon(Icons.error)
                      : const Icon(Icons.check),
                  hintText: 'Seleccionar editorial',
                ),
                // validator: FormBuilderValidators.compose(
                //     [FormBuilderValidators.required()]),
                items: genderOptions
                    .map((gender) => DropdownMenuItem(
                          alignment: AlignmentDirectional.center,
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _genderHasError =
                        !(_formKey.currentState?.fields['gender']?.validate() ??
                            false);
                  });
                },
                valueTransformer: (val) => val?.toString(),
              ),
            )),
        SizedBox(
          width: 9.h,
        ),
        SizedBox(
          height: 54,
          width: 28.w,
          child: FormBuilderTextField(
            autovalidateMode: AutovalidateMode.always,
            name: 'año',
            decoration: InputDecoration(
              labelText: 'AÑO',
              suffixIcon: _ageHasError
                  ? const Icon(Icons.error, color: Colors.red)
                  : const Icon(Icons.check, color: Colors.green),
            ),
            onChanged: (val) {
              setState(() {
                _ageHasError =
                    !(_formKey.currentState?.fields['age']?.validate() ??
                        false);
              });
            },
            // valueTransformer: (text) => num.tryParse(text),
            // validator: FormBuilderValidators.compose([
            //   FormBuilderValidators.required(),
            //   FormBuilderValidators.numeric(),
            //   FormBuilderValidators.max(70),
            // ]),
            // initialValue: '12',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
          ),
        ),
        SizedBox(
          width: 10.h,
        ),
        SizedBox(
          height: 54,
          width: 28.w,
          child: FormBuilderDropdown<String>(
            name: 'tipo',
            decoration: InputDecoration(
              labelText: 'TIPO',
              suffix: _genderHasError
                  ? const Icon(Icons.error)
                  : const Icon(Icons.check),
              hintText: 'Seleccionar edición',
            ),
            // validator: FormBuilderValidators.compose(
            //     [FormBuilderValidators.required()]),
            items: genderOptions
                .map((gender) => DropdownMenuItem(
                      alignment: AlignmentDirectional.center,
                      value: gender,
                      child: Text(gender),
                    ))
                .toList(),
            onChanged: (val) {
              setState(() {
                _genderHasError =
                    !(_formKey.currentState?.fields['gender']?.validate() ??
                        false);
              });
            },
            valueTransformer: (val) => val?.toString(),
          ),
        ),
      ],
    );
  }
}
