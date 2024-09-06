import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class PhotoUpdate extends StatefulWidget {
  const PhotoUpdate({super.key});

  @override
  State<PhotoUpdate> createState() => _PhotoUpdateState();
}

class _PhotoUpdateState extends State<PhotoUpdate> {

  XFile? _imageFile;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: Colors.white,
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.teal,
            title: const Text(
              'Photo Upload',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(200)),
                      border: Border.all(
                        width: 2,
                        color: Colors.black12,
                      )),
                  child: CircleAvatar(
                    backgroundImage: _imageFile==null?
                    const AssetImage('assets/images/user_icon.png')
                        :FileImage(File(_imageFile!.path)),
                    radius: 100.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //print("open camera");
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context){
                            return SizedBox(
                              height: 200,

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton.icon(
                                    onPressed: (){
                                      takePhoto(ImageSource.camera);
                                    },
                                    icon: const Icon(
                                        Icons.camera_alt
                                    ),
                                    label: const Text("Camera"),
                                  ),

                                  TextButton.icon(
                                    onPressed: (){
                                      takePhoto(ImageSource.gallery);
                                    },
                                    icon: const Icon(
                                        Icons.image
                                    ),
                                    label: const Text("Gallery"),
                                  )
                                ],
                              )
                            );
                          }
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(250, 50),
                        elevation: 5,
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white),
                    child: const Text(
                      "Choose an Image",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void takePhoto(ImageSource source) async{
    final pickedFile = await _picker.pickImage(
      source: source,
    );

    setState(() {
      _imageFile = pickedFile;
      Navigator.of(context).pop();
    });
  }
}
