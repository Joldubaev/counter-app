// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_example/cubit/counter_cubit.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   group('CounterCubit', () {
//     CounterCubit? counterCubit;
//     setUp(() {
//       counterCubit = CounterCubit();
//     });
//     tearDown(() {
//       counterCubit!.close();
//     });
//     test(
//         'the initial state for the CounterCubit is CounterState(counterValue: 0)',
//         () {
//       expect(
//           counterCubit!.state,
//           CounterState(
//             counterValue: 0,
//           ));
//     });
//     blocTest(
//       'the cubit should emit a CounterState(counterValue:1, wasIncrement:true) when cubit.increment() functions is called',
//       build: () => CounterCubit(),
//       act: (cubit) => cubit.increment(),
//       expect: () => [CounterState(counterValue: 1, wasIncremended: true)],
//     );

//     blocTest(
//       'the cubit should emit a CounterState(counterValue: -1, wasDecrement:true) when cubit.decrement() functions is called',
//       build: () => CounterCubit(),
//       act: (cubit) => cubit.decrement(),
//       expect: () => [CounterState(counterValue: -1, wasIncremended: false)],
//     );
//   });
// }
