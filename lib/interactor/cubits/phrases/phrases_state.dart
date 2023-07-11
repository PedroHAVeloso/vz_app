part of 'phrases_cubit.dart';

abstract class PhrasesState {}

class PhrasesInitial extends PhrasesState {}

class PhrasesLoading extends PhrasesState {}

class PhrasesLoaded extends PhrasesState {
  PhrasesLoaded({required this.phrases});

  List phrases;
}
