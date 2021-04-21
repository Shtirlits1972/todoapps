import 'package:flutter/material.dart';


class AddnewItem extends StatelessWidget {
  const AddnewItem({Key key, this.args}) : super(key: key);

      final String args;
  @override
  Widget build(BuildContext context) {

    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('New Item'),),
      body: Container(color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText:  args,
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue.withOpacity(0.5), width: 3)),
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(onPressed: (){

                Navigator.pop(context, controller.text);

              }, child: Icon(Icons.save))
          ],
        ),
      ),
    );
  }
}