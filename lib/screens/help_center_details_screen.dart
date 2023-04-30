// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

// class HelpCenterDetailsScreen extends StatefulWidget {
//   const HelpCenterDetailsScreen({super.key});
//   static const String id = "help-center-details-screen";

//   @override
//   State<HelpCenterDetailsScreen> createState() =>
//       _HelpCenterDetailsScreenState();
// }

// class _HelpCenterDetailsScreenState extends State<HelpCenterDetailsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kscreenBackground,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: kscreenBackground,
//         elevation: 0.0,
//         title: Text(
//           'My Account',
//           style: GoogleFonts.raleway(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: const Center(
//         child: Text(
//           'Hi',
//         ),
//       ),
//     );
//   }
// }

import 'package:animate_do/animate_do.dart';
import 'package:smart_batching/constants/colors.dart';

class HelpCenterDetailsScreen extends StatefulWidget {
  const HelpCenterDetailsScreen({Key? key, required this.products})
      : super(key: key);
  static const String id = "help-center-details-screen";
  final List<dynamic> products;
  @override
  _HelpCenterDetailsScreenState createState() =>
      _HelpCenterDetailsScreenState();
}

class _HelpCenterDetailsScreenState extends State<HelpCenterDetailsScreen> {
  final int _current = 0;
  // final dynamic _selectedIndex = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kscreenBackground,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 50),
            FadeInRight(
              duration: const Duration(milliseconds: 1500),
              child: Image.network(
                widget.products[_current]['image'],
                fit: BoxFit.cover,
              ),
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              delay: const Duration(milliseconds: 500),
              child: Container(
                padding: const EdgeInsets.only(
                    left: 50, top: 40, right: 20, bottom: 50),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffFFC3A6).withOpacity(0.5),
                      offset: const Offset(0, -5),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 1000),
                      from: 50,
                      child: const Text(
                        'Discover the best \norganic asian tea.🔥',
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 1000),
                      from: 60,
                      child: Text(
                        'Straight from motherland ⛰',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 1000),
                      from: 70,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {
                            // reload the page
                            Navigator.of(context).pushReplacementNamed('/');
                          },
                          child: const Text(
                            'EXPLORE NOW ☕️',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
