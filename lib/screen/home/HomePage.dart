import 'package:dog_source/model/PostModel.dart';
import 'package:dog_source/service/PostService.dart';
import 'package:dog_source/util/SharedPreferences.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final _service = PostService();
  var _posts = new List<PostModel>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _service.getPostList(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData != null) {
          _posts = snapshot.data;
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Center(
                  child: SizedBox(
                    width: 100,
                    child: Image.asset("assets/images/app-logo.png"),
                  ),
                ),
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: AssetImage("assets/images/user-picture.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                actions: <Widget>[
                  Container(
                    width: 60,
                    child: FlatButton(
                      child: Icon(
                        Icons.search,
                        color: Color(0xFFBABABA),
                      ),
                      onPressed: () => {},
                    ),
                  ),
                ],
              ),
              body: Container(
                color: Color(0xFFF2F3F6),
                child: ListView.builder(
                  itemCount: _posts.length,
                  itemBuilder: (context, index){
                    return cardItem(_posts[index]);
                  },
                ),
              ),
            );
        }else{
          return new CircularProgressIndicator();
        }
      },
    );
  }
}

Widget cardItem(PostModel postModel) {
  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
         ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://avatars2.githubusercontent.com/u/7751404?s=400&v=4"),
          ),
          title: Text('${postModel.user}'),
          subtitle: Text('${postModel.dateTime}'),
          trailing: Icon(Icons.more_vert),
        ),
        Container(
          child: Image.asset("assets/images/post-picture-001.png"),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Text('${postModel.caption}'),
        ),
        ButtonTheme.bar(
          child: ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Icon(Icons.favorite),
                onPressed: () {},
              ),
              FlatButton(
                child: Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget getText(String x){
    return Text(x);
  }
}