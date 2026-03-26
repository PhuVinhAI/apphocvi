import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_tokens.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'AppHocVi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppTokens.primary),
        useMaterial3: true,
        scaffoldBackgroundColor: AppTokens.background,
        textTheme: GoogleFonts.outfitTextTheme(),
      ),
      routerConfig: appRouter,
    );
  }
}
