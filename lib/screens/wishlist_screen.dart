// ignore_for_file: depend_on_referenced_packages

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:smart_batching/constants/colors.dart';
import 'package:smart_batching/services/firebase_services.dart';
import 'package:smart_batching/widgets/job_display_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});
  static const String id = "wishlist-screen";

  @override
  Widget build(BuildContext context) {
    FirebaseService service = FirebaseService();

    return DoubleBackToCloseApp(
      snackBar: const SnackBar(
        content: Text(
          'Press back again to Exit',
        ),
      ),
      child: Scaffold(
        backgroundColor: kscreenBackground,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kscreenBackground,
          elevation: 0.0,
          title: Text(
            'Wishlist',
            style: GoogleFonts.raleway(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              12,
              8,
              12,
              8,
            ),
            child: StreamBuilder<QuerySnapshot>(
              stream: service.products
                  .where("favourites", arrayContains: service.user!.uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text(
                    'Something went wrong',
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  // return Padding(
                  //   padding: const EdgeInsets.only(
                  //     left: 140.0,
                  //     right: 140.0,
                  //   ),
                  //   child: Center(
                  //     child: LinearProgressIndicator(
                  //       valueColor: AlwaysStoppedAnimation<Color>(
                  //         Theme.of(context).primaryColor,
                  //       ),
                  //       color: Colors.grey.shade100,
                  //     ),
                  //   ),
                  // );
                  return Center(
                    child: Image.asset(
                      "assets/loading.gif",
                    ),
                  );
                }

                if (snapshot.data!.docs.isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 56,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'My Favourites',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          // shrinkWrap: true,
                          // physics: const ScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 450,
                            childAspectRatio: 3.5 / 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: snapshot.data!.size,
                          itemBuilder: (BuildContext context, int index) {
                            var data = snapshot.data!.docs[index];
                            // Display Card:
                            return ProductDisplayCard(
                              data: data,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text(
                      "Your Favourite list is Empty",
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
