part of 'counter_cubit.dart';

// ignore: must_be_immutable
class CounterState  extends Equatable{
  int counterValue;
  bool? wasIncremended;
  
  CounterState({
    required this.counterValue,
    this.wasIncremended,
  });
  
  @override
  
  List<Object?> get props => [counterValue, wasIncremended];
}
