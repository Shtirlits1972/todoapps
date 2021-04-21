//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/bottom_button.dart';
import 'data/data.dart';
import 'screens/add_new_item.dart';
import 'screens/homePage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
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

// class AddNewItemButton extends StatefulWidget {
//   const AddNewItemButton({
//     Key key,
//   }) : super(key: key);

//   @override
//   _AddNewItemButtonState createState() => _AddNewItemButtonState();
// }

// class _AddNewItemButtonState extends State<AddNewItemButton> {
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       style: ButtonStyle(),
//       onPressed: () async {
//         print('Add New Item');
//         final String newItem = await Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => AddnewItem(args: 'data 2')),
//         );
//         ScaffoldMessenger.of(context)
//           ..removeCurrentSnackBar()
//           ..showSnackBar(SnackBar(content: Text("$newItem")));
//         print(newItem);
//       },
//       child: Container(
//         width: double.infinity,
//         height: 150,
//         decoration: BoxDecoration(
//           color: Colors.orange,
//           shape: BoxShape.rectangle,
//           borderRadius: BorderRadius.all(Radius.circular(15.0)),
//         ),
//         child: Center(
//           child: Text(
//             'Add New Item',
//             style: TextStyle(
//                 fontWeight: FontWeight.w500, color: Colors.black, fontSize: 30),
//           ),
//         ),
//       ),
//     );
//   }
// }
