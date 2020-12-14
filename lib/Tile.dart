import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Tile extends StatefulWidget {
  int index;
  List<String> NameList = [];
  List<String> EventList = [];
  List<String> PaymentList = [];

  Function(dynamic, dynamic, dynamic) callback;
  Function(int) callbackRemove;
  Function() sumPaymentList;

  Tile(this.NameList, this.EventList, this.PaymentList, this.index);

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.20,
      child: Container(
        color: Colors.white,
        child: ListTile(
            leading: Container(
              width: 150.0,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  widget.NameList[widget.index],
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            title: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  widget.EventList[widget.index],
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                )),
            subtitle: Text(
              (widget.PaymentList[widget.index]),
              style: TextStyle(
                fontSize: 20.0,
              ),
            )),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
            color: Colors.red,
            iconWidget: Text(
              "削除",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => {widget.callbackRemove(widget.index)}
            //_showSnackbar('Delete'),
            ),
      ],
    );
  }
}
