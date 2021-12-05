import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../entity/artist.dart';
import 'package:http/http.dart' as http;

class AdminArtistPage extends StatefulWidget {
  const AdminArtistPage({Key? key}) : super(key: key);

  @override
  _AdminArtistPageState createState() => _AdminArtistPageState();
}

class _AdminArtistPageState extends State<AdminArtistPage> {
  late Future<Artist> listArtist;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listArtist = getArtists();
    print(listArtist);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin / Artist")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // _buildArtistAdminPage(),
            ElevatedButton(
              onPressed: _goAjoutArtist,
              child: const Text('Ajouter un artist'),
            ),
          ],
        ),
      ),
    );
  }

  // Expanded _buildArtistAdminPage() {
  //   return Expanded(
  //     child: ListView.separated(
  //       itemCount: listArtist.length,
  //       separatorBuilder: (context, index) => Divider(),
  //       itemBuilder: (context, index) {
  //         return ListTile(
  //           title: Row(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               Text(listArtist[index].name),
  //               Spacer(),
  //             ],
  //           ),
  //           subtitle: Text(
  //             listArtist[index].description,
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  void _goAjoutArtist() {
    Navigator.pushNamed(context, '/admin/artist/ajout');
  }

  Future<Artist> getArtists() async {
    final response = await http.get(
      Uri.parse("http://localhost:8080/artists/"),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> mapArtists = jsonDecode(response.body);
      List<dynamic> listArtist = mapArtists["data"];
      print(listArtist[0]["name"]);
      listArtist.forEach((element) {
        print(element);
      });
      return listArtist;
    }else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Artist> getArtists() async {
    final response = await http
        .get(Uri.parse('http://localhost:8080/artists/'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Artist.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
