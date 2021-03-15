import 'dart:convert';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/network/model/dictation/post_dictations_model.dart';
import 'package:http/http.dart'as http;

class PostDictationsService {

  Future<PostDictationsModel> postApiMethod() async {
    String apiUrl = ApiUrlConstants.saveDictations;
    print(apiUrl);

    final json = {
      "header": {
        "status": "string",
        "statusCode": "string",
        "statusMessage": "string"
      },
      "id": null,
      "dictationId": null,
      "episodeId": 39385 ,
      "episodeAppointmentRequestId": 35123,
      "attachmentName":
      "MR_SupportDell_Y210341060_1_20210301_161528387163100035.mp4",
      "attachmentContent":
      "UklGRiRYBwBXQVZFZm10IBAAAAABAAEAgD4AAAB9AAABABAAZGF0YQBYBwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA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",
      "attachmentSizeBytes": 1000,
      "attachmentType": "mp4",
      "memberId": 10,
      "statusId": 107,
      "fileName": "MR_SupportDell_Y210341060_1_20210301_161528387163100035.mp4",
      "createdBy": 10,
      "createdDate": "2021-03-10T07:18:58.120Z",
      "uploadedToServer": true,
      "rejectionComments": null,
      "memberRoleId": 2,
      "providerId": null,
      "attachmentPhysicalFileName":
      "MR_SupportDell_Y210341060_1_20210301_161528387163100035.mp4",
      "patientFirstName": null,
      "patientLastName": null,
      "patientDOB": null,
      "dos": null,
      "practiceId": null,
      "locationId": null,
      "cptCodeIds": null,
      "appointmentTypeId": null,
      "displayFileName":
      "MR_SupportDell_Y210341060_1_20210301_161528387163100035",
      "isW9Doc": true,
      "consolidatedDocExists": true,
      "memberPhotos": null,
      "photoNameList": null,
      "dictationTypeId": 2,
      "nbrMemberId": null,
      "nbrMemberName": null,
      "isStatFile": null,
      "externalDocumentUploadId": null,
      "isEmergencyAddOn": false,
      "externalDocumentTypeId": null,
      "description": null,
      "appointmentProvider": null
    };
    ///checking  response status of Api on success and failure
    try{
      http.Response response = await http.post(
        apiUrl,
        body: jsonEncode(json),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      var jsonResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print("service success");
      }else{
        print(response.statusCode);
        print("service fail");
      }
      return PostDictationsModel.fromJson(jsonResponse);
    }
    catch(e){
      print("This Is => $e");
    }

  }
}