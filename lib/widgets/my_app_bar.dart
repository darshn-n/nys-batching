// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_batching/constants/colors.dart';
import 'package:smart_batching/widgets/account_bottom_sheet.dart';

class MyAppBar extends StatelessWidget {
  final String title;

  const MyAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 2,
              style: GoogleFonts.bebasNeue(
                fontSize: 60,
              ),
            ),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              showModalBottomSheet<void>(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(
                      15.0,
                    ),
                  ),
                ),
                backgroundColor: kscreenBackground,
                context: context,
                builder: (BuildContext context) {
                  return const AccountDropDown();
                },
              );
            },
            child: ClipOval(
              child: Image.network(
                FirebaseAuth.instance.currentUser!.photoURL!,
                width: 50,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
