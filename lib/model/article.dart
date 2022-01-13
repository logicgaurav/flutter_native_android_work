// import 'package:static_news_app/model/source.dart';

class Article {
  // final Source source;
  final String? id,
      author,
      title,
      summary,
      highlights,
      url,
      thumbnailUrl,
      timestamp,
      section,
      tag;

  Article(
      // this.source,
      this.id,
      this.author,
      this.title,
      this.summary,
      this.highlights,
      this.url,
      this.thumbnailUrl,
      this.timestamp,
      this.section,
      this.tag);

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      // Source.fromJson(json["source"]),
      json["id"] as String,
      json["author"] as String,
      json["title"] as String,
      json["summary"] as String,
      json["highlights"] as String,
      json["url"] as String,
      json["thumbnail_url"] as String,
      json["timestamp"] as String,
      json["section"] as String,
      json["tag"] as String,
    );
  }

// static List<Article> parseList(List<dynamic> list) {
//   return list.map((e) => Article.fromJson(e)).toList();
// }
}

// "id": "2372722",
// "source": "Bureau",
// "author": "",
// "title": "Wuhan's only foreign scientist tells her story on a lab world's worried about ",
// "timestamp": "2021-06-29 21:59:30",
// "section": "World",
// "slug": "world",
// "section_id": "120186",
// "thumbnail_url": "https://english.cdn.zeenews.com/sites/default/files/styles/zm_700x400/public/2021/06/29/947730-wuhaninsti.jpg",
// "section_url": "https://zeenews.india.com/mobileapi/sectionnews.php?sectionid=120186",
// "websiteurl": "https://zeenews.india.com/world/wuhans-only-foreign-scientist-tells-her-story-on-china-s-lab-at-the-heart-of-the-coronavirus-mystery-2372722.html",
// "main_section_url": "https://zeenews.india.com/mobileapi/sectionnews.php?sectionid=120186",
// "url": "https://zeenews.india.com/mobileapi/newsdetail.php?newsid=2372722",
// "tag": "Wuhan",
// "tag_id": "303977",
// "tag_url": "https://zeenews.india.com/mobileapi/sectionnews.php?sectionid=303977",
// "main_tag_url": "https://zeenews.india.com/tags/wuhan.html",
// "highlights": "<ul><li>Anderson said that the pandemic is something no one could have imagined on this scale\r\nWhile admitting that she never fell sick, she also said, \"I'm not naive enough to say I absolutely write this (the lab leak theory) off\"</li></ul>",
// "summary": "<p>Danielle Anderson is the last and only foreign scientist who worked at the Wuhan Institute of Virology, which is at the heart of the pandemic storm</p>\r\n",
// "news_type": "news"
