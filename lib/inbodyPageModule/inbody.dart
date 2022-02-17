import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InbodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _ = Get.put(GetXHttp());
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: 100,
              child: Obx(() => ListView.builder(
                  itemCount: _.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(_.data[index]['product_id'].toString() +
                        _.data[index]['product_name'].toString());
                  }))),
          Container(
              height: 50,
              child: Obx(() => Checkbox(
                  value: _.data[0]['product_ischecked'],
                  onChanged: (value) {
                    _.data[0]['product_ischecked'] = value!;
                    print(_.data[0]['product_ischecked']);
                  }))),
          Obx(() => ElevatedButton(
                onPressed: () {
                  _.test.value = '변경되었수';
                  print(_.test.value);
                },
                child: Text(_.test.value),
              )),
          Obx(() => Text(_.data[0]['product_ischecked'].toString()))
        ],
      ),
    );
  }
}

class GetXHttp extends GetxController {
  @override
  void onInit() {
    print('커넥트 시작');
    connectServer();
    print('커넥트 완료');
    // ever(data, (_) => print('gg'));
    // once(data, (_) => print('한번만 호출'));
    // debounce(count, (_) => print('마지막 변경에 한번만 호출'), time: Duration(seconds: 1));
    // interval(data, (_) => InbodyPage(), time: Duration(seconds: 0));
    super.onInit();
  }

  RxList<dynamic> data = [].obs;
  RxString test = '기존임다'.obs;
  final String _url = "http://10.0.2.2:8000/foodpage/";

  Future<void> connectServer() async {
    final http.Response _res = await http.get(Uri.parse(this._url));
    if (_res.statusCode == 200) {
      List _result = json.decode(utf8.decode(_res.bodyBytes));
      print('커넥트서버 했음');
      data.assignAll(_result);
    } else {
      this.data.clear();
    }
    return;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
