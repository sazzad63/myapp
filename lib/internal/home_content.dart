import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:dio/dio.dart';
import 'package:myapp/internal/photo_update.dart';
import 'package:myapp/internal/user_details.dart';


class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {

  late Future<List> users;

  Future<List> getUsers() async {
    var response = await Dio().get('https://jsonplaceholder.typicode.com/users');
    return response.data;
  }

  @override
  void initState(){
    users= getUsers() ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 0, top: 10),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 15
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                    size: 26,
                    color: Colors.black54,
                  ),
                  filled: true,
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (String str){
                  //
                },
              ),
            ),

            const SizedBox(height: 10,),

            Expanded(
              child: FutureBuilder<List>(
                future: users,
                builder: (BuildContext context, AsyncSnapshot<List> snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              leading: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: Colors.black26),
                                    borderRadius: BorderRadius.circular(100.0)
                                ),
                                child: GestureDetector(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image.asset("assets/images/user_icon.png"),
                                  ),
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const PhotoUpdate(),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              title: GestureDetector(
                                child: Text(
                                  snapshot.data?[index]['name'],
                                  style: const TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.blue
                                ),
                                ),
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const UserDetails(),
                                        settings: RouteSettings(
                                          arguments: snapshot.data?[index]['name'],
                                        )
                                    ),
                                  );
                                },
                              ),

                              subtitle: const Text("2006"),

                              trailing: GestureDetector(
                                child: const Icon(Icons.phone,),
                                onTap: () {
                                  FlutterPhoneDirectCaller.callNumber(snapshot.data?[index]['phone']);
                                },
                              ),
                            ),
                          );
                        }
                    );
                  }else{
                    return const Center(child: Text("Loading ..."));
                  }
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

}
