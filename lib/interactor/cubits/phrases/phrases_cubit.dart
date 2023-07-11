import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vz_app/data/repositories/phrases_repository.dart';

part 'phrases_state.dart';

class PhrasesCubit extends Cubit<PhrasesState> {
  PhrasesCubit() : super(PhrasesInitial());

  PhrasesRepository repository = PhrasesRepository();

  List _phrases = [];

  void getPhrases() async {
    emit(PhrasesLoading());
    _phrases = await repository.getPhrasesList();

    // ! TODO: REMOVER
    await Future.delayed(const Duration(seconds: 2));

    emit(PhrasesLoaded(phrases: _phrases));
  }
}
