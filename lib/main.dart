import 'package:flutter/material.dart';
import 'user.dart';
import 'globals.dart' as globals;
import 'post.dart';
import 'classpost.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => MyHomePage(),

        '/posts': (context) =>
            posts(ModalRoute.of(context).settings.arguments as User),
 
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();

    // List<User> listuser=[];
    User.getUser().then((value) {
      print(globals.listofuser.length);
      print(globals.listofuser[0].street);
      this.setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WELCOME TO NOTES OF THE DAY"),
          backgroundColor: Colors.black,
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          //  height: 220,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.pinkAccent.shade400,
            // image: DecorationImage(
            //   image: NetworkImage(
            //     'https://i.pinimg.com/originals/85/b2/5d/85b25dcfa76bbd173d1e6e94227125b6.jpg',
            //   ),
            //   fit: BoxFit.cover,  //ga keluar gambarnya
            // ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: SizedBox(
                    // width:700,
                    // width: 300,
                    width: MediaQuery.of(context).size.width *
                        1000, //you sure it should be 0.001?
                    // height: MediaQuery.of(context).size.height*0.3,
                    child: ListView.builder(
                        itemCount: globals.listofuser.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             posts(globals.listofuser[index].id)));

                              setState(() {
                                Navigator.pushNamed(context, '/posts',
                                    arguments: globals.listofuser[index]);
                              });
                            },
                            child: Card(
                                color: Colors.pink.shade50,
                                child: Column(children: [
                                  Text(
                                    globals.listofuser[index].name,
                                    style:  GoogleFonts.merriweatherSans(textStyle:TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black, 
                                        ),) 
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Username : " +
                                        globals.listofuser[index].username
                                            .toString(),
                                    style:  TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey, 
                                        ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Email : " +
                                        globals.listofuser[index].email
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Phone : " +
                                        globals.listofuser[index].phone
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  OutlinedButton(
                                      onPressed: () {
                                        setState(() {
                                          Navigator.pushNamed(context, '/posts',
                                              arguments:
                                                  globals.listofuser[index]);
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.pink,
                                        onPrimary: Colors.black,
                                      ),
                                      child: Text("SEE MY POST",style:GoogleFonts.mateSc())),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ])),

                            //   ],
                            // )

                            // Text(globals.listofuser[0].id.toString()),
                          );
                        })),
              ),
            ],
          ),
        ));
  }
}
// Row(
//   children: [
//     Column(
//       children: [
//         Text(globals.listofuser[index].name,
//             style: TextStyle(fontSize: 20)),
//         Text(globals.listofuser[index].email,
//             style: TextStyle(fontSize: 20)),
//       ],
//     )
//   ],
// )
