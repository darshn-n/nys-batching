import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_batching/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _resumeLink = Uri.parse('https://flowcv.com/');
final Uri _aboutResumeLink = Uri.parse('https://flowcv.com/about');
final Uri _resumeInstructions = Uri.parse('https://youtu.be/pgCQ1US4Bis');

class AddResumeScreen extends StatefulWidget {
  const AddResumeScreen({Key? key}) : super(key: key);
    static const String id = "ads-screen";

  @override
  State<AddResumeScreen> createState() => _AddResumeScreenState();
}

class _AddResumeScreenState extends State<AddResumeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f6f9),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: kscreenBackground,
        elevation: 0.0,
        title: Text(
          'Create Your Resume',
          style: GoogleFonts.raleway(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/resume_img.png",
                  width: 200,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                _launchUrl(_resumeLink);
              },
              child: const Text(
                "Build Your Resume",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "An excellent resume has the power to open doors. Grabs the attention of the recruiters.",
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                " Sells your strongest skills and accomplishments. Shows how you're a match for a position or project. And most importantly, gets you a job interview!",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Learn more about creating a resume by clicking the button below.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                _launchUrl(_resumeInstructions);
              },
              child: const Text(
                "FlowCV Instructions",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: () {
                _launchUrl(_aboutResumeLink);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.info_outline,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "About Flow CV",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _launchUrl(url) async {
  if (!await launchUrl(url)) throw 'Could not launch $url';
}
