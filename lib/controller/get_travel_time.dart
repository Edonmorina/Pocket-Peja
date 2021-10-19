import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:pocket_peja/controller/data_album.dart';

// url =  https://api.distancematrix.ai/maps/api/distancematrix/json?origins=51.4822656,-0.1933769&destinations=51.4994794,-0.1269979&departure_time=now&key=HLqqA28mHcpMmNTzu3JJW5m0uDYaC
enum TravelMode { walking, driving }

const String _key = "dZBcNRRWEWQLAFMfd1f9VkQc1om7I";

class GetTravelTime {
  http.Client client = http.Client();

  final double originLat;
  final double originLong;
  final double destLat;
  final double destLong;
  final TravelMode travelMode;
  GetTravelTime({
    required this.travelMode,
    required this.originLat,
    required this.originLong,
    required this.destLat,
    required this.destLong,
  });

  Future<Album> fetchAlbum() async {
    print("Origin lat: $originLat");
    print("Origin lat: $originLong");
    print("Key: $_key");

    try {
      var response = await client.get(
        Uri.parse(travelMode == TravelMode.walking
            ? 'https://api.distancematrix.ai/maps/api/distancematrix/json?origins=$originLat,$originLong&destinations=$destLat,$destLong&mode=walking&departure_time=now&key=$_key'
            : 'https://api.distancematrix.ai/maps/api/distancematrix/json?origins=$originLat,$originLong&destinations=$destLat,$destLong&mode=driving&departure_time=now&key=$_key'),
      );

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return Album.fromJson(
          convert.jsonDecode(response.body),
        );
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
