import 'package:classroom/widget/reusable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class PlacementsPage extends StatefulWidget {
  const PlacementsPage({super.key});

  @override
  State<PlacementsPage> createState() => _PlacementsPageState();
}

class _PlacementsPageState extends State<PlacementsPage> {

  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phn = TextEditingController();
  final _email = TextEditingController();
  final _otherDetails = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Placement")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Theme.of(context).primaryColor),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Text(
                        "Add a Placement Notification",
                        style: GoogleFonts.roboto(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Padding(
                        padding: const EdgeInsets.only(left: 18, right: 18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: GoogleFonts.roboto(
                                  fontSize: 15, color: Colors.grey),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015,
                            ),
                            SizedBox(
                              height: 85,
                              child: TextFormField(
                                controller: _name,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(15.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                ),
                                validator:(val){
                                  if (val!.trim().length < 2) {
                                    return 'Enter a valid Project Name';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015,
                            ),
                            Text(
                              "Link to Apply",
                              style: GoogleFonts.roboto(
                                  fontSize: 15, color: Colors.grey),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015,
                            ),
                            SizedBox(
                              height: 85,
                              child: TextFormField(
                                controller: _email,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(15.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                ),
                                validator: (val) {
                                  if (val!.trim().length < 2) {
                                    return 'Enter a valid Project Name';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Text(
                              'Last Date to Apply',
                              style: GoogleFonts.roboto(
                                  fontSize: 15, color: Colors.grey),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015,
                            ),
                            TextFormField(
                              maxLines: 1,
                              controller: _otherDetails,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(15.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                errorMaxLines: 2,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.020,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                SizedBox(
                  width: 160,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 6,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Submit",
                      style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        
),
bottomNavigationBar: bottomNavBar(context),
);
  }
}