part of 'favorited_phrases_cubit.dart';

abstract class FavoritedPhrasesState {}

class FavoritedPhrasesInitial extends FavoritedPhrasesState {}

class FavoritedPhrasesLoading extends FavoritedPhrasesState {}

class FavoritedPhrasesLoaded extends FavoritedPhrasesState {
  FavoritedPhrasesLoaded({required this.phrases});

  Map phrases;
}
