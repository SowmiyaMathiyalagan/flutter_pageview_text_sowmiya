import 'package:flutter/material.dart';



import 'appdata_text.dart';
import 'displaytext.dart';

class PageViewTextScreen extends StatefulWidget {
  const PageViewTextScreen({Key? key}) : super(key: key);

  @override
  State<PageViewTextScreen> createState() => _PageViewTextScreenState();
}

class _PageViewTextScreenState extends State<PageViewTextScreen> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        title: Text(
          'J.K. Rowling Quotes',
          style: TextStyle(
            color: Colors.white,
            backgroundColor: Colors.indigo.shade900,
          ),
        ),
        backgroundColor: Colors.indigo.shade900,
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(value: 1, child: Text("Share")),
            ],
            onSelected: (value) {
              if (value == 1) {
                _shareInfo();
              }
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 200,
            child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                controller: PageController(viewportFraction: 0.7),
                itemCount: appDataList.length,
                itemBuilder: (context, index) {
                  var _quotes = appDataList[index];
                  var _scale = selectedIndex == index ? 1.0 : 0.8;
                  return TweenAnimationBuilder(
                      tween: Tween(begin: _scale, end: _scale),
                      duration: Duration(microseconds: 300),
                      child: DisplayText(
                        appData: _quotes,
                      ),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value as double,
                          child: child,
                        );
                      });
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: new Text(
                    (selectedIndex + 1).toString() +
                        '/' +
                        appDataList.length.toString(),
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.indigo.shade900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _shareInfo() {
    print('------>share');

    var Share;
    Share.share(appDataList[selectedIndex].text);

    print(appDataList[selectedIndex].text);
  }
}
