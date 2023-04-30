// ignore_for_file: must_be_immutable, import_of_legacy_library_into_null_safe

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_batching/constants/colors.dart';
import 'package:smart_batching/screens/job_list.dart';
import 'package:smart_batching/widgets/my_app_bar.dart';
import 'package:smart_batching/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:smart_batching/widgets/my_carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

final Uri _internSubmission = Uri(
  scheme: 'mailto',
  path: 'darshan51081@gmail.com',
  query: encodeQueryParameters(
    <String, String>{
      'subject':
          'Bug Reporting by ${FirebaseAuth.instance.currentUser!.displayName}',
    },
  ),
);

class HomeScreen extends StatefulWidget {
  static const String id = "home-screen";

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DoubleBackToCloseApp(
      snackBar: const SnackBar(
        content: Text(
          'Press back again to Exit',
        ),
      ),
      child: Scaffold(
        backgroundColor: kscreenBackground,
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SafeArea(
                child: MyAppBar(
                  title: greeting(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      children: const [
                        Carousel(),
                        SizedBox(
                          height: 20.0,
                        ),

                        // Categories:
                        Categories(),

                        // Products Display
                        JobList(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Greet:

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12 && hour > 5) {
    return 'Good Morning';
  }
  if (hour < 17) {
    return 'Good Afternoon';
  }

  return 'Good Evening';
}

// Launch :

void _launchUrl(url) async {
  if (!await launchUrl(url)) throw 'Could not launch $url';
}
