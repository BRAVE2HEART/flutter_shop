import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController typeController = new TextEditingController();
  String showText = "showText";
  @override
  Widget build(BuildContext context) {
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
                onPressed: _choiceAction,
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

  void _choiceAction() {
    print("开始选择你喜欢的类型");
    if (typeController.text.toString() == "") {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("美女类型不能为空"),
              ));
    } else {
      getHttp(typeController.text.toString()).then((value) => setState(() {
            showText = value.toString();
          }));
    }
  }
  Future getHttp(String TypeText) async {
    final path = "https://mock.yonyoucloud.com/mock/11996/getUserInfo";
    try {
      Response response;
      var data = {"username": TypeText};
      response = await Dio().get(path, queryParameters: data);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
