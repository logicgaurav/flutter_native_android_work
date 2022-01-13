import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taboola_sampleee/model/article.dart';

Widget listWidget(Article item, int i) {
  if (i == 0) {
    return Container(
      // margin: EdgeInsets.all(0.0),
      padding: EdgeInsets.only(bottom: 16, top: 8),
      child: SizedBox(
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              child: Image.network(
                item.thumbnailUrl ?? '',
                fit: BoxFit.fill,
                // color: Color(0xFFC4C4C4),
                color: Colors.grey,
                colorBlendMode: BlendMode.modulate,
              ),
              //
            ),
            Column(
              children: [
                // Text(
                //   item.id ?? '',
                // ),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: MaterialButton(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    height: 30.0,
                    minWidth: 10.0,
                    // color: Theme.of(context).primaryColor,
                    color: Colors.red,
                    textColor: Colors.white,

                    child: new Text(
                      item.tag ?? '',
                      style: TextStyle(
                        color: Colors.white,
                        // backgroundColor: Colors.red[700],
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () => {},
                    splashColor: Colors.red,
                  ),
                ),
                // SizedBox(
                //   height: 2.0,
                // ),
                Text(
                  item.title ?? '',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  } else {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Card(
        elevation: 0.0,
        margin: EdgeInsets.only(bottom: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 8.0,
            ),
            Expanded(
              // flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text(
                      item.tag!.toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.red[600],
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                  Text(
                    item.title ?? '',
                    style: TextStyle(
                      fontSize: 16.0,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    item.timestamp ?? '',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.black38,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            Hero(
              tag: '${item.title}',
              child: Container(
                margin: EdgeInsets.only(left: 8.0),
                width: 134.0,
                height: 72.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(item.thumbnailUrl ?? ''),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
