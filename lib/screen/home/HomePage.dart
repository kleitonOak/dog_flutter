import 'package:dog_source/util/SharedPreferences.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  void createdS() {
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getToken(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData != null) {
          print('OAK:::: ${snapshot.data}');
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
                child: ListView(
                  children: <Widget>[
                    cardItem(),
                    cardItem(),
                    cardItem(),
                    cardItem(),
                    cardItem(),
                  ],
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

Widget cardItem() {
  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://baltaio.blob.core.windows.net/student-images/1edd5c50-bae9-11e8-8eb4-39de303632c1.jpg"),
          ),
          title: Text("Bruce Wayne"),
          subtitle: Text("09/05/2019 18:37"),
          trailing: Icon(Icons.more_vert),
        ),
        Container(
          child: Image.asset("assets/images/post-picture-001.png"),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis ex sem. Praesent elit dui, iaculis at interdum eu, rutrum et mi. "),
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
}