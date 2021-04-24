import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/bottom_button.dart';
import 'data/data.dart';
import 'screens/add_new_item.dart';
import 'screens/homePage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Data())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.snackMessage}) : super(key: key);

  final String snackMessage;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //late final dynamic data;
  Future<dynamic> getData() async {
    final Stream<QuerySnapshot> document =
        _firestore.collection("todos_collection").snapshots();

    document.forEach((QuerySnapshot snapshot) async {
      snapshot.docs.forEach((DocumentSnapshot docs) async {
        Map<String, dynamic> list = docs.data();

        list.forEach((k, v) => print('key-> ${k}: value-> ${v}'));

       // print(list);
      });
    });

    print('');
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image/Group3.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    child: Center(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'TODOa',
                            speed: Duration(milliseconds: 300),
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                        isRepeatingAnimation: true,
                        //totalRepeatCount: 10,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15.0)),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.only(top: 100),
                    height: 50,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: buildList(context),
            ),
            Expanded(
              child: _buildBottomBar(context),
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildBottomBar(BuildContext context) {
  return BottomButton(
      title: 'Add Item',
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return Container(
              height: 220,
              color: Color(0xff757575),
              child: AddTaskPage(),
            );
          },
        );
      });
}
