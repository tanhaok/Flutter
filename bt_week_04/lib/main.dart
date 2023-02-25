import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'albums.dart';
import 'photos.dart';

void main() => runApp(const ListTileApp());

class ListTileApp extends StatelessWidget {
  const ListTileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('List Album')),
        body: const MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Album>>(
        future: fetchAlbums(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return AlbumList(albums: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class AlbumList extends StatefulWidget {
  final List<Album> albums;
  AlbumList({Key? key, required this.albums}) : super(key: key);

  @override
  _AlbumList createState() {
    return _AlbumList();
  }
}

class _AlbumList extends State<AlbumList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: ListView.builder(
                itemCount: widget.albums.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    subtitle: Text(
                        "${widget.albums[index].id} ${widget.albums[index].title}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhotoScreen(
                            albumTitle: widget.albums[index].title,
                          ),
                        ),
                      );
                    },
                    trailing: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            widget.albums.removeAt(index);
                          });
                        },
                        child: Icon(Icons.delete_forever)),
                  );
                })));
  }
}

class PhotoScreen extends StatelessWidget {
  // In the constructor, require a Todo.
  const PhotoScreen({super.key, required this.albumTitle});
  final String albumTitle;

  // Declare a field that holds the Todo.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(albumTitle,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({super.key, required this.photos});

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 12,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].thumbnailUrl);
      },
    );
  }
}
