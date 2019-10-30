class PostModel{
  int id;
  String dateTime;
  String user;
  String photo;
  String caption;

  PostModel({this.id, this.dateTime, this.user, this.photo, this.caption});

  PostModel.fromJson(Map<String, dynamic> jsonMap) :
    id = int.parse(jsonMap['id']),
    dateTime = jsonMap['dateTime'],
    user = jsonMap['user'],
    photo = jsonMap['photo'],
    caption = jsonMap['caption'];

  toJson() {
    return {
      'id': id,
      'dateTime': dateTime,
      'user': user,
      'photo': photo,
      'caption' : caption
    };
  }

}