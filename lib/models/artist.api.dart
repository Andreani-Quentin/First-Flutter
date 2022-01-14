import 'package:festapp/models/artist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ArtistApi {
  static Future<List<Artist>> getArtist() async {
    final response = await http.get(Uri.parse("http://localhost:8080/artists/"));

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['data']) {
      _temp.add(i);
    }

    return Artist.artistsFromSnapshot(_temp);
  }
}