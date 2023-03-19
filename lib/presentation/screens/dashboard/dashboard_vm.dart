import 'package:stacked/stacked.dart';
import 'package:template/data/models/models.dart';
import 'package:template/domain/services/dashboard_service.dart';

class DashboardViewModel extends BaseViewModel {
  DashboardViewModel(this.dashboardService);

  final DashboardService dashboardService;

  List<DashContentResult> news = [];
  List<DashContentResult> projects = [];

  Future<void> onReady() async {
    await fetchProjects();
    await fetchNews();
  }

  Future<void> fetchNews() async {
    news = await dashboardService.fetchNews();
    notifyListeners();
  }

  Future<void> fetchProjects() async {
    projects = await dashboardService.fetchProducts();
    notifyListeners();
  }
}
