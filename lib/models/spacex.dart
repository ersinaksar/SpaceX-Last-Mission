// To parse this JSON data, do
//
//     final spaceX = spaceXFromJson(jsonString);

import 'dart:convert';

SpaceX spaceXFromJson(String str) => SpaceX.fromJson(json.decode(str));

String spaceXToJson(SpaceX data) => json.encode(data.toJson());

class SpaceX {
  SpaceX({
    this.fairings,
    this.links,
    this.staticFireDateUtc,
    this.staticFireDateUnix,
    this.tbd,
    this.net,
    this.window,
    this.rocket,
    this.success,
    this.details,
    this.ships,
    this.capsules,
    this.payloads,
    this.launchpad,
    this.autoUpdate,
    this.launchLibraryId,
    this.failures,
    this.crew,
    this.flightNumber,
    this.name,
    this.dateUtc,
    this.dateUnix,
    this.dateLocal,
    this.datePrecision,
    this.upcoming,
    this.cores,
    this.id,
  });

  Fairings fairings;
  Links links;
  DateTime staticFireDateUtc;
  int staticFireDateUnix;
  bool tbd;
  bool net;
  int window;
  String rocket;
  bool success;
  String details;
  List<String> ships;
  List<dynamic> capsules;
  List<String> payloads;
  String launchpad;
  bool autoUpdate;
  String launchLibraryId;
  List<dynamic> failures;
  List<dynamic> crew;
  int flightNumber;
  String name;
  DateTime dateUtc;
  int dateUnix;
  DateTime dateLocal;
  String datePrecision;
  bool upcoming;
  List<Core> cores;
  String id;

  factory SpaceX.fromJson(Map<String, dynamic> json) => SpaceX(
        fairings: json["fairings"] == null
            ? null
            : Fairings.fromJson(json["fairings"]),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        staticFireDateUtc: json["static_fire_date_utc"] == null
            ? null
            : DateTime.parse(json["static_fire_date_utc"]),
        staticFireDateUnix: json["static_fire_date_unix"] == null
            ? null
            : json["static_fire_date_unix"],
        tbd: json["tbd"] == null ? null : json["tbd"],
        net: json["net"] == null ? null : json["net"],
        window: json["window"] == null ? null : json["window"],
        rocket: json["rocket"] == null ? null : json["rocket"],
        success: json["success"] == null ? null : json["success"],
        details: json["details"] == null ? null : json["details"],
        ships: json["ships"] == null
            ? null
            : List<String>.from(json["ships"].map((x) => x)),
        capsules: json["capsules"] == null
            ? null
            : List<dynamic>.from(json["capsules"].map((x) => x)),
        payloads: json["payloads"] == null
            ? null
            : List<String>.from(json["payloads"].map((x) => x)),
        launchpad: json["launchpad"] == null ? null : json["launchpad"],
        autoUpdate: json["auto_update"] == null ? null : json["auto_update"],
        launchLibraryId: json["launch_library_id"] == null
            ? null
            : json["launch_library_id"],
        failures: json["failures"] == null
            ? null
            : List<dynamic>.from(json["failures"].map((x) => x)),
        crew: json["crew"] == null
            ? null
            : List<dynamic>.from(json["crew"].map((x) => x)),
        flightNumber:
            json["flight_number"] == null ? null : json["flight_number"],
        name: json["name"] == null ? null : json["name"],
        dateUtc:
            json["date_utc"] == null ? null : DateTime.parse(json["date_utc"]),
        dateUnix: json["date_unix"] == null ? null : json["date_unix"],
        dateLocal: json["date_local"] == null
            ? null
            : DateTime.parse(json["date_local"]),
        datePrecision:
            json["date_precision"] == null ? null : json["date_precision"],
        upcoming: json["upcoming"] == null ? null : json["upcoming"],
        cores: json["cores"] == null
            ? null
            : List<Core>.from(json["cores"].map((x) => Core.fromJson(x))),
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "fairings": fairings == null ? null : fairings.toJson(),
        "links": links == null ? null : links.toJson(),
        "static_fire_date_utc": staticFireDateUtc == null
            ? null
            : staticFireDateUtc.toIso8601String(),
        "static_fire_date_unix":
            staticFireDateUnix == null ? null : staticFireDateUnix,
        "tbd": tbd == null ? null : tbd,
        "net": net == null ? null : net,
        "window": window == null ? null : window,
        "rocket": rocket == null ? null : rocket,
        "success": success == null ? null : success,
        "details": details == null ? null : details,
        "ships": ships == null ? null : List<dynamic>.from(ships.map((x) => x)),
        "capsules": capsules == null
            ? null
            : List<dynamic>.from(capsules.map((x) => x)),
        "payloads": payloads == null
            ? null
            : List<dynamic>.from(payloads.map((x) => x)),
        "launchpad": launchpad == null ? null : launchpad,
        "auto_update": autoUpdate == null ? null : autoUpdate,
        "launch_library_id": launchLibraryId == null ? null : launchLibraryId,
        "failures": failures == null
            ? null
            : List<dynamic>.from(failures.map((x) => x)),
        "crew": crew == null ? null : List<dynamic>.from(crew.map((x) => x)),
        "flight_number": flightNumber == null ? null : flightNumber,
        "name": name == null ? null : name,
        "date_utc": dateUtc == null ? null : dateUtc.toIso8601String(),
        "date_unix": dateUnix == null ? null : dateUnix,
        "date_local": dateLocal == null ? null : dateLocal.toIso8601String(),
        "date_precision": datePrecision == null ? null : datePrecision,
        "upcoming": upcoming == null ? null : upcoming,
        "cores": cores == null
            ? null
            : List<dynamic>.from(cores.map((x) => x.toJson())),
        "id": id == null ? null : id,
      };
}

