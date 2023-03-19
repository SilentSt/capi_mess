// ignore: depend_on_referenced_packages
import 'dart:convert';

import 'package:http/http.dart' as http;

class MobileUploadDataSource {
  Future<String?> createContent({
    required String path,
    required String fileName,
  }) async {
    //final token = LocalAuthDataSourceImpl.currentState.value;
    //final ct = lookupMimeType('path');
    var request = http.MultipartRequest(
      "POST",
      Uri.parse("https://core.capi.shitposting.team/v1/documents"),
    );
    // request.fields['type'] = type;
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Accept': 'text/plain',
      //'Authorization': 'Bearer $token',
    });
    final uploadedFile = await http.MultipartFile.fromPath(
      'file',
      path,
      filename: path,
      //contentType: ct != null ? MediaType.parse(ct) : null,
    );
    request.files.add(uploadedFile);
    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      Map<String, dynamic> data = jsonDecode(response.body);
      final String url = (data['files'] as List<String>).first;
      return url;
    } catch (e) {
      return null;
    }
  }
}
