
import 'package:smart_batching/services/firebase_services.dart';
import 'package:smart_batching/widgets/job_display_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class JobList extends StatelessWidget {
  const JobList({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseService service = FirebaseService();

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          top: 8,
          right: 12,
        ),
        child: FutureBuilder<QuerySnapshot>(
          future: service.products.get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
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
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 450,
                    childAspectRatio: 3.5 / 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: snapshot.data!.size,
                  itemBuilder: (BuildContext context, int index) {
                    var data = snapshot.data!.docs[index]; // For help Center
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
    );
  }
}
