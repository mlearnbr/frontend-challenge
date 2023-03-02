import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:starwars_db/core/themes/app_theme.dart';
import 'package:starwars_db/features/character/presentation/blocs/character_bloc.dart';
import 'package:starwars_db/features/character/presentation/screens/character_list_screen.dart';
import 'package:starwars_db/injection_container.dart' as ic;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ic.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return BlocProvider(
      create: (_) => ic.getIt<CharacterBloc>(),
      child: _buildMaterialApp(),
    );
  }

  Widget _buildMaterialApp() {
    return MaterialApp(
      title: 'Star Wars DB',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: appThemeData[AppTheme.dark],
      home: const CharacterListScreen(),
    );
  }
}
