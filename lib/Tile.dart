import'package:flutter/material.dart';
import'package:flutter_slidable/flutter_slidable.dart';

class Tile extends StatefulWidget{
int index;
List<String>NameList=[];
List<String>EventList=[];
List<String>PaymentList=[];

Function(dynamic,dynamic,dynamic)callback;
Function()sumPaymentList;

Tile(this.NameList,this.EventList,this.PaymentList,this.index);
@override
_TileState createState()=>_TileState();
}

class _TileState extends State<Tile>{
@override
Widget build(BuildContextcontext){
  return Slidable(
    actionPane:SlidableDrawerActionPane(),
    actionExtentRatio:0.20,
    child:Container(
      color:Colors.white,
      child:ListTile(
        leading:Text(widget.NameList[widget.index]),
        title:Text(widget.EventList[widget.index]),
        subtitle:Text((widget.PaymentList[widget.index])),
        onTap:(){
          print(widget.NameList);
          print(widget.EventList);
        },
      ),
    ),

    secondaryActions:<Widget>[
      IconSlideAction(
          color:Colors.indigo,
          iconWidget:Text(
            "削除",
            style:TextStyle(color:Colors.white),
          ),
          onTap:()=>{}//_showSnackbar('Delete'),

      ),
    ],

  );
}
}
