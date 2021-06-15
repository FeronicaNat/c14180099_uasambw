// SNACKBAR                   
//                     ElevatedButton(
//                         onPressed: () async {
//                           result = await Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => Register(isidata)));
//                           print("HASIL RESULT");
//                           print(result.email);

//                           // SnackBar snackbar = SnackBar(content: Text(result));

//                           // ScaffoldMessenger.of(context).showSnackBar(snackbar);
//                         },
//                         child: Text("Register Now")),


// DROPDOWN

//         String isidropdown="1";
//         List dropdownnya = ['1', '2', '3', '4'];
//         DropdownButton(
//             hint: Text('Please choose the value'), // Not necessary for Option 1
//             value: isidropdown,
//             onChanged: (newValue) {
//               setState(() {
//                 isidropdown = newValue;
//                 print("DROPP" + isidropdown);
//               });
//             },
//             items: dropdownnya.map((valuedropdown) {
//               return DropdownMenuItem(
//                 child: new Text("Pilihan "+valuedropdown),
//                 value: valuedropdown,
//               );
//             }).toList(),
//           ),

// LISTVIEW

//     return ListView.builder(
//         itemCount: globals.arrReqresUser.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           details(id: globals.arrReqresUser[index].id),
//                     ));
//               },
//               child: buatNode(index));
//         });