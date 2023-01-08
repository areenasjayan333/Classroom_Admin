import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:file_picker/file_picker.dart';

class ClassPage extends StatefulWidget {
  static const routeName = '/classpage';
  const ClassPage({super.key});

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _languageOther = TextEditingController();
  final _otherDetails = TextEditingController();

  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedFile;
  bool isLoading = false;
  File? fileToDisplay;

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null) {
        _fileName = result!.files.first.name;
        pickedFile = result!.files.first;
        fileToDisplay = File(pickedFile!.path.toString());

        print("File name : $_fileName");
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Class X')),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Text(
                    'Share to your Class',
                    style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title',
                    style: GoogleFonts.roboto(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
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
                    height: 25,
                  ),
                  Text(
                    'Description',
                    style: GoogleFonts.roboto(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  TextFormField(
                    maxLines: 3,
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
                    height: 30,
                  ),
                ],
              ),
              isLoading == true
                  ? Center(child: CircularProgressIndicator())
                  : pickedFile != null
                      ? result!.files.first.extension.toString() != 'pdf'
                          ? Center(
                              child: InkWell(
                                onTap: pickFile,
                                child: Container(
                                    height: 200,
                                    width: 300,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff7c94b6),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Image.file(
                                      fileToDisplay!,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            )
                          : InkWell(
                            onTap: pickFile,
                            child: Container(
                             
                                      
                                height: 200,
                                width: 300,
                                child: Icon(
                                  Icons.picture_as_pdf,
                                  size: 70,
                                  color: Colors.red,
                                ),
                                decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0,
                                    ),
                                  ],
                                ),
                              ),
                          )
                      : InkWell(
                          onTap: pickFile,
                          child: DottedBorder(
                            color: Colors.grey,
                            radius: const Radius.circular(12.0),
                            borderType: BorderType.RRect,
                            padding: const EdgeInsets.only(
                                left: 80, right: 80, top: 40, bottom: 40),
                            child: const Icon(
                              Icons.cloud_upload_outlined,
                              size: 60,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                         SizedBox(
                    height: 30,
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
                          onPressed: (() {} ),
                          child: Text(
                            "Submit",
                            style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),),),
            ],
          ),
        ));

    //                 if (pickedFile != null )
    //                   result!.files.first.extension.toString() != 'pdf'
    //                         ? SizedBox(child: Image.file(fileToDisplay!),height: 300,width: 300,)
    //                         : Container(
    //                           height: 200,
    //                           width: 200,
    //                             child: Icon(
    //                               Icons.picture_as_pdf,
    //                               size: 70,
    //                               color: Colors.red,
    //                             ),
    //                              decoration: const BoxDecoration(
    //                               color: Colors.white,
    //   boxShadow: [
    //     BoxShadow(
    //       color: Colors.black12,
    //       blurRadius: 5.0,
    //       ),

    //   ],
    // ),
    //                           ),

    //               ],
    //             ));
  }
}
