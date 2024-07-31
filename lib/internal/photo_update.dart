import 'package:flutter/material.dart';
// import 'package:myapp/internal/TakePictureScreen.dart';

class PhotoUpdate extends StatelessWidget {
  const PhotoUpdate({super.key});

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
                          const BorderRadius.all(Radius.circular(100)),
                      border: Border.all(
                        width: 3,
                        color: Colors.black12,
                      )),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/sazzad.jpeg'),
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
                      //
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 50),
                        elevation: 5,
                        backgroundColor: Colors.blueGrey,
                        foregroundColor: Colors.white),
                    child: const Text(
                      "Camera",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 50),
                        elevation: 5,
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white),
                    child: const Text(
                      "Gallery",
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
}
