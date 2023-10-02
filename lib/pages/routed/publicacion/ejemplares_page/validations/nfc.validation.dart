
import 'dart:js_interop';

import 'package:bibliotech_admin/config/validations/index.dart';

bool nfcEjemplarValidacion(String? nfc){
  if(nfc.isNull) return false;
  if(campoVacio(nfc!)) return false;
  if(!expSerialNFC(nfc)) return false;
  return true;
}