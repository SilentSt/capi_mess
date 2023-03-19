import 'package:stacked/stacked.dart';
import 'package:template/presentation/app/app.dart';

class RootViewModel extends BaseViewModel {
  Future<void> onReady() async {
    App.router.addListener(() {
      notifyListeners();
    });
  }
}
