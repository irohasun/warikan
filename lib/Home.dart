import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warikan_app/Tile.dart';
import 'package:warikan_app/addMemberButton.dart';
import 'package:warikan_app/addPayButton.dart';
import 'package:warikan_app/check.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int sum;
  List<String> NameList = [];
  List<String> EventList = [];
  List<String> PaymentList = [];
  List<String> FriendList = [];
  List<String> CalcnNameList = [];
  List<String> CalcPayList = [];

  //親widgetを子widgetからsetStateする関数
  callback(name,event,payment) {
    setState(() {
      NameList.add(name);
      EventList.add(event);
      PaymentList.add(payment);
    });
  }

  //友達を追加してsetStateする関数
  callbackFriend(friend) {
    setState(() {
      FriendList.add(friend);
    });
  }

  //全員の支払い合計金額を返す関数
  sumPaymentList(){
    int sum;
    List<int> PayList=[0];
    for(int i=0; i<PaymentList.length;i++){
      sum = int.parse(PaymentList[i]);
      PayList.add(sum);
      PayList.reduce((a,b) => a + b);
    }
    return PayList.reduce((a,b) => a + b);
  }

  removedAll(){
    setState(() {
      NameList=[];
      EventList=[];
      PaymentList=[];
      FriendList=[];
      CalcnNameList=[];
      CalcPayList=[];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('支払い一覧'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: (){
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                        title: Center(
                          child: Text('全データ削除しますか？'),
                        ),
                        actions:<Widget>[
                          FlatButton(
                              onPressed:() => Navigator.pop(context,'Cancel'),
                              child: Text('Cancel')
                          ),
                          FlatButton(
                            onPressed: (){
                              Navigator.pop(context,'OK');
                              removedAll();
                            },
                            child: Text('OK'),
                          ),
                        ]
                    )
                );
              }
              )
          ]
      ),

      body: ListView.builder(
        itemBuilder: (BuildContext context,int index){
          return Column(
              children: <Widget>[
                Tile(
                  NameList,
                  EventList,
                  PaymentList,
                  index
                  ),
                Divider(),
              ]
          );
        },
        itemCount: NameList.length,
      ),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Container(
              width:200,
              child: Text(
                '合計金額 ${sumPaymentList()}円',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: '',
                ),),
            ),
            Padding(
              padding:EdgeInsets.only(left: 30),
              child:RaisedButton(
                child: const Text('割り勘計算'),
                onPressed:(){
                  Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) =>
                          check(NameList,EventList,PaymentList,
                                FriendList,sumPaymentList,callback,CalcnNameList,CalcPayList
                          )
                      )
                  );
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          addMemberButton(FriendList,callback,callbackFriend,CalcnNameList,CalcPayList),
          addPayButton(NameList,EventList,PaymentList, FriendList,callback,CalcnNameList,CalcPayList),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked ,
    );
  }
}
