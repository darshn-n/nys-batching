// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:smart_batching/constants/colors.dart';
import 'package:smart_batching/screens/main_screen.dart';
import 'package:smart_batching/services/firebase_services.dart';
import 'package:smart_batching/widgets/alert_dialog_box.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';

class LocationScreen extends StatefulWidget {
  static const id = "location-screen";
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Location location = Location();
  final FirebaseService _service = FirebaseService();

  String? countryValue = "";
  String? stateValue = "";
  String? cityValue = "";
  String? manualAddress;

  @override
  Widget build(BuildContext context) {
    showBottomScreen(context) {
      showAlertDialog(context);
      showModalBottomSheet(
        isScrollControlled: true,
        enableDrag: true,
        context: context,
        builder: (context) {
          return Column(
            children: [
              const SizedBox(
                height: 30.0,
              ),
              SafeArea(
                child: AppBar(
                  automaticallyImplyLeading: false,
                  iconTheme: const IconThemeData(color: Colors.black),
                  elevation: 0,
                  backgroundColor: kscreenBackground,
                  title: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.clear_outlined),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        'Location',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // ListTile(),
              const SizedBox(
                height: 20.0,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'CHOOSE YOUR LOCATION',
                style: GoogleFonts.bebasNeue(
                  color: Colors.blueGrey.shade900,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: CSCPicker(
                  layout: Layout.vertical,
                  dropdownDecoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  defaultCountry: CscCountry.India,
                  onCountryChanged: (value) {
                    setState(
                      () {
                        countryValue = value;
                      },
                    );
                  },
                  onStateChanged: (value) {
                    setState(
                      () {
                        stateValue = value ?? "";
                      },
                    );
                  },
                  onCityChanged: (value) {
                    setState(
                      () {
                        cityValue = value ?? "";
                        setState(
                          () {
                            manualAddress =
                                "$cityValue, $stateValue, $countryValue";
                          },
                        );
                        if (value != null) {
                          _service.updateUser({
                            "address": manualAddress,
                            "state": stateValue,
                            "city": cityValue,
                            "country": countryValue,
                          }, context).then(
                            (value) =>
                                Navigator.pushNamed(context, MainScreen.id),
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      );
    }

    // UI

    return Scaffold(
      backgroundColor: kscreenBackground,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SafeArea(
            child: Image.asset(
              "assets/location_bg.jpg",
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            'Set your Location',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: NeumorphicButton(
              style: const NeumorphicStyle(
                color: Colors.cyan,
              ),
              onPressed: () {
                if (ConnectionState == ConnectionState.waiting) {
                  showAlertDialog(context);
                }
                showBottomScreen(context);
              },
              child: Text(
                'Set Location Manually',
                style: GoogleFonts.raleway(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 290.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_outline_rounded,
                color: kprivacyPolicy,
              ),
              const SizedBox(
                width: 6.0,
              ),
              Text(
                "End to End Encrypted",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: kprivacyPolicy,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
