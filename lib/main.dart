import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mix/mix.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_tokens.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MixScope(
      colors: AppTheme.colors,
      spaces: AppTheme.spaces,
      radii: AppTheme.radii,
      textStyles: AppTheme.textStyles,
      child: MaterialApp.router(
        title: 'AppHocVi',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFFF1F5F9),
        ),
        routerConfig: appRouter,
      ),
    );
  }
}
