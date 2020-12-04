import 'package:flutter/material.dart';


class addPayButton extends StatefulWidget {
  List<String> NameList = [];
  List<String> EventList = [];
  List<String> PaymentList = [];
  List<String> FriendList = [];
  List<String> CalcNameList;
  List<String> CalcPayList;
  Function(dynamic,dynamic,dynamic) callback;
  addPayButton(this.NameList,this.EventList,
                this.PaymentList,this.FriendList,
                this.callback,this.CalcNameList,
                this.CalcPayList);

  @override
  _addPayButtonState createState() => _addPayButtonState();
}

class _addPayButtonState extends State<addPayButton> {
  TextEditingController _eventController = TextEditingController();
  TextEditingController _paymentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String name;

  List<String> FriendList = [];

  callbackFriend(friend) {
    setState(() {
      FriendList.add(friend);
    });
  }
  String selected;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: "hero2",
        child: Icon(Icons.add),
        onPressed: (){
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                title: Center(
                  child: Text('支払いを追加'),
                ),
                content: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            DropdownButtonFormField<String>(
                              validator: (value) => value == null ? 'field required' : null,
                              value: selected,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                filled: true,
                                icon: Icon(Icons.person),
                                labelText: '要選択',
                              ),
                              items: widget.FriendList
                                  .map((label) => DropdownMenuItem(
                                child: Text(label),
                                value: label,
                              ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() => selected = value);
                              },
                            ),

                            TextFormField(
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                filled: true,
                                icon: Icon(Icons.event),
                                labelText:"イベント",
                              ),
                              controller: _eventController,
                            ),

                            TextFormField(
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                filled: true,
                                icon: Icon(Icons.money),
                                labelText:"金額",
                              ),
                              keyboardType: TextInputType.phone,
                              controller: _paymentController,
                            ),

//                            Row(
////                              children: [
////                                FlatButton(
////                                onPressed:() => Navigator.pop(context,'Cancel'),
////                                child: Text('Cancel')
////                                ),
////
////                                FlatButton(
////                                  child: Text('追加'),
////                                  color: Colors.green,
////                                  onPressed: () {
////                                    Navigator.pop(context,'OK');
////                                    widget.CalcNameList.add(selected);
////                                    widget.CalcPayList.add(_paymentController.text);
////                                    widget.callback(
////                                        selected,
////                                        _eventController.text,
////                                        _paymentController.text);
//////                                    if (_formKey.currentState.validate()) {
//////                                      _formKey.currentState.save();
//////                                    }
////                                  },
////                                ),
////                              ],
////                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                  //AlertDialog用のFlatButtonのコード
                  //Form内にネストしないとvalidationできないため削除
                actions:<Widget>[
                  FlatButton(
                      onPressed:() => Navigator.pop(context,'Cancel'),
                      child: Text('Cancel')
                  ),
                  FlatButton(
                    onPressed: (){
                      Navigator.pop(context,'OK');
                      widget.CalcNameList.add(selected);
                      widget.CalcPayList.add(_paymentController.text);
                      print(selected);
                      widget.callback(
                          selected,
                          _eventController.text,
                          _paymentController.text);
            
//                      if (_formKey.currentState.validate()) {
//                        // バリデーションが通ればスナックバーを表示
//                        Scaffold.of(context)
//                            .showSnackBar(SnackBar(content: Text('更新しました。')));
//                      }
                    },
                    child: Text('追加',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]
            ),
          );


//          .then<String>((returnVal){
//          if(returnVal != null) {
//          Scaffold.of(context).showSnackBar(
//          SnackBar(
//          content: Text('You clicked: $returnVal'),
//          action: SnackBarAction(label: 'OK', onPressed: (){}),
//          duration: Duration(seconds: 1),
//          ),
//          );
//          }
//          }
//          );
        }
    );
}
}


