// ignore_for_file: unused_local_variable, depend_on_referenced_packages

import 'package:google_fonts/google_fonts.dart';
import 'package:smart_batching/providers/job_provider.dart';
import 'package:smart_batching/screens/job_details_screen.dart';
import 'package:smart_batching/services/firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDisplayCard extends StatefulWidget {
  const ProductDisplayCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final QueryDocumentSnapshot<Object?> data;

  @override
  State<ProductDisplayCard> createState() => _ProductDisplayCardState();
}

class _ProductDisplayCardState extends State<ProductDisplayCard> {
  FirebaseService service = FirebaseService();


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);
    return InkWell(
      onTap: () {
        provider.getProductDetails(widget.data);
        Navigator.pushNamed(context, JobDetailsScreen.id);
      },
      child: Container(
        width: 280,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black26,
          ),
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                widget.data['vehicleType'],
                style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
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
                      widget.data['from'],
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
                    widget.data['to'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      "Cost : ${widget.data['cost']}",
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
            height: MediaQuery.of(context).size.height * 0.01325,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      "Vehicle Number : ${widget.data['vehicleNumber']}",
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
            height: MediaQuery.of(context).size.height * 0.01325,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      "Boarding Time : ${widget.data['boardingTime']}",
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
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
