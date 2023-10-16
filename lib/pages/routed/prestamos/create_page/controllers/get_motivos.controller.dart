

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/motivo_multa.dto.dart';

final getMotivosMultaProvider = FutureProvider.autoDispose<List<MotivoMultaDto>>((ref) async {
  
  await Future.delayed(const Duration(seconds: 2));

  List<MotivoMultaDto> response = [];

  response = List.generate(
        30,
        (index) => MotivoMultaDto(
              id: index,
              nombre: "nombre $index",
              dias: index*2,
            ));

  return response;

});