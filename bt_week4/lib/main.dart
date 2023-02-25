import 'package:flutter/material.dart';

void main() {
  var imageList = [];
  imageList.add("https://www.pexels.com/photo/mosaic-alien-on-wall-1670977/");
  imageList.add(
      "https://images.pexels.com/photos/14845309/pexels-photo-14845309.jpeg?auto=compress&cs=tinysrgb&w=1600");
  imageList.add(
      "https://images.pexels.com/photos/15255293/pexels-photo-15255293.jpeg?auto=compress&cs=tinysrgb&w=1600");
  imageList.add(
      "https://images.pexels.com/photos/11139221/pexels-photo-11139221.jpeg?auto=compress&cs=tinysrgb&w=1600");
  imageList.add(
      "https://images.pexels.com/photos/15586829/pexels-photo-15586829.jpeg?auto=compress&cs=tinysrgb&w=1600");
  imageList.add(
      "https://images.pexels.com/photos/15586829/pexels-photo-15586829.jpeg?auto=compress&cs=tinysrgb&w=1600");
  imageList.add(
      "https://images.pexels.com/photos/13009437/pexels-photo-13009437.jpeg?auto=compress&cs=tinysrgb&w=1600");
  imageList.add("https://www.pexels.com/photo/mosaic-alien-on-wall-1670977/");
  imageList.add(
      "https://images.pexels.com/photos/13009437/pexels-photo-13009437.jpeg?auto=compress&cs=tinysrgb&w=1600");
  runApp(
    MyApp(
      items: List<String>.generate(9, (i) => 'Image $i ' + imageList[i]),
    ),
  );
}

class MyApp extends StatelessWidget {
  final List<String> items;

  const MyApp({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    const title = 'Bai Tap Tuan 4';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          prototypeItem: ListTile(
            title: Text(items.first),
          ),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
        ),
      ),
    );
  }
}
