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

    return new Container(
      color: GlobalConfig.cardBackgroundColor,
      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: new FlatButton(
        onPressed: (){
          Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) {
              return null;
            } 
          ));
        },
        child: new Column(
          children: <Widget> [
            new Container(
              child: new Row(
                children: <Widget> [
                  new Container(
                    child: new CircleAvatar(
                      backgroundImage: new NetworkImage(article.headUrl),
                      radius: 11.0,
                    ),
                  ),
                  new Text(
                    "  " + article.user + "  " + article.action + "  " + article.time,
                    style: new TextStyle(color: GlobalConfig.fontColor),
                  )
                ]
              ),
              padding: const EdgeInsets.only(top: 10.0),
            ),
            new Container(
              child: new Text(
                article.title,
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, height: 1.3, color: GlobalConfig.dark==true?Colors.white70:Colors.black)
              ),
              margin: EdgeInsets.only(top: 6.0, bottom: 2.0),
              alignment: Alignment.topLeft
            ),
            new Container(
              child: markWidget,
              margin: EdgeInsets.only(top: 6.0),
              alignment: Alignment.topLeft
            ),
            new Container(
              child: new Row(
                children: <Widget> [
                  new Expanded(
                    child: new Text(
                      article.agreeNum.toString() + "赞同 · " + article.commentNum.toString() + "评论",
                      style: new TextStyle(color: GlobalConfig.fontColor),
                    )
                  ),
                  new PopupMenuButton(
                    itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                      new PopupMenuItem<String>(value: "1", child: new Text("屏蔽这个问题")),
                      new PopupMenuItem<String>(value: "2", child: new Text("取消关注")),
                      new PopupMenuItem<String>(value: "3", child: new Text("举报")),
                    ] 
                  )
                ]
              ),
              padding: EdgeInsets.only(),
            ),
          ]
        )
      )
    );

  }

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: new Column(
          children: <Widget>[
            wordsCard(articleList[0]),
            wordsCard(articleList[1]),
            wordsCard(articleList[2]),
            wordsCard(articleList[3]),
          ]
        )
      )
    );
  }
}