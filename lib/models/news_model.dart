/// source : {"id":null,"name":"CNBC"}
/// author : "Amala Balakrishner"
/// title : "Asia-Pacific markets mostly track Wall Street gains as Trump delays imposing reciprocal tariffs - CNBC"
/// description : "South Korea's seasonally adjusted unemployment rate hit 2.9% in January, easing from its three-year high of 3.7% in the month before."
/// url : "https://www.cnbc.com/2025/02/14/asia-markets-live-updates-asia-markets-set-to-rise.html"
/// urlToImage : "https://image.cnbcfm.com/api/v1/image/108095373-1738292856985-gettyimages-1507077883-seoulneonnightscrowdedshoppingstreetsdowntowncityscapekorea1.jpeg?v=1738292870&w=1920&h=1080"
/// publishedAt : "2025-02-14T04:27:00Z"
/// content : "Asia-Pacific markets mostly rose Friday, tracking Wall Street gains overnight as President Donald Trump signed a reciprocal tariffs plan, but did not enact the levies immediately.\r\nJapan's benchmark … [+2146 chars]"

class NewsArticle {
  NewsArticle({
      Source? source, 
      String? author, 
      String? title, 
      String? description, 
      String? url, 
      String? urlToImage, 
      String? publishedAt, 
      String? content,}){
    _source = source;
    _author = author;
    _title = title;
    _description = description;
    _url = url;
    _urlToImage = urlToImage;
    _publishedAt = publishedAt;
    _content = content;
}

  NewsArticle.fromJson(dynamic json) {
    _source = json['source'] != null ? Source.fromJson(json['source']) : null;
    _author = json['author'];
    _title = json['title'];
    _description = json['description'];
    _url = json['url'];
    _urlToImage = json['urlToImage'];
    _publishedAt = json['publishedAt'];
    _content = json['content'];
  }
  Source? _source;
  String? _author;
  String? _title;
  String? _description;
  String? _url;
  String? _urlToImage;
  String? _publishedAt;
  String? _content;
NewsArticle copyWith({  Source? source,
  String? author,
  String? title,
  String? description,
  String? url,
  String? urlToImage,
  String? publishedAt,
  String? content,
}) => NewsArticle(  source: source ?? _source,
  author: author ?? _author,
  title: title ?? _title,
  description: description ?? _description,
  url: url ?? _url,
  urlToImage: urlToImage ?? _urlToImage,
  publishedAt: publishedAt ?? _publishedAt,
  content: content ?? _content,
);
  Source? get source => _source;
  String? get author => _author;
  String? get title => _title;
  String? get description => _description;
  String? get url => _url;
  String? get urlToImage => _urlToImage;
  String? get publishedAt => _publishedAt;
  String? get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_source != null) {
      map['source'] = _source?.toJson();
    }
    map['author'] = _author;
    map['title'] = _title;
    map['description'] = _description;
    map['url'] = _url;
    map['urlToImage'] = _urlToImage;
    map['publishedAt'] = _publishedAt;
    map['content'] = _content;
    return map;
  }

}

/// id : null
/// name : "CNBC"

class Source {
  Source({
      dynamic id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Source.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  dynamic _id;
  String? _name;
Source copyWith({  dynamic id,
  String? name,
}) => Source(  id: id ?? _id,
  name: name ?? _name,
);
  dynamic get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}