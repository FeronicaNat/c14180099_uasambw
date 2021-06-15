import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';
import 'globals.dart' as globals;

// {
//   "id": 1,
//   "name": "Leanne Graham",
//   "username": "Bret",
//   "email": "Sincere@april.biz",
//   "address": {
//     "street": "Kulas Light",
//     "suite": "Apt. 556",
//     "city": "Gwenborough",
//     "zipcode": "92998-3874",
//     "geo": {
//       "lat": "-37.3159",
//       "lng": "81.1496"
//     }
//   },
//   "phone": "1-770-736-8031 x56442",
//   "website": "hildegard.org",
//   "company": {
//     "name": "Romaguera-Crona",
//     "catchPhrase": "Multi-layered client-server neural-net",
//     "bs": "harness real-time e-markets"
//   }
// },

class User {
  int id;
  String name;
  String username;
  String email;
  String street;
  String suite;
  String city;
  String phone;
  String website;
  String company;

  User(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.street,
      this.suite,
      this.city,
      this.phone,
      this.website,
      this.company});

  // dataAPI({
  //   this.myid, this.myemail
  // });

  // factory User.createData(Map<String, dynamic> object) {
  //   //buat masukin data
  //   return User(
  //       id: object['id'],
  //       name: object['name'],
  //       username: object['username'],
  //       email: object['email'],
  //       address: object['address'],
  //       phone:object['phone'],
  //       website:object['website'],
  //       company:object['company']
  //       );
  // }

  // static Future getDataFromWeb() async

  static Future getUser() async {
    //nnti setelah data berhasil diambil

    String URLapi = 'https://jsonplaceholder.typicode.com/users';

    var apiResult = await http.get(Uri.parse(URLapi));

    var jsonObject = json.decode(apiResult.body); //buat ambil body dari json
    // var data = (jsonObject as Map<String, dynamic>);
    // List<User> listUser = [];
    // for (int i = 0; i < data.length; i++)
    //   listUser.add(User.createData(data[i]));

    // globals.listofuser = listUser;

    // return listUser;
    List<User> listUser = [];
    for (int i = 0; i < jsonObject.length; i++) {
      listUser.add(User(
          id: jsonObject[i]['id'],
          name: jsonObject[i]['name'],
          username: jsonObject[i]['username'],
          email: jsonObject[i]['email'],
          street: jsonObject[i]['address']['street'],
          suite: jsonObject[i]['address']['suite'],
          city: jsonObject[i]['address']['city'],
          phone: jsonObject[i]['phone'],
          website: jsonObject[i]['website'],
          company: jsonObject[i]['company']['name']));
    }

    globals.listofuser = listUser; 
  }
}
