class WeatherInfo {
  final Location location;
  final CurrentWeather current;

  WeatherInfo({required this.location, required this.current});

  factory WeatherInfo.fromMap(Map<String, dynamic> map) {
    return WeatherInfo(
      location: Location.fromMap(map['location'] ?? {}),
      current: CurrentWeather.fromMap(map['current'] ?? {}),
    );
  }
}

class Location {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final int localtimeEpoch;
  final String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      name: map['name'] ?? 'Unknown',
      region: map['region'] ?? '',
      country: map['country'] ?? '',
      lat: (map['lat'] as num?)?.toDouble() ?? 0.0,
      lon: (map['lon'] as num?)?.toDouble() ?? 0.0,
      tzId: map['tz_id'] ?? '',
      localtimeEpoch: map['localtime_epoch'] ?? 0,
      localtime: map['localtime'] ?? '',
    );
  }
}

class CurrentWeather {
  final int lastUpdatedEpoch;
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final int isDay;
  final WeatherCondition condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double feelslikeF;
  final double windchillC;
  final double windchillF;
  final double heatindexC;
  final double heatindexF;
  final double dewpointC;
  final double dewpointF;
  final double visKm;
  final double visMiles;
  final double uv;
  final double gustMph;
  final double gustKph;

  CurrentWeather({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  factory CurrentWeather.fromMap(Map<String, dynamic> map) {
    return CurrentWeather(
      lastUpdatedEpoch: map['last_updated_epoch'] ?? 0,
      lastUpdated: map['last_updated'] ?? '',
      tempC: (map['temp_c'] as num?)?.toDouble() ?? 0.0,
      tempF: (map['temp_f'] as num?)?.toDouble() ?? 0.0,
      isDay: map['is_day'] ?? 0,
      condition: WeatherCondition.fromMap(map['condition'] ?? {}),
      windMph: (map['wind_mph'] as num?)?.toDouble() ?? 0.0,
      windKph: (map['wind_kph'] as num?)?.toDouble() ?? 0.0,
      windDegree: map['wind_degree'] ?? 0,
      windDir: map['wind_dir'] ?? '',
      pressureMb: (map['pressure_mb'] as num?)?.toDouble() ?? 0.0,
      pressureIn: (map['pressure_in'] as num?)?.toDouble() ?? 0.0,
      precipMm: (map['precip_mm'] as num?)?.toDouble() ?? 0.0,
      precipIn: (map['precip_in'] as num?)?.toDouble() ?? 0.0,
      humidity: map['humidity'] ?? 0,
      cloud: map['cloud'] ?? 0,
      feelslikeC: (map['feelslike_c'] as num?)?.toDouble() ?? 0.0,
      feelslikeF: (map['feelslike_f'] as num?)?.toDouble() ?? 0.0,
      windchillC: (map['windchill_c'] as num?)?.toDouble() ?? 0.0,
      windchillF: (map['windchill_f'] as num?)?.toDouble() ?? 0.0,
      heatindexC: (map['heatindex_c'] as num?)?.toDouble() ?? 0.0,
      heatindexF: (map['heatindex_f'] as num?)?.toDouble() ?? 0.0,
      dewpointC: (map['dewpoint_c'] as num?)?.toDouble() ?? 0.0,
      dewpointF: (map['dewpoint_f'] as num?)?.toDouble() ?? 0.0,
      visKm: (map['vis_km'] as num?)?.toDouble() ?? 0.0,
      visMiles: (map['vis_miles'] as num?)?.toDouble() ?? 0.0,
      uv: (map['uv'] as num?)?.toDouble() ?? 0.0,
      gustMph: (map['gust_mph'] as num?)?.toDouble() ?? 0.0,
      gustKph: (map['gust_kph'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class WeatherCondition {
  final String text;
  final String icon;
  final int code;

  WeatherCondition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory WeatherCondition.fromMap(Map<String, dynamic> map) {
    return WeatherCondition(
      text: map['text'] ?? '',
      icon: map['icon'] ?? '',
      code: map['code'] ?? 0,
    );
  }
}
