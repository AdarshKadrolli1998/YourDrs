import 'package:YOURDRS_FlutterAPP/common/app_constants.dart';

class AppStrings {
  static const welcome = 'Welcome';
  static const signIn = "Signin";
  static const tryAgain = "tryAgain";
  static const notNow = "notNow";
  static const saveForLater= "Save for Later";
  static const dict= "Upload this dictation for transcription?";
  static const cancel = "Cancel";
  static const upload = "Upload";
  static const startFile = "Start file";
  static const dictType = "Select dictation type";
  static const camera = "Camera";
  static const photoLib = "Photo Library";
  static const dictationType= "Dictation type";
  static const patientNameAppBar = "Kevin Peterson";
  static const textDictation = "Dictations";
  static const textMyDictation = "My Previous Dictations";
  static const textAllDictation = "All Previous Dictations";
  static const textUploaded = "Uploaded";
  static const uploadToServer="your data has been uploaded successfully";
  static const uploadFailed="Upload Failed";
}

class ApiUrlConstants{
  static const dictations = AppConstants.dioBaseUrl + "api/Dictation/GetAllDictations";
  static const allPreviousDictations = AppConstants.dioBaseUrl + "api/Dictation/GetPreviousDictations";
  static const myPreviousDictations = AppConstants.dioBaseUrl + "api/Dictation/GetMyPreviousDictations";
  static const saveDictations = AppConstants.dioBaseUrl + "api/Dictation/SaveDictation";
}