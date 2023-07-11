import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vz_app/interactor/cubits/counter/counter_cubit.dart';
import 'package:vz_app/interactor/cubits/phrases/phrases_cubit.dart';
import 'package:vz_app/ui/constants/app_theme.dart';
import 'package:vz_app/ui/pages/home_page.dart';

class VzApp extends StatelessWidget {
  const VzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<PhrasesCubit>(
            create: (context) => PhrasesCubit(),
          ),
          BlocProvider<CounterCubit>(
            create: (context) => CounterCubit(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
