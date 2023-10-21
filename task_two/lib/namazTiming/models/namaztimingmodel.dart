// To parse this JSON data, do
//
//     final prayersTiming = prayersTimingFromMap(jsonString);

import 'dart:convert';

PrayersTiming prayersTimingFromMap(String str) => PrayersTiming.fromMap(json.decode(str));

String prayersTimingToMap(PrayersTiming data) => json.encode(data.toMap());

class PrayersTiming {

  int? code;
  String? status;
  List<Datum>? data;

  PrayersTiming({
    this.code,
    this.status,
    this.data,
  });

  factory PrayersTiming.fromMap(Map<String, dynamic> json) => PrayersTiming(
    code: json["code"],
    status: json["status"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "code": code,
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class Datum {
  Timings? timings;
  Date? date;
  Meta? meta;

  Datum({
    this.timings,
    this.date,
    this.meta,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    timings: json["timings"] == null ? null : Timings.fromMap(json["timings"]),
    date: json["date"] == null ? null : Date.fromMap(json["date"]),
    meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
  );

  Map<String, dynamic> toMap() => {
    "timings": timings?.toMap(),
    "date": date?.toMap(),
    "meta": meta?.toMap(),
  };
}

class Date {
  String? readable;
  String? timestamp;
  Gregorian? gregorian;
  Hijri? hijri;

  Date({
    this.readable,
    this.timestamp,
    this.gregorian,
    this.hijri,
  });

  factory Date.fromMap(Map<String, dynamic> json) => Date(
    readable: json["readable"],
    timestamp: json["timestamp"],
    gregorian: json["gregorian"] == null ? null : Gregorian.fromMap(json["gregorian"]),
    hijri: json["hijri"] == null ? null : Hijri.fromMap(json["hijri"]),
  );

  Map<String, dynamic> toMap() => {
    "readable": readable,
    "timestamp": timestamp,
    "gregorian": gregorian?.toMap(),
    "hijri": hijri?.toMap(),
  };
}

class Gregorian {
  String? date;
  String? format;
  String? day;
  GregorianWeekday? weekday;
  GregorianMonth? month;
  String? year;
  Designation? designation;

  Gregorian({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
  });

  factory Gregorian.fromMap(Map<String, dynamic> json) => Gregorian(
    date: json["date"],
    format: json["format"],
    day: json["day"],
    weekday: json["weekday"] == null ? null : GregorianWeekday.fromMap(json["weekday"]),
    month: json["month"] == null ? null : GregorianMonth.fromMap(json["month"]),
    year: json["year"],
    designation: json["designation"] == null ? null : Designation.fromMap(json["designation"]),
  );

  Map<String, dynamic> toMap() => {
    "date": date,
    "format": format,
    "day": day,
    "weekday": weekday?.toMap(),
    "month": month?.toMap(),
    "year": year,
    "designation": designation?.toMap(),
  };
}

class Designation {
  String? abbreviated;
  String? expanded;

  Designation({
    this.abbreviated,
    this.expanded,
  });

  factory Designation.fromMap(Map<String, dynamic> json) => Designation(
    abbreviated: json["abbreviated"],
    expanded: json["expanded"],
  );

  Map<String, dynamic> toMap() => {
    "abbreviated": abbreviated,
    "expanded": expanded,
  };
}

class GregorianMonth {
  int? number;
  String? en;

  GregorianMonth({
    this.number,
    this.en,
  });

  factory GregorianMonth.fromMap(Map<String, dynamic> json) => GregorianMonth(
    number: json["number"],
    en: json["en"],
  );

  Map<String, dynamic> toMap() => {
    "number": number,
    "en": en,
  };
}

class GregorianWeekday {
  String? en;

  GregorianWeekday({
    this.en,
  });

  factory GregorianWeekday.fromMap(Map<String, dynamic> json) => GregorianWeekday(
    en: json["en"],
  );

  Map<String, dynamic> toMap() => {
    "en": en,
  };
}

class Hijri {
  String? date;
  String? format;
  String? day;
  HijriWeekday? weekday;
  HijriMonth? month;
  String? year;
  Designation? designation;
  List<String>? holidays;

  Hijri({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
    this.holidays,
  });

  factory Hijri.fromMap(Map<String, dynamic> json) => Hijri(
    date: json["date"],
    format: json["format"],
    day: json["day"],
    weekday: json["weekday"] == null ? null : HijriWeekday.fromMap(json["weekday"]),
    month: json["month"] == null ? null : HijriMonth.fromMap(json["month"]),
    year: json["year"],
    designation: json["designation"] == null ? null : Designation.fromMap(json["designation"]),
    holidays: json["holidays"] == null ? [] : List<String>.from(json["holidays"]!.map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "date": date,
    "format": format,
    "day": day,
    "weekday": weekday?.toMap(),
    "month": month?.toMap(),
    "year": year,
    "designation": designation?.toMap(),
    "holidays": holidays == null ? [] : List<dynamic>.from(holidays!.map((x) => x)),
  };
}

class HijriMonth {
  int? number;
  String? en;
  String? ar;

  HijriMonth({
    this.number,
    this.en,
    this.ar,
  });

  factory HijriMonth.fromMap(Map<String, dynamic> json) => HijriMonth(
    number: json["number"],
    en: json["en"],
    ar: json["ar"],
  );

  Map<String, dynamic> toMap() => {
    "number": number,
    "en": en,
    "ar": ar,
  };
}

class HijriWeekday {
  String? en;
  String? ar;

  HijriWeekday({
    this.en,
    this.ar,
  });

  factory HijriWeekday.fromMap(Map<String, dynamic> json) => HijriWeekday(
    en: json["en"],
    ar: json["ar"],
  );

  Map<String, dynamic> toMap() => {
    "en": en,
    "ar": ar,
  };
}

class Meta {
  double? latitude;
  double? longitude;
  String? timezone;
  Method? method;
  String? latitudeAdjustmentMethod;
  String? midnightMode;
  String? school;
  Offset? offset;

  Meta({
    this.latitude,
    this.longitude,
    this.timezone,
    this.method,
    this.latitudeAdjustmentMethod,
    this.midnightMode,
    this.school,
    this.offset,
  });

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    timezone: json["timezone"],
    method: json["method"] == null ? null : Method.fromMap(json["method"]),
    latitudeAdjustmentMethod: json["latitudeAdjustmentMethod"],
    midnightMode: json["midnightMode"],
    school: json["school"],
    offset: json["offset"] == null ? null : Offset.fromMap(json["offset"]),
  );

  Map<String, dynamic> toMap() => {
    "latitude": latitude,
    "longitude": longitude,
    "timezone": timezone,
    "method": method?.toMap(),
    "latitudeAdjustmentMethod": latitudeAdjustmentMethod,
    "midnightMode": midnightMode,
    "school": school,
    "offset": offset?.toMap(),
  };
}

class Method {
  int? id;
  String? name;
  Params? params;
  Location? location;

  Method({
    this.id,
    this.name,
    this.params,
    this.location,
  });

  factory Method.fromMap(Map<String, dynamic> json) => Method(
    id: json["id"],
    name: json["name"],
    params: json["params"] == null ? null : Params.fromMap(json["params"]),
    location: json["location"] == null ? null : Location.fromMap(json["location"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "params": params?.toMap(),
    "location": location?.toMap(),
  };
}

class Location {
  double? latitude;
  double? longitude;

  Location({
    this.latitude,
    this.longitude,
  });

  factory Location.fromMap(Map<String, dynamic> json) => Location(
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

class Params {
  int? fajr;
  int? isha;

  Params({
    this.fajr,
    this.isha,
  });

  factory Params.fromMap(Map<String, dynamic> json) => Params(
    fajr: json["Fajr"],
    isha: json["Isha"],
  );

  Map<String, dynamic> toMap() => {
    "Fajr": fajr,
    "Isha": isha,
  };
}

class Offset {
  int? imsak;
  int? fajr;
  int? sunrise;
  int? dhuhr;
  int? asr;
  int? maghrib;
  int? sunset;
  int? isha;
  int? midnight;

  Offset({
    this.imsak,
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.sunset,
    this.isha,
    this.midnight,
  });

  factory Offset.fromMap(Map<String, dynamic> json) => Offset(
    imsak: json["Imsak"],
    fajr: json["Fajr"],
    sunrise: json["Sunrise"],
    dhuhr: json["Dhuhr"],
    asr: json["Asr"],
    maghrib: json["Maghrib"],
    sunset: json["Sunset"],
    isha: json["Isha"],
    midnight: json["Midnight"],
  );

  Map<String, dynamic> toMap() => {
    "Imsak": imsak,
    "Fajr": fajr,
    "Sunrise": sunrise,
    "Dhuhr": dhuhr,
    "Asr": asr,
    "Maghrib": maghrib,
    "Sunset": sunset,
    "Isha": isha,
    "Midnight": midnight,
  };
}

class Timings {
  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;
  String? imsak;
  String? midnight;
  String? firstthird;
  String? lastthird;

  Timings({
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.sunset,
    this.maghrib,
    this.isha,
    this.imsak,
    this.midnight,
    this.firstthird,
    this.lastthird,
  });

  factory Timings.fromMap(Map<String, dynamic> json) => Timings(
    fajr: json["Fajr"],
    sunrise: json["Sunrise"],
    dhuhr: json["Dhuhr"],
    asr: json["Asr"],
    sunset: json["Sunset"],
    maghrib: json["Maghrib"],
    isha: json["Isha"],
    imsak: json["Imsak"],
    midnight: json["Midnight"],
    firstthird: json["Firstthird"],
    lastthird: json["Lastthird"],
  );

  Map<String, dynamic> toMap() => {
    "Fajr": fajr,
    "Sunrise": sunrise,
    "Dhuhr": dhuhr,
    "Asr": asr,
    "Sunset": sunset,
    "Maghrib": maghrib,
    "Isha": isha,
    "Imsak": imsak,
    "Midnight": midnight,
    "Firstthird": firstthird,
    "Lastthird": lastthird,
};
}