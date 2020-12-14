import 'package:flutter/material.dart';

class addPayDialog extends StatefulWidget {
  List<String> NameList = [];
  List<String> EventList = [];
  List<String> PaymentList = [];
  List<String> FriendList = [];
  List<String> CalcNameList;
  List<String> CalcPayList;
  Function(dynamic, dynamic, dynamic) callback;
  Function justCallback;

  addPayDialog(this.NameList, this.EventList, this.PaymentList, this.FriendList,
      this.callback, this.CalcNameList, this.CalcPayList, this.justCallback);

  @override
  _addPayDialogState createState() => _addPayDialogState();
}

class _addPayDialogState extends State<addPayDialog> {
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

  bool _isEnable = false;

  buttonState() {
    setState(() {
      if (selected.isEmpty |
          _eventController.text.isEmpty |
          _eventController.text.isEmpty) {
        _isEnable = false;
        print(_isEnable);
      } else {
        _isEnable = true;
        print(_isEnable);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 300,
                      child: TextFormField(
                        onChanged: (text) {
                          print("First text field: $text");
                          buttonState();
                        },
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: true,
                          icon: Icon(Icons.event),
                          labelText: "イベント",
                        ),
                        controller: _eventController,
                      ),
                    ),
                    TextFormField(
                      onChanged: (text) {
                        print("First text field: $text");
                        buttonState();
                      },
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(Icons.money),
                        labelText: "金額",
                      ),
                      keyboardType: TextInputType.phone,
                      controller: _paymentController,
                    ),
                    DropdownButtonFormField<String>(
                      validator: (value) =>
                          value == null ? 'field required' : null,
                      value: selected,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(Icons.person),
                        labelText: '要選択',
                      ),
                      items: widget.FriendList.map((label) => DropdownMenuItem(
                            child: Text(label),
                            value: label,
                          )).toList(),
                      onChanged: (value) {
                        selected = value;
                        buttonState();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: Text('Cancel')),
          FlatButton(
            onPressed: !_isEnable
                ? null
                : () {
                    Navigator.pop(context, 'OK');
                    widget.CalcNameList.add(selected);
                    widget.CalcPayList.add(_paymentController.text);
                    widget.callback(selected, _eventController.text,
                        _paymentController.text);
                    widget.justCallback();
                  },
            child: Text(
              '追加',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]);
  }
}
