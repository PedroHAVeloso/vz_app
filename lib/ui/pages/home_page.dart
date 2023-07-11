import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vz_app/interactor/cubits/phrases/phrases_cubit.dart';
import 'package:vz_app/ui/widgets/appbar_widget.dart';
import 'package:vz_app/ui/widgets/bottom_appbar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarWidget(
        scaffoldKey: scaffoldKey,
      ),
      body: BlocBuilder<PhrasesCubit, PhrasesState>(
        builder: (context, state) {
          if (state is PhrasesInitial) {
            return Container();
          }
          if (state is PhrasesLoading) {
            return CircularProgressIndicator();
          }
          if (state is PhrasesLoaded) {
            return Column(
              children: [
                Text(state.phrases.toString()),
              ],
            );
          }
          return Container();
        },
      ),
      bottomNavigationBar: const BottomAppBarWidget(),
      endDrawer: const Drawer(),
    );
  }
}
