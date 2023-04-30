// ignore_for_file: depend_on_referenced_packages

import 'package:google_fonts/google_fonts.dart';
import 'package:smart_batching/providers/job_provider.dart';
import 'package:smart_batching/screens/job_details_screen.dart';
import 'package:smart_batching/screens/job_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:search_page/search_page.dart';

class Products {
  final String title, description, salary, category, location, company;
  final DocumentSnapshot document;

  const Products({
    required this.title,
    required this.salary,
    required this.description,
    required this.category,
    required this.location,
    required this.document,
    required this.company,
  });
}

class SearchService {
  search({context, productList, provider}) {
    showSearch(
      context: context,
      delegate: SearchPage<Products>(
        barTheme: ThemeData(
          scaffoldBackgroundColor: const Color(0xfffffeff),
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
        ),
        searchStyle: GoogleFonts.lato(
          fontSize: 20,
        ),
        onQueryUpdate: print,
        items: productList,
        searchLabel: 'Search Jobs',
        suggestion: const SingleChildScrollView(
          child: JobList(),
        ),
        failure: Center(
          child: Image.asset(
            "assets/sorrySearch.jpg",
          ),
        ),
        filter: (product) => [
          product.title,
          product.description,
          product.category,
          product.location,
          product.company,
          product.salary,
        ],
        builder: (product) {
          var provider = Provider.of<ProductProvider>(context);

          return InkWell(
            onTap: () {
              provider.getProductDetails(product.document);
              Navigator.pushNamed(context, JobDetailsScreen.id);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 270,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black26,
                  ),
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                // widget.data['company'],
                                product.salary,
                                style: GoogleFonts.lato(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          // widget.data['title'],
                          "Cost: ${product.title}",
                          maxLines: 3,

                          style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            const Text(
                              'From: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Icon(
                              Icons.location_on_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Flexible(
                              child: Text(
                                product.location,
                                maxLines: 4,
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Text(
                              '  To  ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              product.description,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Flexible(
                          child: Text(
                            // "Salary : ${widget.data['salary']}",
                            "Boarding Time : ${product.title}",
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
