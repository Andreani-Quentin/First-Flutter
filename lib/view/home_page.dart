import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../entity/message.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Message> listeMessages  = List.empty();
  TextEditingController tecMessage = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("festApp")),
      body: Column(
        children: [
          _buildHomePage(),
          buildRowInput()
        ],
      ),
    );
  }

  Container buildRowInput() {
    return Container(
      decoration: BoxDecoration(color : Theme.of(context).primaryColor),
      child: Row(
        children: [
          Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: tecMessage,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Tapez un nouveau message",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              )
          ),
          TextButton(
              onPressed: _postMessages,
              child: Icon(Icons.send,color: Colors.white,)
          )
        ]
        ,),
    );
  }

  Expanded _buildHomePage() {
    return Expanded(
      child: ListView.separated(
        itemCount: listeMessages.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(listeMessages[index].author!.username),
                Spacer(),
                Text(listeMessages[index].created_at!.hour.toString() + ":" + listeMessages[index].created_at!.minute.toString(),
                    style: TextStyle(fontSize:  10.0,)),
              ],
            ),
            subtitle: Text(listeMessages[index].content,),
          );
        },
      ),
    );
  }

  _getMessages() async {
    var storage = FlutterSecureStorage();
    var responseMessages = await http.get(
      Uri.parse("http://127.0.0.1:8000/artist"),

    );
    if(responseMessages.statusCode == 200) {
      print(responseMessages.body.toString());
      List mapMessages = jsonDecode(responseMessages.body);
      listeMessages = mapMessages.map((i) => Message.fromJson(i)).toList();
      _reloadListView(listeMessages);
      listeMessages.forEach((element) {
        print(element.content);
      });
    }
  }

  _postMessages() async {
    var storage = FlutterSecureStorage();
    String? jwt = await storage.read(key: "jwt");
    String message = tecMessage.text;
    var sendMessages = await http.post(
        Uri.parse("https://flutter-learning.mooo.com/messages"),
        headers: <String, String>{
          "Authorization" : "Bearer " + jwt.toString()
        },
        body: { "content": message }
    );
  }

  _reloadListView(List<Message> msgs){
    setState(() {
      listeMessages = msgs;
    });
  }
}