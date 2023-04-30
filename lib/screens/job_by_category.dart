import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_batching/constants/colors.dart';
import 'package:smart_batching/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:smart_batching/services/firebase_services.dart';
import 'package:smart_batching/widgets/job_display_card.dart';
import 'package:provider/provider.dart';

class ProductByCategory extends StatelessWidget {
  const ProductByCategory({super.key});
  static const String id = "product-by-category-screen";

  @override
  Widget build(BuildContext context) {
    FirebaseService service = FirebaseService();
    var catProvider = Provider.of<CategoryProvider>(context);

    return Scaffold(
      backgroundColor: kscreenBackground,
      appBar: AppBar(
        backgroundColor: kscreenBackground,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.black54,
        ),
        title: Text(
          catProvider.selectedCategory.toString(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              12,
              8,
              12,
              8,
            ),
            child: FutureBuilder<QuerySnapshot>(
              future: service.products
                  .where(
                    "category",
                    isEqualTo: catProvider.selectedCategory,
                  )
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 140.0,
                      right: 140.0,
                    ),
                    child: Center(
                      child: LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor,
                        ),
                        color: Colors.grey.shade100,
                      ),
                    ),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'New Recommendations',
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
                        var data = snapshot.data!.docs[index];
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
      ),
    );
  }
}
