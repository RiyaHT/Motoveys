// import 'package:flutter/material.dart';
// import 'package:motoveys/Screens/claimProcessing.dart';
// import 'package:motoveys/Screens/dashBoardItem.dart';
// import 'package:motoveys/Screens/userProfile.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../models/dataItemModel.dart';
// import './dashBoardItem.dart';

// class DashboardPage extends StatefulWidget {
//   @override
//   State<DashboardPage> createState() => _DashboardPageState();
// }

// class _DashboardPageState extends State<DashboardPage> {
//   _handlePhoneButton() async {
//     print("phoneButton clicked");
//     var url = Uri.parse("tel:+919769253131");
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     } else {
//       throw 'Could not launch $url ';
//     }
//   }

//   _handleMailButton() async {
//     print("mailButton clicked");
//     var mail = 'example@example.com';
//     var url = Uri.parse("mailto:$mail");

//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     } else {
//       throw 'Could not launch $url ';
//     }
//     // final Uri params = Uri(
//     //   scheme: 'mailto',
//     //   path: 'email@example.com',
//     //   query:
//     //       'subject=App Feedback&body=App Version 3.23', //add subject and body here
//     // );

//     // if (await canLaunchUrl(params)) {
//     //   await launchUrl(params);
//     // } else {
//     //   throw 'Could not launch';
//     // }
//   }

//   _handleTextMessage() async {
//     print("text button clicked");
//     var url = Uri.parse("sms:+919769253131");
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     } else {
//       throw 'Could not launch $url ';
//     }
//   }

//   var searchIsOn = false;
//   bool isSearching = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: SafeArea(
//         child: Drawer(
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: [
//               const DrawerHeader(
//                 decoration: BoxDecoration(
//                   color: Color(0xFF610361),
//                 ),
//                 child: UserAccountsDrawerHeader(
//                   accountName: Text(
//                     "Ram Sharma",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   accountEmail: Text("Ram@gmail.com"),
//                   decoration: BoxDecoration(
//                     color: Color(0xFF610361),
//                   ),
//                   currentAccountPictureSize: Size.square(50),
//                   currentAccountPicture: CircleAvatar(
//                     backgroundColor: Color.fromARGB(255, 179, 14, 179),
//                     child: Text(
//                       "R",
//                       style: TextStyle(
//                           fontSize: 30.0, color: Color.fromARGB(255, 0, 0, 0)),
//                     ), //Text
//                   ),
//                 ),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.person),
//                 title: const Text("My Profile"),
//                 onTap: () {
//                   print("profile clicked!");
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => MyProfile(),
//                     ),
//                   );
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.person),
//                 title: const Text("Log Out"),
//                 onTap: () {
//                   print("Logout clicked!");
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(
//                   //     builder: (context) => MyProfile(),
//                   //   ), // Replace SameerPage() with your actual Sameer.dart page class
//                   // );
//                 },
//               ),

//               // PopupMenuItem<int>(
//               //   value: 0,
//               //   child: Text("Profile"),
//               // ),
//               // PopupMenuItem<int>(
//               //   value: 1,
//               //   child: Text("Logout"),
//               // ),
//               // PopupMenuItem<int>(
//               //   value: 2,
//               //   child: Text("Text"),
//               // ),
//               // PopupMenuItem<int>(
//               //   value: 2,
//               //   child: Text(
//               //     "App Version 1.0",
//               //     style: TextStyle(color: Color.fromARGB(90, 0, 0, 0)),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//       appBar: AppBar(
//         title: isSearching ? _buildSearchField() : Text('Dashboard'),

//         titleTextStyle: const TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//             fontSize: 24,
//             letterSpacing: 2),
//         centerTitle: false,
//         backgroundColor: Color(0xFF610361),
//         iconTheme: IconThemeData(color: Colors.white),
//         // leading: IconButton(
//         //   icon: Icon(Icons.menu),
//         //   onPressed: () {
//         //     // Show dropdown menu
//         //     showMenu(
//         //       context: context,
//         //       position: RelativeRect.fromLTRB(
//         //           0, 56, 0, 0), // Adjust the position as needed
//         //       items: [
//         //         PopupMenuItem<int>(
//         //           value: 0,
//         //           child: Text("Profile"),
//         //         ),
//         //         PopupMenuItem<int>(
//         //           value: 1,
//         //           child: Text("Logout"),
//         //         ),
//         //         PopupMenuItem<int>(
//         //           value: 2,
//         //           child: Text("Text"),
//         //         ),
//         //       ],
//         //     ).then((value) {
//         //       if (value == 0) {
//         //         print("Profile menu is selected.");
//         //       } else if (value == 1) {
//         //         print("Logout menu is selected.");
//         //       } else if (value == 2) {
//         //         print("Text menu is selected.");
//         //       }
//         //     });
//         //   },
//         // ),
//         actions: [
//           IconButton(
//               onPressed: () {
//               setState(() {
//                 isSearching = !isSearching;
//               });
//             },
//               icon: Icon(Icons.search_outlined)),
//           // IconButton(
//           //     onPressed: () {
//           //       print("Filter button clicked");
//           //     },
//           //     icon: Icon(Icons.filter_alt_rounded)),
//           IconButton(
//               onPressed: () {
//                 print("Notification button clicked");
//               },
//               icon: Icon(Icons.notification_add_outlined)),
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: ListView.builder(
//           itemCount: dummyData.length,
//           itemBuilder: (context, index) {
//             //******************************************************************************* */
//             // return DashboardItemWidget(
//             //     item: dummyData[index], searchIsOn: searchIsOn);
//             return GestureDetector(
//                 onTap: () {
//                   // Navigate to Sameer.dart page
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ClaimProcessing(
//                         // selectedItem: widget.item
//                         selectedItem: dummyData[index],
//                       ),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   child: Card(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         side: const BorderSide(
//                             width: 2,
//                             color: Color.fromARGB(255, 165, 11, 152))),
//                     elevation: 10,
//                     color: Colors.blueGrey.shade50,
//                     margin: const EdgeInsets.symmetric(vertical: 5),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         // const SizedBox(
//                         //   height: 20,
//                         // ),
//                         // SizedBox(
//                         //     height: 150,
//                         //     width: 100,
//                         //     child: Image.asset(
//                         //       'lib/assests/civic.jpg',
//                         //       // fit: BoxFit.fitHeight,
//                         //     )),
//                         // SizedBox(
//                         //   width: 10,
//                         // ),
//                         Image.asset(
//                           ('lib/assests/civic.jpg'),
//                           // scale: Checkbox.width,
//                           width: 150,
//                           // height: 190,
//                         ),
//                         SizedBox(
//                           width: 2,
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const SizedBox(height: 10),
//                             Text(
//                               // "${widget.item.requestNumber}"
//                               '${dummyData[index].requestNumber}',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                                 // '${widget.item.customerName}'
//                                 '${dummyData[index].customerName}'),
//                             Text(
//                                 // '${widget.item.carNumber}'
//                                 '${dummyData[index].carNumber}'),
//                             Text(
//                                 // '${widget.item.carName}'
//                                 '${dummyData[index].carName}'),
//                             const Text(
//                               'Maruti Suzuki Authorised Service Center',
//                               style: TextStyle(fontSize: 10),
//                               // softWrap: false,
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             // const Expanded(
//                             //   child: Row(
//                             //     children: [
//                             //       Flexible(
//                             //         child: Text(
//                             //           'Maruti Suzuki Authorised Service Center',
//                             //           softWrap: false,
//                             //           maxLines: 4,
//                             //           overflow: TextOverflow.ellipsis,
//                             //           style: TextStyle(
//                             //               fontSize: 14,
//                             //               letterSpacing: 2,
//                             //               fontWeight: FontWeight.bold,
//                             //               color: Color.fromRGBO(0, 0, 0, 1)),
//                             //         ),
//                             //       )
//                             //     ],
//                             //   ),
//                             // ),
//                             Text(
//                               // '${widget.item.status}',
//                               '${dummyData[index].status}',
//                               style: TextStyle(color: Colors.red.shade300),
//                             ),
//                             const SizedBox(height: 10),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 // Icon(Icons.phone),
//                                 // IconButton(
//                                 //     onPressed: _handlePhoneButton,
//                                 //     icon: Icon(
//                                 //       Icons.phone,
//                                 //       color: Colors.blue.shade300,
//                                 //     )
//                                 //     // icon: SvgPicture.asset(
//                                 //     //   'lib/assests/phone.svg',
//                                 //     //   width: 20,
//                                 //     //   height: 10,
//                                 //     // )
//                                 //     ),
//                                 ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       shape: const CircleBorder(),
//                                       padding: const EdgeInsets.all(6),
//                                       backgroundColor: Colors.white,
//                                       elevation: 7,
//                                       // elevation is 10 by default
//                                       shadowColor:
//                                           Color.fromARGB(255, 107, 9, 116),
//                                     ),
//                                     onPressed: _handlePhoneButton,
//                                     child: ShaderMask(
//                                       shaderCallback: (Rect bounds) {
//                                         return const LinearGradient(
//                                           begin: Alignment.topCenter,
//                                           end: Alignment.bottomCenter,
//                                           colors: [
//                                             Color.fromRGBO(112, 12, 121, 1),
//                                             Color.fromARGB(255, 32, 35, 202)
//                                           ],
//                                         ).createShader(bounds);
//                                       },
//                                       child: const Icon(
//                                         Icons.phone,
//                                         size: 20,
//                                       ),
//                                     )),
//                                 // SizedBox(width: 6),
//                                 // width is 10 if we use iconbutton
//                                 ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       shape: const CircleBorder(),
//                                       padding: const EdgeInsets.all(6),
//                                       backgroundColor: Colors.white,
//                                       elevation: 7,
//                                       shadowColor:
//                                           Color.fromARGB(255, 107, 9, 116),
//                                     ),
//                                     onPressed: _handleMailButton,
//                                     child: ShaderMask(
//                                       shaderCallback: (Rect bounds) {
//                                         return const LinearGradient(
//                                           begin: Alignment.topCenter,
//                                           end: Alignment.bottomCenter,
//                                           colors: [
//                                             Color.fromRGBO(112, 12, 121, 1),
//                                             Color.fromARGB(255, 32, 35, 202)
//                                           ],
//                                         ).createShader(bounds);
//                                       },
//                                       child: const Icon(
//                                         Icons.mail_lock_outlined,
//                                         size: 20,
//                                       ),
//                                     )),

//                                 // IconButton(
//                                 //     onPressed: _handleMailButton,
//                                 //     icon: Icon(
//                                 //       Icons.mail_outline,
//                                 //       color: Colors.indigo.shade900,
//                                 //     )),
//                                 // Icon(Icons.mail_outline),
//                                 // SizedBox(width: 6),
//                                 //width is 10 by defaul
//                                 ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       shape: const CircleBorder(),
//                                       padding: const EdgeInsets.all(6),
//                                       backgroundColor: Colors.white,
//                                       elevation: 7,
//                                       shadowColor:
//                                           Color.fromARGB(255, 107, 9, 116),
//                                     ),
//                                     onPressed: _handleTextMessage,
//                                     child: ShaderMask(
//                                       shaderCallback: (Rect bounds) {
//                                         return const LinearGradient(
//                                           begin: Alignment.topCenter,
//                                           end: Alignment.bottomCenter,
//                                           colors: [
//                                             Color.fromRGBO(112, 12, 121, 1),
//                                             Color.fromARGB(255, 32, 35, 202)
//                                           ],
//                                         ).createShader(bounds);
//                                       },
//                                       child: const Icon(
//                                         Icons.message_outlined,
//                                         size: 20,
//                                       ),
//                                     )),
//                                 // IconButton(
//                                 //     onPressed: _handleTextMessage,
//                                 //     icon: Icon(Icons.message_outlined)),
//                                 // Icon(Icons.message_outlined),
//                               ],
//                             ),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             const SizedBox(height: 10),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ));
//           },
//         ),
//       ),
//     );
//   }
// }

// Widget _buildSearchField() {
//   return Expanded(
//     child: TextField(
//       style: TextStyle(color: Colors.black), // Set text color to black
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.white, // Set background color to white
//         hintText: 'Search...',
//         hintStyle: TextStyle(color: Colors.black54), // Set hint text color to black
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide.none, // Remove border
//         ),
//         contentPadding: EdgeInsets.symmetric(horizontal: 15),
//       ),
//       autofocus: true,
//       textInputAction: TextInputAction.search,
//       onSubmitted: (value) {
//         // Handle search here
//       },
//     ),
//   );
// }

// //***************** */

import 'package:flutter/material.dart';
import 'package:motoveys/Screens/claimProcessing.dart';
import 'package:motoveys/Screens/dashBoardItem.dart';
import 'package:motoveys/Screens/loginPage.dart';
import 'package:motoveys/Screens/userProfile.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/dataItemModel.dart';
import './dashBoardItem.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List _filteredData = dummyData;

  void _handlePhoneButton() async {
    print("phoneButton clicked");
    var url = Uri.parse("tel:+919769253131");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url ';
    }
  }

  void _handleMailButton() async {
    print("mailButton clicked");
    var mail = 'example@example.com';
    var url = Uri.parse("mailto:$mail");

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url ';
    }
  }

  void _handleTextMessage() async {
    print("text button clicked");
    var url = Uri.parse("sms:+919769253131");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url ';
    }
  }

  bool isSearching = false;

  void _filterData(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredData = dummyData;
      } else {
        _filteredData = dummyData
            .where((item) =>
                item.customerName.toLowerCase().contains(query.toLowerCase()) ||
                item.carName.toLowerCase().contains(query.toLowerCase()) ||
                item.carNumber.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF610361),
                ),
                child: UserAccountsDrawerHeader(
                  accountName: Text(
                    "Ram Sharma",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  accountEmail: Text("Ram@gmail.com"),
                  decoration: BoxDecoration(
                    color: Color(0xFF610361),
                  ),
                  currentAccountPictureSize: Size.square(50),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 179, 14, 179),
                    child: Text(
                      "R",
                      style: TextStyle(
                          fontSize: 30.0, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("My Profile"),
                onTap: () {
                  print("profile clicked!");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyProfile(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Log Out"),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                  print("Logout clicked!");
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: isSearching ? _buildSearchField() : Text('Dashboard'),
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
            letterSpacing: 2),
        centerTitle: false,
        backgroundColor: Color(0xFF610361),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                  if (!isSearching) {
                    _filteredData = dummyData;
                  }
                });
              },
              icon: Icon(Icons.search_outlined)),
          IconButton(
              onPressed: () {
                print("Notification button clicked");
              },
              icon: Icon(Icons.notification_add_outlined)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _filteredData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ClaimProcessing(
                        selectedItem: _filteredData[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                            width: 2,
                            color: Color.fromARGB(255, 165, 11, 152))),
                    elevation: 10,
                    color: Colors.white,
                    surfaceTintColor: Colors.transparent,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          ('lib/assests/civic.jpg'),
                          width: 150,
                        ),
                        SizedBox(width: 2),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              '${_filteredData[index].requestNumber}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('${_filteredData[index].customerName}'),
                            Text('${_filteredData[index].carNumber}'),
                            Text('${_filteredData[index].carName}'),
                            const Text(
                              'Maruti Suzuki Authorised Service Center',
                              style: TextStyle(fontSize: 10),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${_filteredData[index].status}',
                              style: TextStyle(color: Colors.red.shade300),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(6),
                                      backgroundColor: Colors.white,
                                      elevation: 7,
                                      shadowColor:
                                          Color.fromARGB(255, 107, 9, 116),
                                    ),
                                    onPressed: _handlePhoneButton,
                                    child: ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromRGBO(112, 12, 121, 1),
                                            Color.fromARGB(255, 32, 35, 202)
                                          ],
                                        ).createShader(bounds);
                                      },
                                      child: const Icon(
                                        Icons.phone,
                                        size: 20,
                                      ),
                                    )),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(6),
                                      backgroundColor: Colors.white,
                                      elevation: 7,
                                      shadowColor:
                                          Color.fromARGB(255, 107, 9, 116),
                                    ),
                                    onPressed: _handleMailButton,
                                    child: ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromRGBO(112, 12, 121, 1),
                                            Color.fromARGB(255, 32, 35, 202)
                                          ],
                                        ).createShader(bounds);
                                      },
                                      child: const Icon(
                                        Icons.mail_lock_outlined,
                                        size: 20,
                                      ),
                                    )),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(6),
                                      backgroundColor: Colors.white,
                                      elevation: 7,
                                      shadowColor:
                                          Color.fromARGB(255, 107, 9, 116),
                                    ),
                                    onPressed: _handleTextMessage,
                                    child: ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromRGBO(112, 12, 121, 1),
                                            Color.fromARGB(255, 32, 35, 202)
                                          ],
                                        ).createShader(bounds);
                                      },
                                      child: const Icon(
                                        Icons.message_outlined,
                                        size: 20,
                                      ),
                                    )),
                              ],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Search...',
        hintStyle: TextStyle(color: Colors.black54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
      ),
      autofocus: true,
      textInputAction: TextInputAction.search,
      onChanged: (value) {
        _filterData(value);
      },
    );
  }
}
