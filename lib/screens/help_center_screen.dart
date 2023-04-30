
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:smart_batching/constants/colors.dart';
import 'package:smart_batching/screens/success_screen.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);
  static const String id = "help-center-screen";

  @override
  _HelpCenterScreenState createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _numberOfSeatsController = TextEditingController();
  final _costController = TextEditingController();
  final _vehicleNumberController = TextEditingController();
  final _fromController = TextEditingController();
  final _toController = TextEditingController();
  final _boardingTimeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kscreenBackground,
      appBar: AppBar(
        backgroundColor: kscreenBackground,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.black54,
        ),
        title: const Text(
          "Add your Vehicle",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    controller: _numberOfSeatsController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Name*",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter the required Field";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _vehicleNumberController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Phone Number*",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter the required Field";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _boardingTimeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Vehicle Number*",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter the required Field";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _fromController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Vehicle Type*",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "From?";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _toController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Number of Seats*",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "To?";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _costController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "RTO Details*",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Cost?";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SizedBox(
                    height: 80.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomSheet: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: NeumorphicButton(
                style: NeumorphicStyle(
                  color: Theme.of(context).primaryColor,
                ),
                child: const Text(
                  "Register",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, SuccessScreen.id);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
