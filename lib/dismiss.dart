import 'package:flutter/material.dart';

class dismiss extends StatefulWidget {
  int index;
  List<String> NameList = [];
  List<String> EventList = [];
  List<String> PaymentList = [];
  List<String> CalcNameList;
  List<String> CalcPayList;
  Function justCallback;

  dismiss(this.NameList, this.EventList, this.PaymentList, this.index,
      this.CalcNameList, this.CalcPayList, this.justCallback);

  @override
  _dismissState createState() => _dismissState();
}

class _dismissState extends State<dismiss> {

  Function delCalc(number) {
    String _name = widget.NameList[number];
    String _pay = widget.PaymentList[number];
    List _calname = widget.CalcNameList;
    List _calpay = widget.CalcPayList;

    for (int i = 0; i < _calname.length; i++) {
      if (_calname[i] == _name) {
        if (_calpay[i] == _pay) {
          _calname.removeAt ( i );
          _calpay.removeAt ( i );
          print ( 'success' );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(color: Colors.red),
      key: ObjectKey(widget.EventList[widget.index]),
      onDismissed: (direction) {
        delCalc(widget.index);
        setState(() {
          widget.NameList.removeAt(widget.index);
          widget.EventList.removeAt(widget.index);
          widget.PaymentList.removeAt(widget.index);
          widget.justCallback();
        });
      },
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
    );
  }
}
