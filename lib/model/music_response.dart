// To parse this JSON data, do
//
//     final musicResponse = musicResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MusicResponse musicResponseFromMap(String str) => MusicResponse.fromMap(json.decode(str));

String musicResponseToMap(MusicResponse data) => json.encode(data.toMap());

class MusicResponse {
  MusicResponse({
    required this.resultCount,
    required this.results,
  });

  int? resultCount;
  List<Result> results;

  factory MusicResponse.fromMap(Map<String, dynamic> json) => MusicResponse(
    resultCount: json["resultCount"],
    results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "resultCount": resultCount,
    "results": List<dynamic>.from(results.map((x) => x.toMap())),
  };
}

class Result {
  Result({
    // required this.wrapperType,
    // required this.kind,
    required this.artistId,
    required this.collectionId,
    required this.trackId,
    required this.artistName,
    required this.collectionName,
    required this.trackName,
    required this.collectionCensoredName,
    required this.trackCensoredName,
    required this.artistViewUrl,
    required this.collectionViewUrl,
    required this.trackViewUrl,
    required this.previewUrl,
    required this.artworkUrl30,
    required this.artworkUrl60,
    required this.artworkUrl100,
    // required this.collectionPrice,
    // required this.trackPrice,
    required this.releaseDate,
    // required this.collectionExplicitness,
    // required this.trackExplicitness,
    required this.discCount,
    required this.discNumber,
    required this.trackCount,
    required this.trackNumber,
    required this.trackTimeMillis,
    // required this.country,
    // required this.currency,
    required this.primaryGenreName,
    required this.isStreamable,
    required this.collectionArtistId,
    required this.collectionArtistViewUrl,
    // required this.trackRentalPrice,
    // required this.collectionHdPrice,
    // required this.trackHdPrice,
    // required this.trackHdRentalPrice,
    required this.contentAdvisoryRating,
    required this.shortDescription,
    required this.longDescription,
    required this.hasITunesExtras,
    // required this.collectionArtistName,
  });

