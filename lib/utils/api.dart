import 'package:feed/utils/act.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Food {
  Future<Post?> getfood() async {
    print('1');
    var client = http.Client();
    print('2');
    var uri = Uri.parse('https://yummly2.p.rapidapi.com/feeds/list');
    print('3');

    var response = await client.get(uri, headers: {
      'X-RapidAPI-Key': '064de9161fmsh3393157a6bec2ddp13c8fcjsn287539c6be31',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
    });

    print('4');

    if (response.statusCode == 200) {
      print(
        'century',
      );
      var res = response.body;
      print('century 2');

      Map<String, dynamic> sample = json.decode(res);

      print('century 3');

      print('${sample.toString()}');

      Post newPost = Post.fromJson(sample);
      // print('${newPost.feed[0].recipeType}////////////////');

      return newPost;
    } else {
      print('5');
    }
  }
}
