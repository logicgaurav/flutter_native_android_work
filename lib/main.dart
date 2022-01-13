// @dart=2.9
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:taboola_sampleee/details3.dart';
// import 'package:free_news/details3.dart';
import 'package:taboola_sampleee/list_widget.dart';
import 'package:taboola_sampleee/model/article.dart';
import 'package:taboola_sampleee/service.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   systemNavigationBarColor: Colors.blue, // navigation bar color
  //   statusBarColor: Colors.pink, // status bar color
  // ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldState =
      new GlobalKey<ScaffoldState>();

  ApiService client = ApiService();
  // SizedBox(
  // height: 100,
  // child: Tab(
  List<Tab> _tabList = [
    Tab(
      child: SizedBox(child: Text("Home".toUpperCase())),
    ),
    Tab(
      child: Text("India".toUpperCase()),
    ),
    Tab(
      child: Text("World".toUpperCase()),
    ),
    Tab(
      child: Text("Popular".toUpperCase()),
    ),
    Tab(
      child: Text("Bollywood".toUpperCase()),
    ),
    Tab(
      child: Text("Hollywood".toUpperCase()),
    ),
    Tab(
      child: Text("Politics".toUpperCase()),
    ),
  ];

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabList.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      key: _scaffoldState,
      // appBar: AppBar(
      //   title: Text("data"),
      // ),
      drawer: Container(
        width: MediaQuery.of(context).size.width,
        child: Drawer(
          // elevation: 200,
          child: ListView(
            // shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 260,
                child: DrawerHeader(
                  margin: EdgeInsets.zero,

                  // padding: EdgeInsets.zero,
                  // ignore: avoid_unnecessary_containers

                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 1, color: Colors.lightBlue.shade900),
                            // color: Colors.red, // red as border color
                          ),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                size: 30,
                                color: Colors.grey.shade500,
                              ),

                              // onTap: () => Navigator.of(context).pop(),
                            ),
                            Expanded(
                              child: Text(
                                "Menu & Settings",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.red[700],
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search_outlined,
                                  color: Colors.red[700],
                                ))
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 10,
                      //   child: DecoratedBox(
                      //     decoration: BoxDecoration(color: Colors.black87),
                      //   ),
                      // ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // textDirection: TextDirection.rtl,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            child: Icon(
                              Icons.person_outline,
                              color: Colors.white,
                              size: 40,
                            ),
                            radius: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "You are not Signed In",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Login to read exclusive stories",
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "LOGIN/SIGNUP",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.yellow.shade600,
                                    minimumSize: Size(130, 40),
                                    padding: EdgeInsets.all(0),
                                  ),
                                )

                                // FlatButton(
                                //   onPressed: () {},
                                //   child: Text("LOGIN/SIGNUP"),
                                // )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Us
              ListTile(
                title: const Text(
                  'INDIA',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.0,
                  ),
                ),
                // trailing: const Icon(
                //   Icons.close,
                //   size: 30,
                // ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondRoute(
                      '',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //
      // appBar: AppBar(
      //   toolbarHeight: 60.0,
      //   leading: IconButton(
      //     onPressed: () {},
      //     icon: Icon(
      //       Icons.menu,
      //       size: 32,
      //     ),
      //     color: Colors.black87,
      //   ),
      //   backgroundColor: Colors.white,
      //   centerTitle: true,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       CircleAvatar(
      //         backgroundColor: Colors.red.shade600,
      //         radius: 21,
      //         child: const Text(
      //           "FREE",
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 14,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ),
      //       Text(
      //         "News".toUpperCase(),
      //         style: TextStyle(
      //           color: Colors.red,
      //           fontSize: 14,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //     ],
      //   ),
      //   bottom: PreferredSize(
      //     preferredSize: Size.fromHeight(30.0),
      //     child: TabBar(
      //       indicatorColor: Colors.red,
      //       labelStyle: TextStyle(
      //         fontSize: 14.0,
      //         fontWeight: FontWeight.w500,
      //         color: Colors.red,
      //       ),
      //       isScrollable: true,
      //       labelColor: Colors.red,
      //       unselectedLabelColor: Colors.black,
      //       controller: _tabController,
      //       tabs: _tabList,
      //     ),
      //   ),
      // ),

      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              brightness: Brightness.dark,
              // title: Text(
              //   "WhatsApp type sliver appbar",
              // ),
              // shadowColor: Colors.blue,
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
              // flexibleSpace: FlexibleSpaceBar(
              //   titlePadding: EdgeInsets.only(bottom: 262),
              //   title: Text("data.name"),
              //   centerTitle: true,
              //   background: Padding(
              //     padding: const EdgeInsets.only(bottom: 46),
              //     child: Container(
              //       color: Colors.red,
              //     ),
              //   ),
              // ),
              leading: IconButton(
                onPressed: () {
                  _scaffoldState.currentState.openDrawer();
                  // print(_scaffoldState.currentState);
                },
                icon: Icon(
                  Icons.menu,
                  size: 32,
                ),
                color: Colors.black87,
              ),

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

              bottom: PreferredSize(
                preferredSize: Size.fromHeight(36.0),
                child: TabBar(
                  // labelPadding: EdgeInsets.only(top: ),
                  indicatorColor: Colors.red,
                  labelStyle: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                  isScrollable: true,
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.black54,
                  controller: _tabController,
                  // tabs: _tabList,
                  tabs: [
                    SizedBox(
                      height: 34,
                      child: Tab(
                        child: SizedBox(child: Text("Home".toUpperCase())),
                      ),
                    ),
                    SizedBox(
                      height: 34,
                      child: Tab(
                        child: SizedBox(child: Text("India".toUpperCase())),
                      ),
                    ),
                    SizedBox(
                      height: 34,
                      child: Tab(
                        child: SizedBox(child: Text("World".toUpperCase())),
                      ),
                    ),
                    SizedBox(
                      height: 34,
                      child: Tab(
                        child: SizedBox(child: Text("Popular".toUpperCase())),
                      ),
                    ),
                    SizedBox(
                      height: 34,
                      child: Tab(
                        child: SizedBox(child: Text("Bpllywood".toUpperCase())),
                      ),
                    ),
                    SizedBox(
                      height: 34,
                      child: Tab(
                        child: SizedBox(child: Text("Hollywood".toUpperCase())),
                      ),
                    ),
                    SizedBox(
                      height: 34,
                      child: Tab(
                        child: SizedBox(child: Text("Politics".toUpperCase())),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Container(
                color: Colors.white,
                child: FutureBuilder(
                    future: client.getArticle('featuredNews'),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<dynamic>> snapshot) {
                      if (snapshot.hasData) {
                        List<Article> featuredNews = snapshot.data;
                        // print(featuredNews.toList().toString());
                        // return ListView.builder(
                        //   itemCount: featuredNews.length,
                        //   itemBuilder: (context, index) =>
                        //       customListTile(featuredNews[index]),
                        // );

                        return MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount:
                                featuredNews == null ? 0 : featuredNews.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SecondRoute(
                                              featuredNews[index].id,
                                            )
                                        //     DetailsScreen(
                                        //   item: featuredNews[index],
                                        //   tag: featuredNews[index].title,
                                        // ),
                                        ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    listWidget(featuredNews[index], index),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Container(
                color: Colors.white,
                child: FutureBuilder(
                    future: client.getArticle('india'),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<dynamic>> snapshot) {
                      if (snapshot.hasData) {
                        List<Article> featuredNews = snapshot.data;
                        return MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount:
                                featuredNews == null ? 0 : featuredNews.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SecondRoute(
                                              featuredNews[index].id,
                                            )
                                        //     DetailsScreen(
                                        //   item: featuredNews[index],
                                        //   tag: featuredNews[index].title,
                                        // ),
                                        ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    listWidget(featuredNews[index], index),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Container(
                color: Colors.white,
                child: FutureBuilder(
                    future: client.getArticle('world'),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<dynamic>> snapshot) {
                      if (snapshot.hasData) {
                        List<Article> featuredNews = snapshot.data;
                        return MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount:
                                featuredNews == null ? 0 : featuredNews.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SecondRoute(
                                              featuredNews[index].id,
                                            )
                                        //     DetailsScreen(
                                        //   item: featuredNews[index],
                                        //   tag: featuredNews[index].title,
                                        // ),
                                        ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    listWidget(featuredNews[index], index),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Text("Coming soon.."),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Text("Coming soon.."),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Text("Coming soon.."),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Text("Coming soon.."),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
