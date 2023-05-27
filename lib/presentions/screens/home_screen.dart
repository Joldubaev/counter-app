import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example/constants/enums.dart';
import 'package:flutter_example/cubit/counter_cubit.dart';
import 'package:flutter_example/cubit/internet_cubit.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key, required this.title, required this.color});
  final String title;
  final Color color;

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.Wifi) {
          context.read<CounterCubit>().increment();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.Mobile) {
          context.read<CounterCubit>().decrement();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (state is InternetConnected &&
                      state.connectionType == ConnectionType.Wifi) {
                    return Text(
                      'Wi-Fi',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.green,
                          ),
                    );
                  } else if (state is InternetConnected &&
                      state.connectionType == ConnectionType.Mobile) {
                    return Text(
                      'Mobile',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.red,
                          ),
                    );
                  } else if (state is InternetDisconnected) {
                    return Text(
                      'Disconnected',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.grey,
                          ),
                    );
                  }

                  return const CircularProgressIndicator();
                },
              ),
              const Divider(height: 5),
              // const Text(
              //   'You have pushed the button this many times:',
              // ),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.wasIncremended == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Inecrement')));
                  } else if (state.wasIncremended == false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Decrement')));
                  }
                },
                builder: (context, state) {
                  if (state.counterValue < 0) {
                    return Text(
                      'Bro Negative number ${state.counterValue}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  } else if (state.counterValue % 2 == 0) {
                    return Text(
                      'Bro whats up your maths ${state.counterValue}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  } else {
                    return Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }
                },
              ),
              // const SizedBox(height: 24),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     FloatingActionButton(
              //       heroTag: Text('${widget.title}'),

              //       onPressed: () {
              //         BlocProvider.of<CounterCubit>(context).decrement();

              //       },
              //       tooltip: 'Increment',
              //       child: const Icon(Icons.remove),
              //     ),
              //     FloatingActionButton(
              //       heroTag: Text('${widget.title} #2'),

              //       onPressed: () {
              //         BlocProvider.of<CounterCubit>(context).increment();
              //       },
              //       tooltip: 'Increment',
              //       child: const Icon(Icons.add),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 24),
              MaterialButton(
                color: Theme.of(context).colorScheme.inversePrimary,
                onPressed: () {
                  Navigator.of(context).pushNamed('/second');
                },
                child: const Text('Go to second page'),
              ),
              const SizedBox(height: 24),
              MaterialButton(
                color: Theme.of(context).colorScheme.inversePrimary,
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                },
                child: const Text('Go to third page'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
