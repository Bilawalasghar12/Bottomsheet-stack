import 'dart:convert';

Photos? photosFromMap(String str) => Photos.fromMap(json.decode(str));

String photosToMap(Photos? data) => json.encode(data!.toMap());

class Photos {
  Photos({
    this.message,
    this.data,
  });

  String? message;
  Data? data;

  factory Photos.fromMap(Map<String, dynamic> json) => Photos(
    message: json["message"],
    data: Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "data": data!.toMap(),
  };
}

class Data {
  Data({
    this.id,
    this.name,
    this.description,
    this.howItWork,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.days,
    this.questionPerDay,
    this.passRate,
    this.duration,
    this.pngImage,
    this.jobseeker,
    this.todayQuestions,
  });

  int? id;
  String? name;
  String? description;
  String? howItWork;
  String? image;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? days;
  int? questionPerDay;
  int? passRate;
  int? duration;
  String? pngImage;
  dynamic jobseeker;
  dynamic todayQuestions;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    howItWork: json["how_it_work"],
    image: json["image"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    days: json["days"],
    questionPerDay: json["question_per_day"],
    passRate: json["pass_rate"],
    duration: json["duration"],
    pngImage: json["png_image"],
    jobseeker: json["jobseeker"],
    todayQuestions: json["today_questions"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "description": description,
    "how_it_work": howItWork,
    "image": image,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "days": days,
    "question_per_day": questionPerDay,
    "pass_rate": passRate,
    "duration": duration,
    "png_image": pngImage,
    "jobseeker": jobseeker,
    "today_questions": todayQuestions,
  };
}
