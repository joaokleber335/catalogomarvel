import 'dart:convert';

import 'package:catalogo_marvel/shared/models/thumbnail.dart';

class ComicDataWrapper {
  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHTML;
  String etag;
  Data data;
  ComicDataWrapper({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHTML,
    required this.etag,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'status': status,
      'copyright': copyright,
      'attributionText': attributionText,
      'attributionHTML': attributionHTML,
      'etag': etag,
      'data': data.toMap(),
    };
  }

  factory ComicDataWrapper.fromMap(Map<String, dynamic> map) {
    return ComicDataWrapper(
      code: map['code'],
      status: map['status'],
      copyright: map['copyright'],
      attributionText: map['attributionText'],
      attributionHTML: map['attributionHTML'],
      etag: map['etag'],
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ComicDataWrapper.fromJson(String source) =>
      ComicDataWrapper.fromMap(json.decode(source));
}

class Data {
  int offset;
  int limit;
  int total;
  int count;
  List<Comics> results;
  Data({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  Map<String, dynamic> toMap() {
    return {
      'offset': offset,
      'limit': limit,
      'total': total,
      'count': count,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      offset: map['offset'],
      limit: map['limit'],
      total: map['total'],
      count: map['count'],
      results: List<Comics>.from(map['results']?.map((x) => Comics.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));
}

class Comics {
  int id;
  int digitalId;
  String title;
  int issueNumber;
  String variantDescription;
  String description;
  String modified;
  String isbn;
  String upc;
  String diamondCode;
  String ean;
  String issn;
  String format;
  int pageCount;
  List<TextObjects> textObjects;
  String resourceURI;
  List<Urls> urls;
  Series series;
  List<Dates> dates;
  List<Prices> prices;
  Thumbnail thumbnail;
  // List<Images> images;
  Creators creators;
  Creators characters;
  Creators stories;
  Events events;
  Comics({
    required this.id,
    required this.digitalId,
    required this.title,
    required this.issueNumber,
    required this.variantDescription,
    required this.description,
    required this.modified,
    required this.isbn,
    required this.upc,
    required this.diamondCode,
    required this.ean,
    required this.issn,
    required this.format,
    required this.pageCount,
    required this.textObjects,
    required this.resourceURI,
    required this.urls,
    required this.series,
    required this.dates,
    required this.prices,
    required this.thumbnail,
    // required this.images,
    required this.creators,
    required this.characters,
    required this.stories,
    required this.events,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'digitalId': digitalId,
      'title': title,
      'issueNumber': issueNumber,
      'variantDescription': variantDescription,
      'description': description,
      'modified': modified,
      'isbn': isbn,
      'upc': upc,
      'diamondCode': diamondCode,
      'ean': ean,
      'issn': issn,
      'format': format,
      'pageCount': pageCount,
      'textObjects': textObjects.map((x) => x.toMap()).toList(),
      'resourceURI': resourceURI,
      'urls': urls.map((x) => x.toMap()).toList(),
      'series': series.toMap(),
      'dates': dates.map((x) => x.toMap()).toList(),
      'prices': prices.map((x) => x.toMap()).toList(),
      'thumbnail': thumbnail.toMap(),
      'creators': creators.toMap(),
      'characters': characters.toMap(),
      'stories': stories.toMap(),
      'events': events.toMap(),
    };
  }

  factory Comics.fromMap(Map<String, dynamic> map) {
    return Comics(
      id: map['id'],
      digitalId: map['digitalId'],
      title: map['title'],
      issueNumber: map['issueNumber'],
      variantDescription: map['variantDescription'],
      description: map['description'],
      modified: map['modified'],
      isbn: map['isbn'],
      upc: map['upc'],
      diamondCode: map['diamondCode'],
      ean: map['ean'],
      issn: map['issn'],
      format: map['format'],
      pageCount: map['pageCount'],
      textObjects: List<TextObjects>.from(
          map['textObjects']?.map((x) => TextObjects.fromMap(x))),
      resourceURI: map['resourceURI'],
      urls: List<Urls>.from(map['urls']?.map((x) => Urls.fromMap(x))),
      series: Series.fromMap(map['series']),
      dates: List<Dates>.from(map['dates']?.map((x) => Dates.fromMap(x))),
      prices: List<Prices>.from(map['prices']?.map((x) => Prices.fromMap(x))),
      thumbnail: Thumbnail.fromMap(map['thumbnail']),
      creators: Creators.fromMap(map['creators']),
      characters: Creators.fromMap(map['characters']),
      stories: Creators.fromMap(map['stories']),
      events: Events.fromMap(map['events']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Comics.fromJson(String source) => Comics.fromMap(json.decode(source));
}

class TextObjects {
  String type;
  String language;
  String text;
  TextObjects({
    required this.type,
    required this.language,
    required this.text,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'language': language,
      'text': text,
    };
  }

  factory TextObjects.fromMap(Map<String, dynamic> map) {
    return TextObjects(
      type: map['type'],
      language: map['language'],
      text: map['text'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TextObjects.fromJson(String source) =>
      TextObjects.fromMap(json.decode(source));
}

class Urls {
  String type;
  String url;
  Urls({
    required this.type,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'url': url,
    };
  }

  factory Urls.fromMap(Map<String, dynamic> map) {
    return Urls(
      type: map['type'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Urls.fromJson(String source) => Urls.fromMap(json.decode(source));
}

class Series {
  String resourceURI;
  String name;
  Series({
    required this.resourceURI,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'resourceURI': resourceURI,
      'name': name,
    };
  }

  factory Series.fromMap(Map<String, dynamic> map) {
    return Series(
      resourceURI: map['resourceURI'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Series.fromJson(String source) => Series.fromMap(json.decode(source));
}

class Dates {
  String type;
  String date;
  Dates({
    required this.type,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'date': date,
    };
  }

  factory Dates.fromMap(Map<String, dynamic> map) {
    return Dates(
      type: map['type'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Dates.fromJson(String source) => Dates.fromMap(json.decode(source));
}

class Prices {
  String type;
  double price;
  Prices({
    required this.type,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'price': price,
    };
  }

  factory Prices.fromMap(Map<String, dynamic> map) {
    return Prices(
      type: map['type'],
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Prices.fromJson(String source) => Prices.fromMap(json.decode(source));
}

class Creators {
  int available;
  String collectionURI;
  List<Items> items;
  int returned;
  Creators({
    required this.available,
    required this.collectionURI,
    required this.items,
    required this.returned,
  });

  Map<String, dynamic> toMap() {
    return {
      'available': available,
      'collectionURI': collectionURI,
      'items': items.map((x) => x.toMap()).toList(),
      'returned': returned,
    };
  }

  factory Creators.fromMap(Map<String, dynamic> map) {
    return Creators(
      available: map['available'],
      collectionURI: map['collectionURI'],
      items: List<Items>.from(map['items']?.map((x) => Items.fromMap(x))),
      returned: map['returned'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Creators.fromJson(String source) =>
      Creators.fromMap(json.decode(source));
}

class Items {
  String resourceURI;
  String name;
  String role;
  Items({
    required this.resourceURI,
    required this.name,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return {
      'resourceURI': resourceURI,
      'name': name,
      'role': role,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      resourceURI: map['resourceURI'],
      name: map['name'],
      role: map['role'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) => Items.fromMap(json.decode(source));
}

class ItemsEvent {
  String resourceURI;
  String name;
  String type;
  ItemsEvent({
    required this.resourceURI,
    required this.name,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'resourceURI': resourceURI,
      'name': name,
      'type': type,
    };
  }

  factory ItemsEvent.fromMap(Map<String, dynamic> map) {
    return ItemsEvent(
      resourceURI: map['resourceURI'],
      name: map['name'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemsEvent.fromJson(String source) =>
      ItemsEvent.fromMap(json.decode(source));
}

class Events {
  int available;
  String collectionURI;
  List<ItemsEvent> items;
  int returned;

  Events({
    required this.available,
    required this.collectionURI,
    required this.items,
    required this.returned,
  });

  Map<String, dynamic> toMap() {
    return {
      'available': available,
      'collectionURI': collectionURI,
      'items': items.map((x) => x.toMap()).toList(),
      'returned': returned,
    };
  }

  factory Events.fromMap(Map<String, dynamic> map) {
    return Events(
      available: map['available'],
      collectionURI: map['collectionURI'],
      items: List<ItemsEvent>.from(
          map['items']?.map((x) => ItemsEvent.fromMap(x))),
      returned: map['returned'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Events.fromJson(String source) => Events.fromMap(json.decode(source));
}
