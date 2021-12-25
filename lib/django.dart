import 'dart:convert';
import 'package:http/http.dart' as http;


  Future<Post> fetchPost() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/member'));
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load http get');
    }
  }

class Post {
  int? id;
  String? name;
  var history;
  var istory;

  Post({this.id,this.name,this.history,this.istory});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      name: json['name'],
      history: json['history'],
      istory: json['istory'],
    );
  }
}
