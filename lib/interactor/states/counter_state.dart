part of '../cubits/counter_cubit.dart';

abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterLoading extends CounterState {}

class CounterLoaded extends CounterState {
  CounterLoaded({required this.number});

  int number;
}
