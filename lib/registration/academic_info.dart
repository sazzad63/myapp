import 'package:flutter/material.dart';
import 'package:myapp/registration/personal_info.dart';
import 'account_info.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

final _formKey = GlobalKey<FormState>();

List years = [
  {
    'id': '1',
    'name': '2010'
  },
  {
    'id': '2',
    'name': '2011'
  },
  {
    'id': '3',
    'name': '2012'
  }
];
String? yearId;

List departments = [
  {
    'id': '1',
    'name': 'Science'
  },
  {
    'id': '2',
    'name': 'Commerce'
  },
  {
    'id': '3',
    'name': 'Arts'
  }
];
String? department;

class AcademicInfo extends StatefulWidget {
  const AcademicInfo({super.key});

  @override
  State<AcademicInfo> createState() => _AcademicInfoState();
}

class _AcademicInfoState extends State<AcademicInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 50,),
                Image.asset(
                  "assets/images/cover.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 50,),
                const Text(
                  "Create New Account",
                  style: TextStyle(
                      fontSize: 22
                  ),
                ),

                const SizedBox(height: 5,),
                const Text("(Step 2 of 3)"),
                const SizedBox(height: 30,),

                DropdownButtonFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      // labelText: 'Select your SSC year'
                  ),
                  validator: Validators.compose([
                    Validators.required('Choose your SSC Passing Year'),
                  ]),
                  isExpanded: true,
                  hint: const Text('Select SSC Year'),
                  value: yearId,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: years.map((item) {
                    return DropdownMenuItem(
                      value: item['id'].toString(),
                      child: Text(item['name']),
                    );
                  }).toList(),
                  onChanged: (String? newYear) {
                    setState(() {
                      yearId = newYear;
                    });
                  },
                ),


                const SizedBox(height: 20,),


                DropdownButtonFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    // labelText: 'Select your SSC year'
                  ),
                  validator: Validators.compose([
                    Validators.required('Choose Department'),
                  ]),
                  isExpanded: true,
                  hint: const Text('Select Department'),
                  value: department,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: departments.map((item) {
                    return DropdownMenuItem(
                      value: item['id'].toString(),
                      child: Text(item['name']),
                    );
                  }).toList(),
                  onChanged: (String? newDept) {
                    setState(() {
                      department = newDept;
                    });
                  },
                ),


                const SizedBox(height: 50,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PersonalInfo(),
                              maintainState: false),
                        );
                      },
                      child: const Text("Back"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //   print("Success");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AccountInfo(),
                                maintainState: false),
                          );
                        }
                    },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(200, 50),
                          elevation: 5,
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white
                      ), child: const Text(
                        "Next",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
