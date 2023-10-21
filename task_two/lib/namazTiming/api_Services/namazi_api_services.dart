import 'package:http/http.dart' as http;
import 'package:task_two/api_utils/api_utils.dart';
import 'package:task_two/namazTiming/models/namaztimingmodel.dart';

class NamazApiServices {
  static var client = http.Client();
  static List<Datum> listName = [];
  static List<Datum> listDate = [];

  static Future<List<Datum>> loadPrayerTiming() async {
    final response = await http.get(Uri.parse(ApiUtils.prayerUrl));

    if (response.statusCode == 200) {
      PrayersTiming prayersTiming = prayersTimingFromMap(response.body);

      return prayersTiming.data!;
    } else {
      return listName;
    }
  }

  static Future<List<Datum>> loadprayerTimingDate() async {
    final response = await http.get(Uri.parse(ApiUtils.prayerUrl));
    if (response.statusCode == 200) {
      PrayersTiming prayersTimingDate = prayersTimingFromMap(response.body);

      return prayersTimingDate.data!;
    } else {
      return listDate;
    }
  }
}
