import 'package:festapp/models/artist.api.dart';
import 'package:festapp/models/artist.dart';
import 'package:festapp/views/widgets/card.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/message.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Artist> _artists;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    getArtists();
  }

  Future<void> getArtists() async {
    _artists = await ArtistApi.getArtist();
    setState(() {
      _isLoading = false;
    });
    print(_artists);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("festApp")),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _artists.length,
                itemBuilder: (context, index) {
                  return Carte(
                      name: _artists[index].name,
                      cookTime: "15h30",
                      imageUrl: _artists[index].image);
                }
            ),
    );
  }
}
