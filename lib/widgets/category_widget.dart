import 'package:animations/animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_batching/constants/colors.dart';
import 'package:smart_batching/providers/category_provider.dart';
import 'package:smart_batching/screens/categories/category_list.dart';
import 'package:smart_batching/screens/job_by_category.dart';
import 'package:smart_batching/services/firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseService service = FirebaseService();

    var catProvider = Provider.of<CategoryProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<QuerySnapshot>(
        future: service.categories.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Container();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          }

          return SizedBox(
            height: 105,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Categories",
                        style: GoogleFonts.raleway(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    OpenContainer(
                      closedColor: kscreenBackground,
                      closedElevation: 0,
                      closedBuilder:
                          (BuildContext _, VoidCallback openContainer) {
                        return Row(
                          children: [
                            Text(
                              "See All",
                              style: GoogleFonts.raleway(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_right_outlined,
                              size: 25,
                              color: Colors.deepOrangeAccent,
                            ),
                          ],
                        );
                      },
                      openBuilder:
                          (BuildContext _, VoidCallback openContainer) {
                        return const CategoryListScreen();
                      },
                    ),
                  ],
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      var doc = snapshot.data!.docs[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            catProvider.getCategory(
                              doc['catName'],
                            );
                            catProvider.getCatSnapshot(doc);
                            // Product by category
                            Navigator.pushNamed(
                              context,
                              ProductByCategory.id,
                              arguments: doc,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              bottom: 10,
                              right: 10,
                            ),
                            child: Container(
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Theme.of(context).scaffoldBackgroundColor,
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Flexible(
                                    child: Center(
                                      child: Text(
                                        doc['catName'],
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.nunito(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
