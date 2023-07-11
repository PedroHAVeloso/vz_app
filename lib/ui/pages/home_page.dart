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
    final cubit = context.read<PhrasesCubit>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarWidget(
        scaffoldKey: scaffoldKey,
      ),
      body: BlocBuilder<PhrasesCubit, PhrasesState>(
        builder: (context, state) {
          if (state is PhrasesInitial) {
            return Container(
              height: 100,
              width: 100,
              color: Colors.red,
              child: ElevatedButton(
                onPressed: cubit.getPhrases,
                child: const Text("Mudar"),
              ),
            );
          }
          if (state is PhrasesLoading) {
            return CircularProgressIndicator();
          }
          if (state is PhrasesLoaded) {
            return Column(
              children: [
                Text(state.phrases.toString()),
                ElevatedButton(
                  onPressed: cubit.getPhrases,
                  child: const Text("Mudar"),
                ),
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
