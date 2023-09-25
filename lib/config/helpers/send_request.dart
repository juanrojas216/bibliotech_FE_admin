
// import 'dart:convert';

import 'dart:convert';
import 'dart:io';

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
}) {

  var finalHeaders = {...headers, HttpHeaders.authorizationHeader: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpZ25hY2lvbnZhbGVudGUwN0BnbWFpbC5jb20iLCJpYXQiOjE2OTU2NDkwMjAsImV4cCI6MTY5NTY1MDQ2MH0.eC-iAx4s9ZVMxGwAdBzjG_DpBlGASNcpZepMKH8iAh4',};

  if (method != HttpMethod.get) {
    final contentType = headers['Content-Type'];
    if (contentType == null || contentType.contains("application/json")) {
      finalHeaders["content-type"] = "application/json";
      // finalHeaders["Content-Type"] = "application/json; charset = UTF-8";
      if(method == HttpMethod.post) body = _parseBody(body);
    }
  }

  final client = Client();

  switch (method) {
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
