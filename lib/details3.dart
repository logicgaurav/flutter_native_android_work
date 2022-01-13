import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:taboola_sampleee/model/article_detail.dart';
import 'package:taboola_sampleee/service.dart';

// Future<ArticleDetail> fetchArticleDetail() async {
//   final response = await http.get(Uri.parse(
//       'http://st3.zeenews.india.com/liveapi/english/posts/2374765/index.json'));
//
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return ArticleDetail.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load Article');
//   }
// }

class SecondRoute extends StatefulWidget {
  final String articleId;
  // SecondRoute({Key? key}) : super(key: key);
  SecondRoute(this.articleId, {Key? key}) : super(key: key);
  // SecondRoute(this.articleId);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<SecondRoute> {
  late Future<ArticleDetail> futureArticleDetail;
  late String methodChannelValue ;
  static const methodChannel = MethodChannel('Gaurav');
  // late String? id;
  // late final Article item;

  ApiService client = ApiService();
  @override
  void initState() {
    super.initState();

    methodChannelValue = 'not initiated';

    futureArticleDetail = client.fetchArticleDetail(widget.articleId);
  }

  Future<void> intiMethodChannel() async {
  String? retrunedValue = await methodChannel.invokeMethod<String>('getUserName');
  if(retrunedValue != null) {
    setState(() {
      methodChannelValue = retrunedValue;
    });
  }
  }
// class DetailsScreen extends StatelessWidget {
//   final String tag;
//   final Article item;
//   // late Future<Album> futureAlbum;
//   DetailsScreen({required Key key, required this.item, required this.tag})
//       : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    ApiService client = ApiService();

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // Add the app bar to the CustomScrollView.
          SliverAppBar(
            brightness: Brightness.dark,
            elevation: 1,
            stretch: true,
            snap: true,
            centerTitle: true,
            pinned: true,
            floating: true,
            forceElevated: true,
            // expandedHeight: 90.0,
            // toolbarHeight: 42.0,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                // _scaffoldState.currentState.openDrawer();
                Navigator.of(context).pop();
                // print(_scaffoldState.currentState);
              },
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                size: 32,
              ),
              color: Colors.black54,
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.search,
                    size: 26.0,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.share_outlined,
                      color: Colors.black54,
                      size: 26,
                    ),
                  )),
            ],
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.red.shade600,
                  radius: 21,
                  child: const Text(
                    "FREE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "News".toUpperCase(),
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: FutureBuilder<ArticleDetail>(
              future: futureArticleDetail,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var _launchURL;
                  return Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                              tag: snapshot.data!.newsDetail.title,
                              child: Image.network(
                                  snapshot.data!.newsDetail.thumbnailUrl),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    snapshot.data!.newsDetail.title,
                                    style: TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5,
                                      letterSpacing: -.2,
                                      wordSpacing: .5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    children: [
                                      //   Icon(Icons.person),
                                      Text(
                                        // item.author ?? '',
                                        'Zee Media Bureau  |',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      // Icon(Icons.date_range),
                                      Text(
                                        // item.publishedAt ?? '',
                                        snapshot.data!.newsDetail.timestamp,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  SizedBox(
                                    // height: 20.0,
                                    child: Container(
                                      height: 1.0,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  // Html(
                                  //   data: item.highlights ?? '',
                                  //   customRender: {
                                  //     "li": (RenderContext context, Widget child,
                                  //         attributes, dom.Element element) {
                                  //       return this.customListItem(element);
                                  //     },
                                  //   },
                                  // ),
                                  Html(
                                    data: snapshot.data!.newsDetail.highlights,
                                    style: {
                                      "li": Style(
                                        fontSize: FontSize(18.0),
                                        lineHeight: LineHeight(1.7),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    },
                                  ),
                                  // child: Text.rich(TextSpan(   style: TextStyle(fontSize: 32),   children: [     TextSpan(text: '•', style: TextStyle(color: Colors.orange)),     TextSpan(text: ' Occaecat sint aute commodo consectetur do veniam fugiat quis exercitation culpa.'),   ], )),
                                  SizedBox(
                                    // height: 20.0,
                                    child: Container(
                                      height: 1.0,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Container(
                                    // color: Colors.grey,
                                    // height:
                                    //     MediaQuery.of(context).size.height,
                                    child: Center(
                                      // child: WebviewScaffold(
                                      //   url: new Uri.dataFromString(
                                      //           snapshot
                                      //               .data!.newsDetail.content,
                                      //           mimeType: 'text/html')
                                      //       .toString(),
                                      // ),
                                      child: Html(
                                        data: snapshot.data!.newsDetail.content,
                                        style: {
                                          "p": Style(
                                            fontSize: FontSize(16.0),
                                            lineHeight: LineHeight(1.7),
                                            color: Colors.black,
                                            // fontWeight: FontWeight.w600,
                                          ),
                                        },
                                      ),
                                      // child: Text(
                                      //     snapshot.data!.newsDetail.content ??
                                      //         ''),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.green,
                                    height: 10,
                                  ),
                                       Column(
                                         children: [
                                           Text(methodChannelValue,style:
                                           Theme.of(context).textTheme.subtitle1,),
                                           ElevatedButton(
                                               onPressed:intiMethodChannel,
                                               child: Text('click to call'))
                                         ],
                                       ),

                                       Container(
                                          height: 500,
                                          //color: Colors.blue[100],

                                          child: Center(child: AndroidView(viewType: "view1")),

                                       ) ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );

                  // Text(snapshot.data!.newsDetail.title ?? '');
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return Center(child: CircularProgressIndicator());
              },
            ),
            // child: Stack(
            //   children: [
            //     SingleChildScrollView(
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Hero(
            //             tag: '${item.title}',
            //             child: Image.network(item.thumbnailUrl ?? ''),
            //           ),
            //           SizedBox(
            //             height: 10.0,
            //           ),
            //           Padding(
            //             padding: EdgeInsets.symmetric(
            //               horizontal: 8.0,
            //             ),
            //             child: Column(
            //               children: [
            //                 Text(
            //                   item.title ?? '',
            //                   style: TextStyle(
            //                     fontSize: 28.0,
            //                     fontWeight: FontWeight.w500,
            //                     height: 1.5,
            //                     letterSpacing: -.2,
            //                     wordSpacing: .5,
            //                   ),
            //                 ),
            //                 SizedBox(
            //                   height: 20.0,
            //                 ),
            //                 Row(
            //                   children: [
            //                     //   Icon(Icons.person),
            //                     Text(
            //                       // item.author ?? '',
            //                       'Zee Media Bureau  |',
            //                       style: TextStyle(
            //                         fontSize: 12.0,
            //                         color: Colors.black54,
            //                       ),
            //                     ),
            //                     SizedBox(
            //                       width: 5.0,
            //                     ),
            //                     // Icon(Icons.date_range),
            //                     Text(
            //                       // item.publishedAt ?? '',
            //                       item.timestamp ?? '',
            //                       style: TextStyle(
            //                         fontSize: 12.0,
            //                         color: Colors.black54,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   height: 20.0,
            //                 ),
            //                 SizedBox(
            //                   // height: 20.0,
            //                   child: Container(
            //                     height: 1.0,
            //                     width: MediaQuery.of(context).size.width,
            //                     decoration: BoxDecoration(
            //                       color: Colors.grey.shade600,
            //                     ),
            //                   ),
            //                 ),
            //                 SizedBox(
            //                   height: 10.0,
            //                 ),
            //                 // Html(
            //                 //   data: item.highlights ?? '',
            //                 //   customRender: {
            //                 //     "li": (RenderContext context, Widget child,
            //                 //         attributes, dom.Element element) {
            //                 //       return this.customListItem(element);
            //                 //     },
            //                 //   },
            //                 // ),
            //                 Html(
            //                   data: item.highlights ?? '',
            //                   style: {
            //                     "li": Style(
            //                       fontSize: FontSize(18.0),
            //                       lineHeight: LineHeight(1.7),
            //                       fontWeight: FontWeight.w600,
            //                     ),
            //                   },
            //                 ),
            //                 // child: Text.rich(TextSpan(   style: TextStyle(fontSize: 32),   children: [     TextSpan(text: '•', style: TextStyle(color: Colors.orange)),     TextSpan(text: ' Occaecat sint aute commodo consectetur do veniam fugiat quis exercitation culpa.'),   ], )),
            //                 SizedBox(
            //                   // height: 20.0,
            //                   child: Container(
            //                     height: 1.0,
            //                     width: MediaQuery.of(context).size.width,
            //                     decoration: BoxDecoration(
            //                       color: Colors.grey.shade600,
            //                     ),
            //                   ),
            //                 ),
            //                 SizedBox(
            //                   height: 20.0,
            //                 ),
            //                 Container(
            //                     color: Colors.grey,
            //                     height: MediaQuery.of(context).size.height,
            //                     child: Center(
            //                       child: Text("Body detail is coming soon.."),
            //                     )),
            //               ],
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          )
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
