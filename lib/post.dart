import 'package:flutter/material.dart';
import 'user.dart';
import 'globals.dart' as globals;
import 'classpost.dart';


class posts extends StatefulWidget {
  // const posts({ Key key }) : super(key: key);
  // post(this.id);
  final User user;
  const posts(this.user);

  @override
  _postsState createState() => _postsState(this.user);
}

class _postsState extends State<posts> {
  User user;
  _postsState(this.user);
  int id;
  List<Postingan> data=new List();
  // Postingan data;

  void initState() {
    super.initState();
    id=user.id;
    print("USER ID"+id.toString());

    // List<User> listuser=[];
    Postingan.getPost().then((value) {
      globals.listofpost.forEach((element) {
         if(element.userId==id){
           setState(() {
            //  data=element;
             data.add(element);
           });
         }

      });
      print(globals.listofpost.length);
      print(globals.listofpost[0].userId);
     
    });
  }



  @override
  Widget build(BuildContext context) {
    // return Container(
    //   // Text(user[0].city);
    //   child:
    //   Text(user.city),
    // );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("MY POST"),
        ),
        body: 
        globals.listofpost.length == 0
            ? Text("No post available", style: TextStyle(fontSize: 30))
            :
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          //  height: 220,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.pinkAccent.shade400,
            // image: DecorationImage(
            //   image: NetworkImage(
            //     'https://i.pinimg.com/originals/85/b2/5d/85b25dcfa76bbd173d1e6e94227125b6.jpg',
            //   ),  //ga keluar gambarnya
            //   fit: BoxFit.cover,
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
                          // return GestureDetector(
                          //   onTap: () {
          
                          //   },
                            return Card(
                                color: Colors.pink.shade50,
                                child: Column(
                                  mainAxisAlignment:MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text(
                                    data[index].title,
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    data[index].body,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),          
                                  SizedBox(
                                    height: 20,
                                  ),
                                  // OutlinedButton(
                                  //     onPressed: () {
                                  //       setState(() {
                                  //         Navigator.pushNamed(context, '/posts',
                                  //             arguments:
                                  //                 globals.listofuser[index]);
                                  //       });
                                  //     },
                                  //     style: ElevatedButton.styleFrom(
                                  //       primary: Colors.pink,
                                  //       onPrimary: Colors.black,
                                  //     ),
                                  //     child: Text("See My Post")),
                                ]));

                            //   ],
                            // )

                            // Text(globals.listofuser[0].id.toString()),
                          // );
                        })),
              ),
            ],
          ),
        ));
  }
}
