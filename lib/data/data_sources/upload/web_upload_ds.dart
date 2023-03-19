// ignore: depend_on_referenced_packages
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class WebUploadDataSource {
  Future<String?> createContent({
    required Uint8List bytes,
    required String fileName,
  }) async {
    //final token = LocalAuthDataSourceImpl.currentState.value;
    //final ct = lookupMimeType('', headerBytes: bytes);
    var request = http.MultipartRequest(
      "POST",
      Uri.parse("https://document.capi.shitposting.team/v1/documents"),
    );
    // request.fields['type'] = type;
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Accept': 'text/plain',
      //'Authorization': 'Bearer $token',
    });
    final uploadingFile = http.MultipartFile.fromBytes(
      'file',
      bytes,
      filename: fileName,
      //contentType: ct != null ? MediaType.parse(ct) : null,
    );
    request.files.addAll([uploadingFile]);
    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> files = data['files'] as List;
      final String url = files.first;
      return url;
    } catch (e) {
      return null;
    }
  }
}
