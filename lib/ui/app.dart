import 'package:flutter/material.dart';

import 'album_list.dart';


class App extends StatelessWidget {
  //const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
        body: AlbumList(),
      ),
    );
  }
}