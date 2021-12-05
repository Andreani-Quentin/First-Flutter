import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AjoutArtist extends StatefulWidget {
  const AjoutArtist({Key? key}) : super(key: key);
  @override
  _AjoutArtistState createState() => _AjoutArtistState();
}

class _AjoutArtistState extends State<AjoutArtist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Artist / Ajout"))
    );
  }
}