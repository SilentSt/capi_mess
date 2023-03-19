import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:template/data/models/auth/auth.dart';
import 'package:template/domain/services/auth_service.dart';
import 'package:template/domain/services/dialog_service.dart';

class AuthViewModel extends BaseViewModel {
  AuthViewModel({
    required this.authService,
    required this.dialogService,
  });

  final AuthService authService;
  final DialogService dialogService;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final PageController stateController = PageController();

  bool saveData = false;
  String? session;

  Future<void> onReady() async {
    phoneController.text = authService.savedUser?.phone ?? '';
    passwordController.text = authService.savedUser?.password ?? '';
  }

  Future<void> signIn() async {
    if (phoneController.text.trim().isEmpty || passwordController.text.trim().isEmpty) {
      dialogService.showError(text: 'Вы заполнили не все поля');
      return;
    }
    String phone = phoneController.text.trim();

    if (phone.startsWith('8')) {
      phone = phone.replaceFirst('8', '+7');
    }
    setBusy(true);
    session = await authService.signin(
      dto: SignInDto(
        phone: phone,
        password: passwordController.text.trim(),
      ),
    );
    setBusy(false);
  }

  Future<void> verify() async {
    if (session == null) return;
    if (codeController.text.trim().isEmpty) {
      dialogService.showError(text: 'Вы заполнили не все поля');
      return;
    }
    setBusy(true);
    await authService.verify(
      dto: VerifyDto(
        sessionId: session!.trim(),
        code: codeController.text.trim(),
      ),
    );
    setBusy(false);
  }

  Future<void> signUp() async {
    if (loginController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty ||
        firstNameController.text.trim().isEmpty ||
        lastNameController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      dialogService.showError(text: 'Вы заполнили не все поля');
      return;
    }
    String phone = phoneController.text.trim();

    if (phone.startsWith('8')) {
      phone = phone.replaceFirst('8', '7');
    }
    setBusy(true);
    final res = await authService.signup(
      SignUpDto(
        login: loginController.text.trim(),
        phone: phone,
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );
    if (res == true) {
      phoneController.clear();
      passwordController.clear();
      codeController.clear();
      loginController.clear();
      firstNameController.clear();
      lastNameController.clear();
      animateToAuth();
    }
    setBusy(false);
  }

  // 0641679f-ac4a-725b-8000-0929fa7061ee
  // 0641679f-ac4a-725b-8000-0929fa7061ee
  void animateToReg() {
    stateController.animateToPage(
      1,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  void animateToAuth() {
    stateController.animateToPage(
      0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  void swapDataSave(bool? value) {
    saveData = value ?? saveData;
    notifyListeners();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    stateController.dispose();
    super.dispose();
  }
}
