
// import 'dart:convert';

import 'dart:convert';
import 'dart:io';

import 'package:bibliotech_admin/config/auth/token_admin.dart';
import 'package:http/http.dart';

import 'http_method.dart';

dynamic _parseBody(dynamic body) {
  try {
    return jsonEncode(body);
  } catch (_) {
    return body;
  }
}

Future<Response> sendRequest({
  required Uri url,
  required HttpMethod method,
  required Map<String, String> headers,
  required dynamic body,
  required Duration timeOut,
}) async {

  Map<String, String> finalHeaders; 
  if (method != HttpMethod.signing) {
    finalHeaders = {...headers, HttpHeaders.authorizationHeader: 'Bearer ${await storage.read(key: 'token')}',};
    // finalHeaders = {...headers, HttpHeaders.authorizationHeader: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbWFpbEBzdXBlcmFkbWluLmNvbSIsImlhdCI6MTY5Njg4OTIyMSwiZXhwIjo1NDE2OTY4ODkyMjF9.qKluk_xI8YbpD4ByFE9mzRt-CceC1ov3BRR8czXuHv8',};
  } else {
    finalHeaders = { ...headers };
  }

  if (method != HttpMethod.get) {
    final contentType = headers['Content-Type'];
    if (contentType == null || contentType.contains("application/json")) {
      finalHeaders["content-type"] = "application/json";
      // finalHeaders["Content-Type"] = "application/json; charset = UTF-8";
      if(method == HttpMethod.post || method == HttpMethod.signing) body = _parseBody(body);
    }
  }

  final client = Client();

  switch (method) {
    case HttpMethod.signing:
      return client.post(url, headers: finalHeaders, body: body).timeout(timeOut);
    case HttpMethod.get:
      return client.get(url, headers: finalHeaders).timeout(timeOut);
    case HttpMethod.post:
      return client.post(url, headers: finalHeaders, body: body).timeout(timeOut);
    case HttpMethod.put:
      return client.put(url, headers: finalHeaders, body: body).timeout(timeOut);
    case HttpMethod.patch:
      return client.patch(url, headers: finalHeaders, body: body).timeout(timeOut);
    case HttpMethod.delete:
      return client.delete(url, headers: finalHeaders, body: body).timeout(timeOut);
  }
}
