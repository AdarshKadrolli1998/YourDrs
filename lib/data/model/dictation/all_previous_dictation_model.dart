class AllPreviousDictations {
  int id;
  int dictationId;
  int episodeId;
  int episodeAppointmentRequestId;
  String attachmentName;
  int memberId;
  String fileName;
  String createdDate;
  bool uploadedToServer;
  int providerId;
  String dos;
  String displayFileName;
  int dictationTypeId;
  String appointmentProvider;

  AllPreviousDictations(
      {this.id,
        this.dictationId,
        this.episodeId,
        this.episodeAppointmentRequestId,
        this.attachmentName,
        this.memberId,
        this.fileName,
        this.createdDate,
        this.uploadedToServer,
        this.providerId,
        this.dos,
        this.displayFileName,
        this.dictationTypeId,
        this.appointmentProvider});

  AllPreviousDictations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dictationId = json['dictationId'];
    episodeId = json['episodeId'];
    episodeAppointmentRequestId = json['episodeAppointmentRequestId'];
    attachmentName = json['attachmentName'];
    memberId = json['memberId'];
    fileName = json['fileName'];
    createdDate = json['createdDate'];
    uploadedToServer = json['uploadedToServer'];
    providerId = json['providerId'];
    dos = json['dos'];
    displayFileName = json['displayFileName'];
    dictationTypeId = json['dictationTypeId'];
    appointmentProvider = json['appointmentProvider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dictationId'] = this.dictationId;
    data['episodeId'] = this.episodeId;
    data['episodeAppointmentRequestId'] = this.episodeAppointmentRequestId;
    data['attachmentName'] = this.attachmentName;
    data['memberId'] = this.memberId;
    data['fileName'] = this.fileName;
    data['createdDate'] = this.createdDate;
    data['uploadedToServer'] = this.uploadedToServer;
    data['providerId'] = this.providerId;
    data['dos'] = this.dos;
    data['displayFileName'] = this.displayFileName;
    data['dictationTypeId'] = this.dictationTypeId;
    data['appointmentProvider'] = this.appointmentProvider;
    return data;
  }
}