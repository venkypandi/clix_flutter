class NotificationModel {
  String? date;
  String? message;

  NotificationModel({this.date, this.message});

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return new NotificationModel(
      date: map['date'] as String?,
      message: map['message'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'date': this.date,
      'message': this.message,
    } as Map<String, dynamic>;
  }
}