import 'package:flutter/material.dart';

class addMemberDialog extends StatefulWidget {
  List<String> FriendList = [];
  Function(dynamic, dynamic, dynamic) callback;
  Function(dynamic) callbackFriend;
  List<String> CalcNameList;
  List<String> CalcPayList;

  addMemberDialog(this.FriendList, this.callback, this.callbackFriend,
      this.CalcNameList, this.CalcPayList,
      {Key key})
      : super(key: key);

  @override
  _addMemberDialogState createState() => _addMemberDialogState();
}

class _addMemberDialogState extends State<addMemberDialog> {
  TextEditingController _friendController = TextEditingController();

  bool _isEnable = false;

  buttonState() {
    setState(() {
      if (_friendController.text.isEmpty) {
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
                  labelText: "友達",
                ),
                controller: _friendController,
                onChanged: (text) {
                  print("First text field: $text");
                  buttonState();
                },
              ),
              Container(
                height: 300,
                width: 300,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.FriendList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: <Widget>[
                        ListTile(
                          title: Text(widget.FriendList[index]),
                          onTap: () {
                            setState(() {
                              widget.FriendList.removeAt(index);
                            });
                          },
                        ),
                        Divider(),
                      ]);
                    }),
              )
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: Text('Cancel')),
          FlatButton(
              onPressed: () => Navigator.pop(context, 'OK'), child: Text('OK')),
          FlatButton(
            onPressed: !_isEnable
                ? null
                : () {
                    setState(() {
                      widget.CalcNameList.add(_friendController.text);
                      widget.CalcPayList.add('0');
                      widget.callbackFriend(_friendController.text);
                    });
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
