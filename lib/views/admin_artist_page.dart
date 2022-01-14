import 'package:festapp/models/artist.api.dart';
import 'package:festapp/models/artist.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'widgets/card.dart';

class AdminArtistPage extends StatefulWidget {
  const AdminArtistPage({Key? key}) : super(key: key);

  @override
  _AdminArtistPageState createState() => _AdminArtistPageState();
}

class _AdminArtistPageState extends State<AdminArtistPage> {
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
      appBar: AppBar(title: const Text("Admin / Artist")),
      body: _isLoading ? Center(child: CircularProgressIndicator()) :
           ListView.builder(
               itemCount: _artists.length,
               itemBuilder: (context, index){
                return Carte(
                    name: _artists[index].name,
                    cookTime: "15h30",
                    imageUrl: _artists[index].image
                );
               }
           )
            // ElevatedButton(
            //   onPressed: _goAjoutArtist,
            //   child: const Text('Ajouter un artist'),
            // ),
    );
  }
}
