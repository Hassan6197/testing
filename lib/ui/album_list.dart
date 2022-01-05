import 'package:flutter/material.dart';
import 'package:musically_app/blocs/bloc.dart';
import 'package:musically_app/models/albums.dart';

import 'album_detail_page.dart';

class AlbumList extends StatefulWidget {
  //const AlbumList({Key? key}) : super(key: key);

  @override
  _AlbumListState createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  String albumName = "";
  bool showList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Musically'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              searchForAlbums(),
              ElevatedButton(onPressed: doSearch, child: Text("Search")),
              if (showList) setStreamBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchForAlbums() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Album name",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextFormField(
              keyboardType: TextInputType.text,
              // keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please write album name";
                }
                return null;
              },
              onSaved: (String value) {
                setState(() {
                  albumName = value;
                });
              },
              onChanged: (String value) {
                setState(() {
                  albumName = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Enter album name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void doSearch() {
    bloc.fetchAllAlbums(albumName);
    setState(() {
      showList = true;
    });
  }

  Widget setStreamBuilder() {
    if (albumName != "") {
      bloc.fetchAllAlbums(albumName);
      return StreamBuilder(
        stream: bloc.allAlbums,
        builder: (context, AsyncSnapshot<Musically> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      );
    } else {
      return Text("Please write album name for search");
    }
  }

  Widget buildList(AsyncSnapshot<Musically> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.results.albummatches.album.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          String name = snapshot.data.results.albummatches.album[index].name;
          String artist =
              snapshot.data.results.albummatches.album[index].artist;
          // print(
          //     'hello checking......${snapshot.data.results.albummatches.album[index].image[index].text}');
          return Padding(
            padding: const EdgeInsets.all(5),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 5,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AlbumDetailPage(
                            name: name,
                            artist: artist,
                            imageUrl: snapshot.data.results.albummatches
                                .album[index].image[3].text)),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// We can make separate text widget for showing all the text,
                      /// by passing the value to it as shown in the comments but
                      /// as yours requirments i kept it simple
                      textWidget(name, true),
                      textWidget('by $artist', false),
                      // Text(
                      //   name,
                      //   style: const TextStyle(
                      //       fontSize: 18, fontWeight: FontWeight.bold),
                      // ),
                      // Text('by $artist'),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget textWidget(String name, bool giveStyle) {
    return Text(
      name,
      style: giveStyle
          ? const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
          : null,
    );
  }
}
