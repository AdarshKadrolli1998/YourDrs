import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/data/model/dictation/all_previous_dictation_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AllPreviousDictationService {

  Future<AllPreviousDictations> postApiMethod(int EpisodeID,int AppointmentId) async{

    try {
      var endpointUrl = ApiUrlConstants.allPreviousDictations;
      Map<String, dynamic> queryParams = {
        'EpisodeID': EpisodeID,
        'AppointmentId': AppointmentId,
      };

      String queryString = Uri(queryParameters: queryParams).query;
      var requestUrl = endpointUrl + '?' + queryString;
      print('requestUrl $requestUrl');

      final response = await http.get(Uri.encodeFull(requestUrl),
          headers: {"Accept": "application/json"});
      print(response.body);

      if (response.statusCode == 200) {
        AllPreviousDictations allPreviousDictations = parseAllPreviousDictations(response.body);
        print(allPreviousDictations);
        return allPreviousDictations;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static AllPreviousDictations parseAllPreviousDictations(String responseBody){
    final AllPreviousDictations allPreviousDictations = AllPreviousDictations.fromJson(jsonDecode(responseBody));
    print(allPreviousDictations);
    return allPreviousDictations;
  }
}