class Core {
  Core({
    this.core,
    this.flight,
    this.gridfins,
    this.legs,
    this.reused,
    this.landingAttempt,
    this.landingSuccess,
    this.landingType,
    this.landpad,
  });

  String core;
  int flight;
  bool gridfins;
  bool legs;
  bool reused;
  bool landingAttempt;
  bool landingSuccess;
  String landingType;
  String landpad;

  factory Core.fromJson(Map<String, dynamic> json) => Core(
        core: json["core"] == null ? null : json["core"],
        flight: json["flight"] == null ? null : json["flight"],
        gridfins: json["gridfins"] == null ? null : json["gridfins"],
        legs: json["legs"] == null ? null : json["legs"],
        reused: json["reused"] == null ? null : json["reused"],
        landingAttempt:
            json["landing_attempt"] == null ? null : json["landing_attempt"],
        landingSuccess:
            json["landing_success"] == null ? null : json["landing_success"],
        landingType: json["landing_type"] == null ? null : json["landing_type"],
        landpad: json["landpad"] == null ? null : json["landpad"],
      );

  Map<String, dynamic> toJson() => {
        "core": core == null ? null : core,
        "flight": flight == null ? null : flight,
        "gridfins": gridfins == null ? null : gridfins,
        "legs": legs == null ? null : legs,
        "reused": reused == null ? null : reused,
        "landing_attempt": landingAttempt == null ? null : landingAttempt,
        "landing_success": landingSuccess == null ? null : landingSuccess,
        "landing_type": landingType == null ? null : landingType,
        "landpad": landpad == null ? null : landpad,
      };
}

class Fairings {
  Fairings({
    this.reused,
    this.recoveryAttempt,
    this.recovered,
    this.ships,
  });

  bool reused;
  bool recoveryAttempt;
  bool recovered;
  List<String> ships;

  factory Fairings.fromJson(Map<String, dynamic> json) => Fairings(
        reused: json["reused"] == null ? null : json["reused"],
        recoveryAttempt:
            json["recovery_attempt"] == null ? null : json["recovery_attempt"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        ships: json["ships"] == null
            ? null
            : List<String>.from(json["ships"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "reused": reused == null ? null : reused,
        "recovery_attempt": recoveryAttempt == null ? null : recoveryAttempt,
        "recovered": recovered == null ? null : recovered,
        "ships": ships == null ? null : List<dynamic>.from(ships.map((x) => x)),
      };
}

class Links {
  Links({
    this.patch,
    this.reddit,
    this.flickr,
    this.presskit,
    this.webcast,
    this.youtubeId,
    this.article,
    this.wikipedia,
  });

  Patch patch;
  Reddit reddit;
  Flickr flickr;
  dynamic presskit;
  String webcast;
  String youtubeId;
  dynamic article;
  dynamic wikipedia;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        patch: json["patch"] == null ? null : Patch.fromJson(json["patch"]),
        reddit: json["reddit"] == null ? null : Reddit.fromJson(json["reddit"]),
        flickr: json["flickr"] == null ? null : Flickr.fromJson(json["flickr"]),
        presskit: json["presskit"],
        webcast: json["webcast"] == null ? null : json["webcast"],
        youtubeId: json["youtube_id"] == null ? null : json["youtube_id"],
        article: json["article"],
        wikipedia: json["wikipedia"],
      );

  Map<String, dynamic> toJson() => {
        "patch": patch == null ? null : patch.toJson(),
        "reddit": reddit == null ? null : reddit.toJson(),
        "flickr": flickr == null ? null : flickr.toJson(),
        "presskit": presskit,
        "webcast": webcast == null ? null : webcast,
        "youtube_id": youtubeId == null ? null : youtubeId,
        "article": article,
        "wikipedia": wikipedia,
      };
}

class Flickr {
  Flickr({
    this.small,
    this.original,
  });

  List<dynamic> small;
  List<String> original;

  factory Flickr.fromJson(Map<String, dynamic> json) => Flickr(
        small: json["small"] == null
            ? null
            : List<dynamic>.from(json["small"].map((x) => x)),
        original: json["original"] == null
            ? null
            : List<String>.from(json["original"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "small": small == null ? null : List<dynamic>.from(small.map((x) => x)),
        "original": original == null
            ? null
            : List<dynamic>.from(original.map((x) => x)),
      };
}

class Patch {
  Patch({
    this.small,
    this.large,
  });

  String small;
  String large;

  factory Patch.fromJson(Map<String, dynamic> json) => Patch(
        small: json["small"] == null ? null : json["small"],
        large: json["large"] == null ? null : json["large"],
      );

  Map<String, dynamic> toJson() => {
        "small": small == null ? null : small,
        "large": large == null ? null : large,
      };
}

class Reddit {
  Reddit({
    this.campaign,
    this.launch,
    this.media,
    this.recovery,
  });

  String campaign;
  String launch;
  dynamic media;
  String recovery;

  factory Reddit.fromJson(Map<String, dynamic> json) => Reddit(
        campaign: json["campaign"] == null ? null : json["campaign"],
        launch: json["launch"] == null ? null : json["launch"],
        media: json["media"],
        recovery: json["recovery"] == null ? null : json["recovery"],
      );

  Map<String, dynamic> toJson() => {
        "campaign": campaign == null ? null : campaign,
        "launch": launch == null ? null : launch,
        "media": media,
        "recovery": recovery == null ? null : recovery,
      };
}
