// // import 'package:flutter/material.dart';
// // import 'package:motoveys/models/dataItemModel.dart';

// // class PolicyDetails extends StatefulWidget {
// //   final ClaimsDashboardItems selectedItem;

// //   const PolicyDetails({required this.selectedItem});
// //   @override
// //   State<PolicyDetails> createState() {
// //     return _PolicyDetailsScreen();
// //   }
// // }

// // class _PolicyDetailsScreen extends State<PolicyDetails> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             const Text('Policy & Claims Details'),
// //             const SizedBox(height: 5),
// //             Text(widget.selectedItem.requestNumber)
// //           ],
// //         ),
// //         backgroundColor: const Color(0xFF610361),
// //       ),
// //       body: SafeArea(
// //           child: SizedBox(
// //         height: MediaQuery.of(context).size.height,
// //         child: Column(
// //           children: [
// //             Padding(
// //               padding: EdgeInsets.all(10),
// //               child: Column(
// //                 children: [
// //                   Text("Hello"),
// //                 ],
// //               ),
// //             )
// //           ],
// //         ),
// //       )),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:motoveys/Screens/claimInformation.dart';
// import 'package:motoveys/Screens/policyInformation.dart';
// import 'package:motoveys/models/dataItemModel.dart';

// class PolicyDetails extends StatefulWidget {
//   final ClaimsDashboardItems selectedItem;

//   const PolicyDetails({required this.selectedItem});

//   @override
//   State<PolicyDetails> createState() {
//     return _PolicyDetailsScreen();
//   }
// }

// class _PolicyDetailsScreen extends State<PolicyDetails> {
//   int _currentIndex = 0;
//   var widgetArray = [];

//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       widgetArray = [
//         // Text('Policy Information'),
//         PolicyInformation(selectedItems: widget.selectedItem),
//         // Text('Claim Information')
//         ClaimInformationScreen(selectedItems: widget.selectedItem)
//       ];
//     });
//   } // Current index for bottom navigation bar

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Policy & Claims Details' , style: TextStyle(color: Colors.white),),
//             // const SizedBox(height: 5),
//             // Text(widget.selectedItem.requestNumber)
//           ],
//         ),
//         backgroundColor: const Color(0xFF610361),
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: SafeArea(
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height,
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: Column(
//                   children: [widgetArray[_currentIndex]],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white70,
//         selectedItemColor: const Color(0xFF610361),
//         currentIndex: _currentIndex,
//         onTap: (int index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.portrait_outlined),
//             label: 'Policy Info',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.car_crash_outlined),
//             label: 'Claim Info',
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:motoveys/Screens/claimInformation.dart';
import 'package:motoveys/Screens/policyInformation.dart';
import 'package:motoveys/models/dataItemModel.dart';

class PolicyDetails extends StatefulWidget {
  final ClaimsDashboardItems selectedItem;

  const PolicyDetails({required this.selectedItem});

  @override
  State<PolicyDetails> createState() {
    return _PolicyDetailsScreen();
  }
}

class _PolicyDetailsScreen extends State<PolicyDetails> {
  int? _currentIndex;
  var widgetArray = [];

  @override
  void initState() {
    super.initState();
    widgetArray = [
      PolicyInformation(selectedItems: widget.selectedItem),
      ClaimInformationScreen(selectedItems: widget.selectedItem),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width / 2.5;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Policy & Claims Details',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF610361),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: buttonWidth,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _currentIndex == 0
                            ? Colors.grey
                            : const Color(0xFF610361),
                      ),
                      child: Text(
                        'Policy Info',
                        style: TextStyle(
                          color: _currentIndex == 0
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: buttonWidth,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _currentIndex == 1
                            ? Colors.grey
                            : const Color(0xFF610361),
                      ),
                      child: Text(
                        'Claim Info',
                        style: TextStyle(
                          color: _currentIndex == 1
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: _currentIndex == null
                      ? Center(child: Text('Click on Button to see information'))
                      : widgetArray[_currentIndex!],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
