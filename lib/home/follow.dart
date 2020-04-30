import 'package:flutter/material.dart';
import 'package:hello_world/global_config.dart';
import 'package:hello_world/home/article.dart';

class Follow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _FollowState();
}
  
class _FollowState extends State<Follow> {
  
  Widget wordsCard(Article article) {
    Widget markWidget;
    if(article.imgUrl == null) {
      markWidget = new Text(
        article.mark,
        style: new TextStyle(color: GlobalConfig.fontColor, height: 1.3)
      );
    } else {
      markWidget = new Row(
        children: <Widget>[
          new Expanded(
            flex: 2,
            child: new Container(
                child: new Text(
                article.mark,
                style: new TextStyle(color: GlobalConfig.fontColor, height: 1.3)
              )
            ) 
          ),
          new Expanded(
            flex: 1,
            child: new AspectRatio(
              aspectRatio: 3.0 / 2.0,
              child: new Container(
                foregroundDecoration: new BoxDecoration(
                  image: DecorationImage(
                    image: new NetworkImage(article.imgUrl),
                    centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                  ),
                  borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                ),
              ),
            )
          ),
        ]
      );
    }

    

  }

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: new Column(
          children: <Widget>[]
        )
      )
    );
  }
}