import 'package:stacked/stacked.dart';
import 'package:template/data/models/dashboard/dashboard.dart';
import 'package:template/domain/services/dashboard_service.dart';

class DashboardDetailsViewModel extends BaseViewModel {
  DashboardDetailsViewModel(this.dashboardService, this.id, this.type);

  final DashboardService dashboardService;
  final String id;
  final int type;

  DashContentResult? model;

  Future<void> onReady() async {
    if (type == 1) {
      model = await dashboardService.getProductById(id);
    } else {
      model = await dashboardService.getNewsById(id);
    }
    notifyListeners();
  }
}
