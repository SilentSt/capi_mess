import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:template/domain/di/core/app_dependency_widget.dart';
import 'package:template/domain/di/preload.dart';

import 'gen/codegen_loader.g.dart';
import 'presentation/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
      fallbackLocale: const Locale('en'),
      saveLocale: true,
      path: 'assets/translations',
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader(),
      child: AppDependencyWidget<PreloadDependency>(
        create: PreloadDependency.new,
        dispose: (_, dep) => dep.dispose(),
        loadingBuilder: (context) => const SizedBox(),
        child: const App(),
      ),
    ),
  );
}
