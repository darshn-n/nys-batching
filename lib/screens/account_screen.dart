import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_batching/constants/colors.dart';
import 'package:smart_batching/screens/help_center_screen.dart';
import 'package:smart_batching/screens/location_screen.dart';
import 'package:smart_batching/widgets/account_menu.dart';
import 'package:smart_batching/widgets/logout_alert.dart';
import 'package:url_launcher/url_launcher.dart';

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

final Uri _reportBugs = Uri(
  scheme: 'mailto',
  path: 'darshan51081@gmail.com',
  query: encodeQueryParameters(
    <String, String>{
      'subject':
          'Bug Reporting by ${FirebaseAuth.instance.currentUser!.displayName}',
    },
  ),
);
final Uri _privacyPolicy = Uri.parse(
  "https://darshn-n.github.io/Privacy-Policy/",
);

const String googleSVG = "assets/google.svg";

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);
  static const String id = "account-screen";

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return DoubleBackToCloseApp(
      snackBar: const SnackBar(
        content: Text(
          'Press back again to Exit',
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color(0xfff5f6f9),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kscreenBackground,
          elevation: 0.0,
          title: Text(
            'My Account',
            style: GoogleFonts.raleway(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                    left: 25,
                    right: 25,
                  ),
                ),
                ClipOval(
                  child: Image.network(
                    FirebaseAuth.instance.currentUser!.photoURL!,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "${FirebaseAuth.instance.currentUser!.displayName}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(
                      0xff050609,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      FontAwesomeIcons.google,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${FirebaseAuth.instance.currentUser!.email}",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                AccountMenu(
                  accountButtonIcon: Icons.app_registration_outlined,
                  accountButtonText: 'Register My Vehicle',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HelpCenterScreen(),
                      ),
                    );
                  },
                ),
                AccountMenu(
                  accountButtonIcon: Icons.verified_user_outlined,
                  accountButtonText: 'Privacy Policy',
                  onPressed: () {},
                ),
                AccountMenu(
                  accountButtonIcon: Icons.bug_report_outlined,
                  accountButtonText: 'Report a Bug',
                  onPressed: () {
                    _launchUrl(_reportBugs);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LocationScreen.id);
                  },
                  child: const Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const LogoutAlert(),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Launch :

void _launchUrl(url) async {
  if (!await launchUrl(url)) throw 'Could not launch $url';
}
