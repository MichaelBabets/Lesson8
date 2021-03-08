import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson8/counter_bloc/counter_bloc.dart';
// import 'package:lesson8/counter_cubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc _counterBloc = CounterBloc();
  // CounterCubit _counterCubit = CounterCubit();


  void _incrementCounter() {
    _counterBloc.add(IncrementEvent(value: Random().nextInt(10)));
    // _counterCubit.incrementCounter(value: Random().nextInt(10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder(
              cubit: _counterBloc,
              builder: (context, state){
                if(state is CounterLoading){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(state is CounterChanged){
                  return Text(
                    '${state.changedValue}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
                if(state is CounterInitial){
                  return Text(
                    '${state.initialValue}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
