import 'package:flutter/material.dart';

class check extends StatefulWidget {
  List<String> NameList = [];
  List<String> EventList = [];
  List<String> PaymentList = [];
  List<String> FriendList = [];
  List<String> CalcNameList;
  List<String> CalcPayList;

  Function(dynamic,dynamic,dynamic) callback;
  Function() sumPaymentList;

  check(this.NameList,this.EventList,this.PaymentList,
        this.FriendList,this.sumPaymentList,callback,
        this.CalcNameList,this.CalcPayList);

  @override
  _checkState createState() => _checkState();
}

class _checkState extends State<check> {
  //一人当たりの支払金額を返す関数
  sumOnePay(String friendName) {
    int sum;
    List<int> OnePayList =[];
    for(int i=0; i<widget.CalcNameList.length; i++) {
      if (friendName == widget.CalcNameList[i]){
        sum = int.parse(widget.CalcPayList[i]);
        OnePayList.add(sum);
      }
    }
    return OnePayList.reduce((a, b) => a + b);
  }

  //合計金額を人数で割った平均値を返す関数
  avePay(){
    if(widget.sumPaymentList()/widget.FriendList.length > 0){
      return widget.sumPaymentList()/widget.FriendList.length;
    }else{
      return 0;
    }

  }

  //誰が誰に支払うかのTextを返す関数
  transMem(int friendIndex){
    int maxPay = 0;
    int maxMem = 0;
    for(int i=0; i<widget.FriendList.length; i++){
      if(maxPay < sumOnePay(widget.FriendList[i])){
        maxPay= sumOnePay(widget.FriendList[i]);
        maxMem = i;
      }
    }
    if(maxPay > sumOnePay(widget.FriendList[friendIndex])){
      print(maxPay);
      print(maxMem);
      return Text('${widget.FriendList[maxMem]}　☜　${widget.FriendList[friendIndex]}');
    }
  }

  //誰がいくら払うかのTextを返す関数
  transPay(int friendIndex){
    for(int i=0; i<widget.NameList.length; i++){
      if(sumOnePay(widget.FriendList[friendIndex])< sumOnePay(widget.NameList[i])){
        return Text('${(avePay()-sumOnePay(widget.FriendList[friendIndex])).toStringAsFixed(0)}円渡す');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('割り勘計算'),
      ),
      body:Column(
        children: [
          Container(
              child:Column(
              children: [
                  Text(
                      '合計金額：${widget.sumPaymentList()}円',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: '',
                        color: Colors.white,
                      ),),
                  Text(
                      '合計人数：${widget.FriendList.length}人',
                      style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: '',
                      color: Colors.white,
                      ),),
                  Text(
                      '一人当たり：${avePay().toStringAsFixed(0)}円',
                      style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: '',
                      color: Colors.white,
                      ),),
            ],
            ),
            padding: EdgeInsets.all(10.0),
            margin:EdgeInsets.all(10.0),
            color: Colors.orange,

          ),

          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context,int index){

              return Column(
                  children: <Widget>[
                    ListTile(
                      title: transMem(index),
                      trailing: transPay(index),
                      onTap: (){
                        print(avePay().toStringAsFixed(0));
                      },
                    ),
                    Divider(),
                  ]
              );
            },
            itemCount: widget.FriendList.length,
          ),
        ],
      ),


    );
  }
}
