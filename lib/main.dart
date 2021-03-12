import 'package:flutter/material.dart';
import 'package:music_player/Bloc/bloc.dart';
import 'package:music_player/Bloc/state.dart';
import 'package:music_player/HomeScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/repository.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Repositry _repositry;

  var intialState;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primaryColor: Colors.white,
          ),
          home: BlocProvider(
            create: (context) => TracksBloc(intialState, _repositry),
        child: HomeScreen()
      )
    );
  }
}