  // WrapperType? wrapperType;
  Kind? kind;
  int? artistId;
  int? collectionId;
  int? trackId;
  String? artistName;
  String? collectionName;
  String? trackName;
  String? collectionCensoredName;
  String? trackCensoredName;
  String? artistViewUrl;
  String? collectionViewUrl;
  String? trackViewUrl;
  String? previewUrl;
  String? artworkUrl30;
  String? artworkUrl60;
  String? artworkUrl100;
  // double? collectionPrice;
  // double? trackPrice;
  DateTime? releaseDate;
  // Explicitness? collectionExplicitness;
  // Explicitness? trackExplicitness;
  int? discCount;
  int? discNumber;
  int? trackCount;
  int? trackNumber;
  int? trackTimeMillis;
  // Country? country;
  // Currency? currency;
  String? primaryGenreName;
  bool? isStreamable;
  int? collectionArtistId;
  String? collectionArtistViewUrl;
  // double? trackRentalPrice;
  // double? collectionHdPrice;
  // double? trackHdPrice;
  // double? trackHdRentalPrice;
  ContentAdvisoryRating? contentAdvisoryRating;
  String? shortDescription;
  String? longDescription;
  bool? hasITunesExtras;
  // CollectionArtistName? collectionArtistName;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    // wrapperType: wrapperTypeValues.map[json["wrapperType"]],
    // kind: kindValues.map[json["kind"]],
    artistId: json["artistId"],
    collectionId: json["collectionId"],
    trackId: json["trackId"],
    artistName: json["artistName"],
    collectionName: json["collectionName"],
    trackName: json["trackName"],
    collectionCensoredName: json["collectionCensoredName"],
    trackCensoredName: json["trackCensoredName"],
    artistViewUrl: json["artistViewUrl"],
    collectionViewUrl: json["collectionViewUrl"],
    trackViewUrl: json["trackViewUrl"],
    previewUrl: json["previewUrl"],
    artworkUrl30: json["artworkUrl30"],
    artworkUrl60: json["artworkUrl60"],
    artworkUrl100: json["artworkUrl100"],
    // collectionPrice: json["collectionPrice"].toDouble(),
    // trackPrice: json["trackPrice"].toDouble(),
    releaseDate: DateTime.parse(json["releaseDate"]),
    // collectionExplicitness: explicitnessValues.map[json["collectionExplicitness"]],
    // trackExplicitness: explicitnessValues.map[json["trackExplicitness"]],
    discCount: json["discCount"],
    discNumber: json["discNumber"],
    trackCount: json["trackCount"],
    trackNumber: json["trackNumber"],
    trackTimeMillis: json["trackTimeMillis"],
    // country: countryValues.map[json["country"]],
    // currency: currencyValues.map[json["currency"]],
    primaryGenreName: json["primaryGenreName"],
    isStreamable: json["isStreamable"],
    collectionArtistId: json["collectionArtistId"],
    collectionArtistViewUrl: json["collectionArtistViewUrl"],
    // trackRentalPrice: json["trackRentalPrice"] == null ? null : json["trackRentalPrice"].toDouble(),
    // collectionHdPrice: json["collectionHdPrice"] == null ? null : json["collectionHdPrice"].toDouble(),
    // trackHdPrice: json["trackHdPrice"] == null ? null : json["trackHdPrice"].toDouble(),
    // trackHdRentalPrice: json["trackHdRentalPrice"] == null ? null : json["trackHdRentalPrice"].toDouble(),
    contentAdvisoryRating: json["contentAdvisoryRating"] == null ? null : contentAdvisoryRatingValues.map[json["contentAdvisoryRating"]],
    shortDescription: json["shortDescription"],
    longDescription: json["longDescription"],
    hasITunesExtras: json["hasITunesExtras"],
    // collectionArtistName: json["collectionArtistName"] == null ? null : collectionArtistNameValues.map[json["collectionArtistName"]],
  );

  Map<String, dynamic> toMap() => {
    // "wrapperType": wrapperTypeValues.reverse[wrapperType],
    // "kind": kindValues.reverse[kind],
    "artistId": artistId,
    "collectionId": collectionId,
    "trackId": trackId,
    "artistName": artistName,
    "collectionName": collectionName,
    "trackName": trackName,
    "collectionCensoredName": collectionCensoredName,
    "trackCensoredName": trackCensoredName,
    "artistViewUrl": artistViewUrl,
    "collectionViewUrl": collectionViewUrl,
    "trackViewUrl": trackViewUrl,
    "previewUrl": previewUrl,
    "artworkUrl30": artworkUrl30,
    "artworkUrl60": artworkUrl60,
    "artworkUrl100": artworkUrl100,
    // "collectionPrice": collectionPrice,
    // "trackPrice": trackPrice,
    "releaseDate": releaseDate!.toIso8601String(),
    // "collectionExplicitness": explicitnessValues.reverse[collectionExplicitness],
    // "trackExplicitness": explicitnessValues.reverse[trackExplicitness],
    "discCount": discCount,
    "discNumber": discNumber,
    "trackCount": trackCount,
    "trackNumber": trackNumber,
    "trackTimeMillis": trackTimeMillis,
    // "country": countryValues.reverse[country],
    // "currency": currencyValues.reverse[currency],
    "primaryGenreName": primaryGenreName,
    "isStreamable": isStreamable,
    "collectionArtistId": collectionArtistId,
    "collectionArtistViewUrl": collectionArtistViewUrl,
    // "trackRentalPrice": trackRentalPrice,
    // "collectionHdPrice": collectionHdPrice,
    // "trackHdPrice": trackHdPrice,
    // "trackHdRentalPrice": trackHdRentalPrice,
    // "contentAdvisoryRating": contentAdvisoryRating == null ? null : contentAdvisoryRatingValues.reverse[contentAdvisoryRating],
    "shortDescription": shortDescription,
    "longDescription": longDescription,
    "hasITunesExtras": hasITunesExtras,
    // "collectionArtistName": collectionArtistName == null ? null : collectionArtistNameValues.reverse[collectionArtistName],
  };
}

enum CollectionArtistName { JACK_JOHNSON }

final collectionArtistNameValues = EnumValues({
  "Jack Johnson": CollectionArtistName.JACK_JOHNSON
});

enum Explicitness { NOT_EXPLICIT }

final explicitnessValues = EnumValues({
  "notExplicit": Explicitness.NOT_EXPLICIT
});

enum ContentAdvisoryRating { PG_13, R, PG }

final contentAdvisoryRatingValues = EnumValues({
  "PG": ContentAdvisoryRating.PG,
  "PG-13": ContentAdvisoryRating.PG_13,
  "R": ContentAdvisoryRating.R
});

enum Country { USA }

final countryValues = EnumValues({
  "USA": Country.USA
});

enum Currency { USD }

final currencyValues = EnumValues({
  "USD": Currency.USD
});

enum Kind { SONG, FEATURE_MOVIE }

final kindValues = EnumValues({
  "feature-movie": Kind.FEATURE_MOVIE,
  "song": Kind.SONG
});

enum WrapperType { TRACK }

final wrapperTypeValues = EnumValues({
  "track": WrapperType.TRACK
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);
  //
  // Map<T, String> get reverse {
  //   reverseMap ??= map.map((k, v) => MapEntry(v, k));
  //   return reverseMap;
  // }
}
