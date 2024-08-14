class ReviewModel {
  final int? id;
  final int? idParent;
  final int? idVariant;
  final int? star;
  final String? title;
  final String? content;
  final String? fullname;
  final String? phone;
  final String? email;
  final String? poster;
  final String? status;
  final String? type;
  final int? datePosted;
  final List<Photos>? photos;
  final List<Videos>? videos;

  ReviewModel({
    this.id,
    this.idParent,
    this.idVariant,
    this.star,
    this.title,
    this.content,
    this.fullname,
    this.phone,
    this.email,
    this.poster,
    this.status,
    this.type,
    this.datePosted,
    this.photos,
    this.videos,
  });

  ReviewModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        idParent = json['id_parent'] as int?,
        idVariant = json['id_variant'] as int?,
        star = json['star'] as int?,
        title = json['title'] as String?,
        content = json['content'] as String?,
        fullname = json['fullname'] as String?,
        phone = json['phone'] as String?,
        email = json['email'] as String?,
        poster = json['poster'] as String?,
        status = json['status'] as String?,
        type = json['type'] as String?,
        datePosted = json['date_posted'] as int?,
        photos = (json['photos'] as List?)?.map((dynamic e) => Photos.fromJson(e as Map<String,dynamic>)).toList(),
        videos = (json['videos'] as List?)?.map((dynamic e) => Videos.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    // 'id' : id,
    // 'id_parent' : idParent,
    'id_variant' : idVariant,
    'star' : star,
    'title' : title,
    'content' : content,
    'fullname' : fullname,
    'phone' : phone,
    'email' : email,
    'poster' : poster,
    // 'status' : status,
    'type' : type,
    'date_posted' : datePosted,
  };
}

class Photos {
  final int? id;
  final int? idParent;
  final String? photo;

  Photos({
    this.id,
    this.idParent,
    this.photo,
  });

  Photos.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        idParent = json['id_parent'] as int?,
        photo = json['photo'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'id_parent' : idParent,
    'photo' : photo
  };
}

class Videos {
  final int? id;
  final int? idParent;
  final String? photo;
  final String? video;

  Videos({
    this.id,
    this.idParent,
    this.photo,
    this.video,
  });

  Videos.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        idParent = json['id_parent'] as int?,
        photo = json['photo'] as String?,
        video = json['video'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'id_parent' : idParent,
    'photo' : photo,
    'video' : video
  };
}