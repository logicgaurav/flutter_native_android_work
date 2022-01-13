class ArticleDetail {
  final String updateTime;
  NewsDetail newsDetail;
  String editorList;
  List<Tags> tags;

  ArticleDetail(this.updateTime, this.newsDetail, this.editorList, this.tags);

  factory ArticleDetail.fromJson(Map<String, dynamic> json) {
    return ArticleDetail(
      json["update_time"] as String,
      NewsDetail.fromJson(json["NewsDetail"]),
      json["editorList"] as String,
      List<Tags>.from(
        json["tags"].map(
          (x) => Tags.fromJson(x),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['update_time'] = this.updateTime;
    if (this.newsDetail != null) {
      data['NewsDetail'] = this.newsDetail.toJson();
    }
    data['editorList'] = this.editorList;
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewsDetail {
  String id;
  String source;
  String author;
  String title;
  String timestamp;
  String section;
  String slug;
  String sectionId;
  String content;
  String websiteurl;
  String thumbnailUrl;
  String sectionUrl;
  String url;
  String newsType;
  String highlights;
  String comments;
  String contentEmbed;
  String sectionS3Url;
  String storyS3Url;
  List<String> highlightsApp;

  NewsDetail(
      this.id,
      this.source,
      this.author,
      this.title,
      this.timestamp,
      this.section,
      this.slug,
      this.sectionId,
      this.content,
      this.websiteurl,
      this.thumbnailUrl,
      this.sectionUrl,
      this.url,
      this.newsType,
      this.highlights,
      this.comments,
      this.contentEmbed,
      this.sectionS3Url,
      this.storyS3Url,
      this.highlightsApp);

  factory NewsDetail.fromJson(Map<String, dynamic> json) {
    return NewsDetail(
        json['id'],
        json['source'],
        json['author'],
        json['title'],
        json['timestamp'],
        json['section'],
        json['slug'],
        json['section_id'],
        json['content'],
        json['websiteurl'],
        json['thumbnail_url'],
        json['section_url'],
        json['url'],
        json['news_type'],
        json['highlights'],
        json['comments'],
        json['content_embed'],
        json['section_s3_url'],
        json['story_s3_url'],
        json['highlights_app'].cast<String>());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['source'] = this.source;
    data['author'] = this.author;
    data['title'] = this.title;
    data['timestamp'] = this.timestamp;
    data['section'] = this.section;
    data['slug'] = this.slug;
    data['section_id'] = this.sectionId;
    data['content'] = this.content;
    data['websiteurl'] = this.websiteurl;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['section_url'] = this.sectionUrl;
    data['url'] = this.url;
    data['news_type'] = this.newsType;
    data['highlights'] = this.highlights;
    data['comments'] = this.comments;
    data['content_embed'] = this.contentEmbed;
    data['section_s3_url'] = this.sectionS3Url;
    data['story_s3_url'] = this.storyS3Url;
    data['highlights_app'] = this.highlightsApp;
    return data;
  }
}

class Tags {
  String title;
  int topicID;
  String sectionPageURL;

  Tags(this.title, this.topicID, this.sectionPageURL);

  factory Tags.fromJson(Map<String, dynamic> json) {
    return Tags(
      json['title'] as String,
      json['topicID'] as int,
      json['sectionPageURL'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['topicID'] = this.topicID;
    data['sectionPageURL'] = this.sectionPageURL;
    return data;
  }
}
