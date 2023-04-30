// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:smart_batching/constants/colors.dart';

// class HelpCenterScreen extends StatefulWidget {
//   const HelpCenterScreen({super.key});
//   static const String id = "help-center-screen";

//   @override
//   State<HelpCenterScreen> createState() => _HelpCenterScreenState();
// }

// class _HelpCenterScreenState extends State<HelpCenterScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kscreenBackground,
//       appBar: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: kscreenBackground,
//           elevation: 0.0,
//           title: Text(
//             'Help Center',
//             style: GoogleFonts.raleway(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       body: const Center(
//         child: Text(
//           'Hi',
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_batching/constants/colors.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);
  static const String id = "help-center-screen";

  @override
  _HelpCenterScreenState createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  // final int _current = 0;
  // final dynamic _selectedIndex = {};

  // final CarouselController _carouselController = CarouselController();

  // final List<dynamic> _products = [
  //   {
  //     'title': 'Adidas Originals \nby Alexander Wang',
  //     'image':
  //         'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzV8fGFkaWRhc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
  //     'description': 'Limited collection'
  //   },
  //   {
  //     'title': 'Adidas Originals \nby Alexander Wang',
  //     'image':
  //         'https://images.unsplash.com/photo-1582588678413-dbf45f4823e9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2265&q=80',
  //     'description': 'Limited collection'
  //   },
  //   {
  //     'title': 'Adidas Originals \nby Alexander Wang',
  //     'image':
  //         'https://images.unsplash.com/photo-1589188056053-28910dc61d38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2264&q=80',
  //     'description': 'Limited collection'
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kscreenBackground,
      // floatingActionButton: _selectedIndex.length > 0
      //     ? FloatingActionButton(
      //         onPressed: () {
      //           // Navigator.of(context).push(
      //           //   MaterialPageRoute(
      //           //     builder: (context) => HelpCenterDetailsScreen(
      //           //       products: _products,
      //           //     ),
      //           //   ),
      //           // );
      //         },
      //         child: const Icon(Icons.arrow_forward_ios),
      //       )
      //     : null,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kscreenBackground,
        elevation: 0.0,
        title: Text(
          'Help Center',
          style: GoogleFonts.raleway(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // body: SizedBox(
      //   width: double.infinity,
      //   height: double.infinity,
      //   child: CarouselSlider(
      //       carouselController: _carouselController,
      //       options: CarouselOptions(
      //         height: 450.0,
      //         aspectRatio: 16 / 9,
      //         viewportFraction: 0.70,
      //         enlargeCenterPage: true,
      //         pageSnapping: true,
      //         onPageChanged: (index, reason) {
      //           setState(
      //             () {
      //               _current = index;
      //             },
      //           );
      //         },
      //       ),
      //       items: _products.map((movie) {
      //         return Builder(
      //           builder: (BuildContext context) {
      //             return GestureDetector(
      //               onTap: () {
      //                 setState(
      //                   () {
      //                     if (_selectedIndex == movie) {
      //                       _selectedIndex = {};
      //                     } else {
      //                       _selectedIndex = movie;
      //                     }
      //                   },
      //                 );
      //               },
      //               child: AnimatedContainer(
      //                 duration: const Duration(milliseconds: 300),
      //                 width: MediaQuery.of(context).size.width,
      //                 decoration: BoxDecoration(
      //                   color: Colors.white,
      //                   borderRadius: BorderRadius.circular(20),
      //                   border: _selectedIndex == movie
      //                       ? Border.all(color: Colors.blue.shade500, width: 3)
      //                       : null,
      //                   boxShadow: _selectedIndex == movie
      //                       ? [
      //                           BoxShadow(
      //                               color: Colors.blue.shade100,
      //                               blurRadius: 30,
      //                               offset: const Offset(0, 10))
      //                         ]
      //                       : [
      //                           BoxShadow(
      //                               color: Colors.grey.withOpacity(0.2),
      //                               blurRadius: 20,
      //                               offset: const Offset(0, 5))
      //                         ],
      //                 ),
      //                 child: SingleChildScrollView(
      //                   child: Column(
      //                     children: [
      //                       Container(
      //                         height: 320,
      //                         margin: const EdgeInsets.only(top: 10),
      //                         clipBehavior: Clip.hardEdge,
      //                         decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(20),
      //                         ),
      //                         child: Image.network(movie['image'],
      //                             fit: BoxFit.cover),
      //                       ),
      //                       const SizedBox(
      //                         height: 20,
      //                       ),
      //                       Text(
      //                         movie['title'],
      //                         style: const TextStyle(
      //                             fontSize: 16, fontWeight: FontWeight.bold),
      //                       ),
      //                       const SizedBox(
      //                         height: 20,
      //                       ),
      //                       Text(
      //                         movie['description'],
      //                         style: TextStyle(
      //                             fontSize: 14, color: Colors.grey.shade600),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             );
      //           },
      //         );
      //       }).toList()),
      // ),
      body: const Center(child: Text("Coming Soon")),
    );
  }
}
