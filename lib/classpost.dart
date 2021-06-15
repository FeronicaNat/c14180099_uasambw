import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';
import 'globals.dart' as globals;

// {
//     "userId": 1,
//     "id": 1,
//     "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
//     "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
//   },

class Postingan {
  int userId;
  int id;
  String title;
  String body;

  Postingan(
      {this.userId,
      this.id,
      this.title,
      this.body,
  });

  
  static Future getPost() async {
    //nnti setelah data berhasil diambil

    String URLapi = 'https://jsonplaceholder.typicode.com/posts';

    var apiResult = await http.get(Uri.parse(URLapi));

    var jsonObject = json.decode(apiResult.body); //buat ambil body dari json

    // return listUser;
    List<Postingan> listPost = [];
    for (int i = 0; i < jsonObject.length; i++) {
      listPost.add(Postingan(
          userId: jsonObject[i]['userId'],
          id: jsonObject[i]['id'],
          title: jsonObject[i]['title'],
          body: jsonObject[i]['body'],
));
    }

    globals.listofpost = listPost; 
  }
}
