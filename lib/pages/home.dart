import 'package:feed/utils/api.dart';
import 'package:feed/utils/act.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Post? _post;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    print(
      'I got here',
    );
    _post = await Food().getfood();
    print('${_post?.feed[0].recipeType}.//////////');
    if (_post != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Food Recipe',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.restaurant_menu,
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: _post?.feed.length,
                  itemBuilder: (context, index) {
                    var chaw = _post?.feed[index];
                    return Padding(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        height: 500,
                        width: 500,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                          chaw?.content.details?.images![0].hostedLargeUrl ??
                              '',
                        ))),
                        //child: Image.network(src),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
