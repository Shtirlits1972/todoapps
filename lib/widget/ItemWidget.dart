import 'package:flutter/material.dart';
import 'package:todoapps/constants.dart';
import 'package:todoapps/model/ItemData.dart';
import 'package:todoapps/screens/detailed_screen.dart';

class TileItemWidget extends StatefulWidget {
  final ItemData itemData;

  TileItemWidget({Key key, this.itemData}) : super(key: key);

  @override
  _TileItemWidgetState createState() => _TileItemWidgetState(itemData);
}

class _TileItemWidgetState extends State<TileItemWidget> {
  final ItemData itemData;

  _TileItemWidgetState(this.itemData);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailedScreen(itemText: itemData.title)),
        );
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) =>
        //             DetailedScreen(itemText: itemData.title)));
      },
      child: Hero(
        tag: 'flippers',
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                  value: itemData.isChecked,
                  onChanged: (bool newState) {
                    setState(() {
                      itemData.isChecked = newState;
                    });
                    print(itemData.title + ' : $newState');
                  }),
              CircleAvatar(
                backgroundImage:
                    AssetImage(constansts.imagePath + itemData.image),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedDefaultTextStyle(
                  child: Text(itemData.title),
                  style: itemData.isChecked
                      ? TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationStyle: TextDecorationStyle.dashed,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                          fontSize: 18,
                        )
                      : TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                  duration: Duration(milliseconds: 200),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
