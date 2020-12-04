import 'package:flutter/material.dart';

class addMemberButton extends StatefulWidget {

  List<String> FriendList = [];
  Function(dynamic,dynamic,dynamic) callback;
  Function(dynamic) callbackFriend;
  List<String> CalcNameList;
  List<String> CalcPayList;
  addMemberButton(this.FriendList,this.callback,this.callbackFriend,
                  this.CalcNameList,this.CalcPayList,{Key key} ): super(key: key);



  @override
  _addMemberButtonState createState() => _addMemberButtonState();
}

class _addMemberButtonState extends State<addMemberButton> {
  TextEditingController _friendController = TextEditingController();

//  List<String> FList = [];
//  callbackFList(friend){
//    setState(() {
//      FList.add(friend);
//    });
//  }



  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
            heroTag: "hero1",
            child: Icon(Icons.person_add),
            onPressed: (){
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                    title: Center(
                      child: Text('新たな友達を追加'),
                    ),
                    content: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextFormField(
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              filled: true,
                              icon: Icon(Icons.person),
//                                  RaisedButton(
//                                  padding: EdgeInsets.all(1.0),
//                                  child: Icon(Icons.person_add),
//                                  onPressed: (){
////                                    setState(() {
////                                      widget.CalcNameList.add(_friendController.text);
////                                      widget.CalcPayList.add('0');
////                                      print(widget.CalcNameList);
////                                      print(widget.CalcPayList);
////                                      FList.add(_friendController.text);
////                                      widget.callbackFriend(_friendController.text);
////                                    });
//                                  }
//                              ),
                              labelText:"友達",
                            ),
                            controller: _friendController,
                          ),
//                          Container(
//                            height: 300.0, // Change as per your requirement
//                            width: 300.0, // Change as per your requirement
//                            child:ListView.builder(
//                              shrinkWrap: true,
//                              itemBuilder: (BuildContext context,int index){
//                                return Column(
//                                    children: <Widget>[
//                                      ListTile(
//                                        title: Text(FList[index]),
//                                      ),
//                                      Divider(),
//                                    ]
//                                );
//                              },
//                              itemCount: FList.length,
//                            ),
//                          )
                        ],
                      ),
                    ),

                    actions:<Widget>[
                      FlatButton(
                          onPressed:() => Navigator.pop(context,'Cancel'),
                          child: Text('Cancel')
                      ),
                      FlatButton(
                        onPressed: (){
                          Navigator.pop(context,'OK');
                          widget.CalcNameList.add(_friendController.text);
                          widget.CalcPayList.add('0');
                          print(widget.CalcNameList);
                          print(widget.CalcPayList);
                          widget.callbackFriend(_friendController.text);
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


