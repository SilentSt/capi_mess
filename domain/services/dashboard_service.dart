import 'package:template/data/data_sources/dashboard/remote_dashboard_ds.dart';
import 'package:template/data/models/models.dart';
import 'package:template/domain/services/core/app_service.dart';

class DashboardService extends AppService {
  DashboardService(super.dialogService, this._rds);
  final RemoteDashboardDataSource _rds;

  Future<List<DashContentResult>> fetchNews() async {
    final res = await _rds.fetchNews();
    if (!res.isSuccessful) {
      dialogService.showBackendError(error: (Mapper.fromValue<CoreModel>(res.error)).error);
    }
    return res.body?.result ?? [];
  }

  Future<DashContentResult?> getNewsById(String id) async {
    final res = await _rds.getNewsById(id);
    if (!res.isSuccessful) {
      dialogService.showBackendError(error: (Mapper.fromValue<CoreModel>(res.error)).error);
    }
    return res.body?.result;
  }

  Future<List<DashContentResult>> fetchProducts() async {
    final res = await _rds.fetchProducts();
    if (!res.isSuccessful) {
      dialogService.showBackendError(error: (Mapper.fromValue<CoreModel>(res.error)).error);
    }
    return res.body?.result ?? [];
  }

  Future<DashContentResult?> getProductById(String id) async {
    final res = await _rds.getProductById(id);
    if (!res.isSuccessful) {
      dialogService.showBackendError(error: (Mapper.fromValue<CoreModel>(res.error)).error);
    }
    return res.body?.result;
  }
}
