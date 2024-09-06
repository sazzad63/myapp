import 'package:flutter/material.dart';
import 'package:myapp/internal/photo_update.dart';
import 'package:myapp/internal/home_content.dart';
import '../main.dart';
import 'activities.dart';

int _selectedTab=0;
var  _bottomMenuPages = [const HomeContent(), const Activities()];

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            elevation: 50,
            title: const Center(
              child: Text(
                "Modhupur Secondary School",
                style: TextStyle(
                  fontSize: 18,
                    color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            iconTheme: const IconThemeData(color: Colors.white),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children: [
                        Icon(Icons.settings, color: Colors.black,),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Setting"),
                      ],
                    ),
                  ),

                  const PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children: [
                        Icon(Icons.logout, color: Colors.black,),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Logout"),
                      ],
                    ),
                  )
                ],
                onSelected: (item) => selectedItem(context, item),
              )
            ],
          ),

          
          body: Center(
            child: _bottomMenuPages[_selectedTab],
          ),

          // start drawer menu list
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 100, 100, 1.0),
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: const SizedBox(
                          height: 95,
                          width: 95,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/user_icon.png"),
                            child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.white70,
                                      child: Icon(Icons.camera_alt),
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PhotoUpdate(),
                                maintainState: false),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Md. Sazzad Hossain",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                      )
                    ],
                  ),
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.supervised_user_circle),
                      SizedBox(
                        width: 10,
                      ),
                      Text("My Teammates",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Dashboard(),
                          maintainState: false),
                    );
                  },
                ),

                const Divider(),

                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.info),
                      SizedBox(
                        width: 10,
                      ),
                      Text("About Community",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Dashboard(),
                          maintainState: false),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.logout),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Logout",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyApp(),
                          maintainState: false),
                    );
                  },
                ),
              ],
            ),
          ),

          bottomNavigationBar: BottomNavigationBar(
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            backgroundColor: Colors.white70,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home"
              ),

              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list_alt,
                  ),
                  label: "Activities",
              )
            ],
            currentIndex: _selectedTab,
            onTap: (setValue){
              setState(() {
                _selectedTab=setValue;
              });
            },
          ),
        ),
      ),
    );
  }
}





selectedItem(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MyApp(), maintainState: false),
      );
      break;
  }
}
