import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlbumDetailPage extends StatefulWidget {
  //const AlbumDetailPage({Key? key}) : super(key: key);
  final name;
  final artist;
  final imageUrl;

  AlbumDetailPage({this.name, this.artist, this.imageUrl});

  @override
  _AlbumDetailPageState createState() => _AlbumDetailPageState();
}

class _AlbumDetailPageState extends State<AlbumDetailPage> {
  /// It can make more attractive but as you mentioned UI is not important
  /// so thats why i keep it simple
  /// otherwise we can you Stack and others widgets and make it more attractive

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: showDetail(),
    );
  }

  Widget showDetail() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            widget.imageUrl,
            fit: BoxFit.cover,
          ),
          Text(widget.name,style: TextStyle(fontSize: 25),),
          Text(widget.artist,style: TextStyle(fontSize: 18),)
        ],
      ),
    );
  }
}
