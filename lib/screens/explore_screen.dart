// ignore_for_file: depend_on_referenced_packages

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_batching/constants/colors.dart';
import 'package:smart_batching/providers/job_provider.dart';
import 'package:smart_batching/services/firebase_services.dart';
import 'package:smart_batching/services/search_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_batching/widgets/job_display_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});
  static const String id = "explore-screen";

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  FirebaseService service = FirebaseService();
  SearchService search = SearchService();

  static List<Products> products = [];
  @override
  void initState() {
    service.products.get().then(
      (QuerySnapshot snapshot) {
        for (var doc in snapshot.docs) {
          setState(
            () {
              products.add(
                Products(
                  title: doc['boardingTime'],
                  location: doc['from'],
                  description: doc['to'],
                  salary: doc['vehicleType'],
                  company: doc['cost'],
                  category: doc['numberOfSeats'],
                  document: doc,
                ),
              );
            },
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);
    FirebaseService service = FirebaseService();


    return Scaffold(
      backgroundColor: kscreenBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kscreenBackground,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.black54,
        ),
        title: const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            "Explore",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text(
            'Press back again to Exit',
          ),
        ),
        child: FutureBuilder<QuerySnapshot>(
          future: service.products.get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Image.asset(
                  "assets/loading.gif",
                ),
              );
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    color: kscreenBackground,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                search.search(
                                  context: context,
                                  productList: products,
                                  provider: provider,
                                );
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  height: 40,
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      const Icon(
                                        Icons.search,
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      Text(
                                        'Search',
                                        style: GoogleFonts.raleway(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 200.0,
                                      ),
                                      Icon(
                                        Icons.keyboard_outlined,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        top: 8,
                        right: 12,
                      ),
                      child: FutureBuilder<QuerySnapshot>(
                        future: service.products.get(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return const Text('Something went wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 140.0,
                                right: 140.0,
                              ),
                              child: LinearProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).primaryColor,
                                ),
                                color: Colors.grey.shade100,
                              ),
                            );
                          }

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 40,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Explore',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 450,
                                  childAspectRatio: 3.5 / 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 10,
                                ),
                                itemCount: snapshot.data!.size,
                                itemBuilder: (BuildContext context, int index) {
                                  var data = snapshot
                                      .data!.docs[index]; // For help Center
                                  // Display Card:
                                  return ProductDisplayCard(
                                    data: data,
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
