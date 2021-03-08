import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/data/model/dictation/all_dictation_model.dart';
import 'package:YOURDRS_FlutterAPP/data/model/dictation/all_previous_dictation_model.dart';
import 'package:YOURDRS_FlutterAPP/data/model/dictation/my_previous_dictation_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AllDictationService {

  Future<AllDictations> getDictations() async{
    try {
      var endpointUrl = ApiUrlConstants.dictations;
      Map<String, dynamic> queryParams = {
        'TranscriptionId': '5753',
        'AppointmentId': '34533',
      };

      String queryString = Uri(queryParameters: queryParams).query;
      var requestUrl = endpointUrl + '?' + queryString;
      print('requestUrl $requestUrl');

      final response = await http.get(Uri.encodeFull(requestUrl),
          headers: {"Accept": "application/json"});
      print('response' +response.body);

      if (response.statusCode == 200) {
        AllDictations allDictations = parseAllDictations(response.body);
        print('dictations-- $allDictations');
        return allDictations;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static AllDictations parseAllDictations(String responseBody){
    final AllDictations allDictations = AllDictations.fromJson(json.decode(responseBody));
    print(allDictations);
    return allDictations;
  }
}

class AllPreviousDictationService {

  Future<AllPreviousDictations> getAllPreviousDictations() async{

    try {
      var endpointUrl = ApiUrlConstants.allPreviousDictations;
      Map<String, dynamic> queryParams = {
        'EpisodeID': '39308',
        'AppointmentId': '34537',
      };

      String queryString = Uri(queryParameters: queryParams).query;
      var requestUrl = endpointUrl + '?' + queryString;
      print('requestUrl $requestUrl');

      final response = await http.get(Uri.encodeFull(requestUrl),
          headers: {"Accept": "application/json"});
      print('response' +response.body);

      // if (response.statusCode == 200) {
      AllPreviousDictations allPreviousDictations = parseAllPreviousDictations(response.body);
      print(allPreviousDictations);
      return allPreviousDictations;
      // }
    } catch (e) {
      print(e.toString());
    }
  }

  static AllPreviousDictations parseAllPreviousDictations(String responseBody){
    final AllPreviousDictations allPreviousDictations = AllPreviousDictations.fromJson(json.decode(responseBody));
    print(allPreviousDictations);
    return allPreviousDictations;
  }
}

class MyPreviousDictationService {

  Future<MyPreviousDictations> getMyPreviousDictations() async{

    try {
      var endpointUrl = ApiUrlConstants.myPreviousDictations;
      Map<String, dynamic> queryParams = {
        'EpisodeId': '39356',
        'AppointmentId': '33977',
        'LoggedInMemberId': '15',
      };

      String queryString = Uri(queryParameters: queryParams).query;
      var requestUrl = endpointUrl + '?' + queryString;
      print('requestUrl $requestUrl');

      final response = await http.get(Uri.encodeFull(requestUrl),
          headers: {"Accept": "application/json"});
      print('response' +response.body);

      if (response.statusCode == 200) {
        MyPreviousDictations myPreviousDictations = parseMyPreviousDictations(response.body);
        print('dictations-- $myPreviousDictations');
        return myPreviousDictations;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static MyPreviousDictations parseMyPreviousDictations(String responseBody){
    final MyPreviousDictations myPreviousDictations = MyPreviousDictations.fromJson(json.decode(responseBody));
    print(myPreviousDictations);
    return myPreviousDictations;
  }
}