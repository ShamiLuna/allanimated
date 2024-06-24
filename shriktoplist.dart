// import 'package:flutter/material.dart';
//
// const itemSize = 150.0;
//
// class ShrinkTopListPage extends StatefulWidget {
//   @override
//   _ShrinkTopListPageState createState() => _ShrinkTopListPageState();
// }
//
// class _ShrinkTopListPageState extends State<ShrinkTopListPage> {
//   final scrollController = ScrollController();
//
//   void onListen() {
//     setState(() {});
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     scrollController.addListener(onListen);
//   }
//
//   @override
//   void dispose() {
//     scrollController.removeListener(onListen);
//     scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shrink Top List'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
//         child: ListView.builder(
//           controller: scrollController,
//           itemCount: items.length,
//           itemBuilder: (context, index) {
//             final heightFactor = 0.8;
//             final itemPositionOffset = index * itemSize * heightFactor;
//             final difference = scrollController.offset - itemPositionOffset;
//             final percent = 1.0 - (difference / (itemSize * heightFactor));
//             double opacity = percent;
//             double scale = percent;
//             if (opacity > 1.0) opacity = 1.0;
//             if (opacity < 0.0) opacity = 0.0;
//             if (percent > 1.0) scale = 1.0;
//
//             return Align(
//               heightFactor: heightFactor,
//               child: Opacity(
//                 opacity: opacity,
//                 child: Transform(
//                   alignment: Alignment.center,
//                   transform: Matrix4.identity()..scale(scale, 1.0),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(20.0),
//                           topRight: Radius.circular(20.0),
//                         ),
//                       ),
//                       color: Colors.blueAccent,
//                       child: SizedBox(
//                         height: itemSize,
//                         child: Center(
//                           child: Text(
//                             items[index],
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
// final List<String> items = List.generate(20, (index) => 'Item $index');
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Shrink Top List',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ShrinkTopListPage(),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'charectorcontroller.dart';
//
// const itemSize = 150.0;
//
// class ShrinkTopListPage extends GetView<ListController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shrink Top List'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
//         child: GetBuilder<ListController>(
//           init: ListController(),
//           builder: (controller) {
//             return ListView.builder(
//               controller: controller.scrollController,
//               itemCount: controller.items.length,
//               itemBuilder: (context, index) {
//                 final item = controller.items[index];
//                 final opacity = controller.getOpacity(index);
//                 final scale = controller.getScale(index);
//                 return Align(
//                   heightFactor: 0.8,
//                   child: Opacity(
//                     opacity: opacity,
//                     child: Transform(
//                       alignment: Alignment.center,
//                       transform: Matrix4.identity()..scale(scale, 1.0),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(20.0),
//                               topRight: Radius.circular(20.0),
//                             ),
//                           ),
//                           color: Colors.blueAccent,
//                           child: SizedBox(
//                             height: itemSize,
//                             child: Center(
//                               child: Text(
//                                 item,
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Shrink Top List',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ShrinkTopListPage(),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'charectorcontroller.dart';
// import 'list_controller.dart';

class ShrinkTopListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shrink Top List'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
        child: GetBuilder<ListController>(
          init: ListController(),
          builder: (controller) {
            return ListView.builder(
              controller: controller.scrollController,
              itemCount: controller.items.length,
              itemBuilder: (context, index) {
                final item = controller.items[index];
                final opacity = controller.getOpacity(index);
                final scale = controller.getScale(index);
                return Column(
                  children: [
                    Align(
                      heightFactor: 0.8,
                      child: Opacity(
                        opacity: opacity,
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..scale(scale, 1.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                              ),
                              color: Colors.blueAccent,
                              child: SizedBox(
                                height: itemSize,
                                child: Center(
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40), // Add spacing between the cards
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

