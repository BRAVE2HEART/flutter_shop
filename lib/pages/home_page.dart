import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController typeController = new TextEditingController();
    final showText = "showText";
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("美好人间"),
        ),
        body: Container(
          height: 1000,
          child: Column(
            children: <Widget>[
              TextField(
                controller: typeController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: "美女类型",
                    helperText: "请输入你喜欢的类型"),
                autofocus: false,
                onChanged: _onChanged,
              ),
              RaisedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      child: new AlertDialog(
                        title: new Text("美女类型"),
                        content: new Text(typeController.text),
                      ));
                },
                child: Text("选择完毕"),
              ),
              Text(
                showText,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
  void _onChanged(String value) {
    print(value);
  }
}
