// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_dashboard_ds.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$RemoteDashboardDataSource extends RemoteDashboardDataSource {
  _$RemoteDashboardDataSource([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RemoteDashboardDataSource;

  @override
  Future<Response<DashsContentModel>> fetchNews() {
    final Uri $url = Uri.parse('News/all');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<DashsContentModel, DashsContentModel>($request);
  }

  @override
  Future<Response<DashContentModel>> getNewsById(String id) {
    final Uri $url = Uri.parse('News/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<DashContentModel, DashContentModel>($request);
  }

  @override
  Future<Response<DashsContentModel>> fetchProducts() {
    final Uri $url = Uri.parse('Products/all');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<DashsContentModel, DashsContentModel>($request);
  }

  @override
  Future<Response<DashContentModel>> getProductById(String id) {
    final Uri $url = Uri.parse('Products/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<DashContentModel, DashContentModel>($request);
  }
}
