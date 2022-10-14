class PostModel {
  List<Posts>? posts;

  PostModel({this.posts});

  PostModel.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  String? category;
  String? authorUsername;
  String? authorImage;
  String? position;
  String? type;
  String? title;
  String? description;
  String? location;
  String? endDate;
  int? noOfLikes;
  int? noOfComments;
  String? createdAt;
  int? peopleAttending;
  String? image;
   List<Polls>? polls;
  int? votes;

  Posts(
      {this.category,
      this.authorUsername,
      this.authorImage,
      this.position,
      this.type,
      this.title,
      this.description,
      this.location,
      this.endDate,
      this.noOfLikes,
      this.noOfComments,
      this.createdAt,
      this.peopleAttending,
      this.image,
      this.polls,
      this.votes});

  Posts.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    authorUsername = json['author_username'];
    authorImage = json['author_image'];
    position = json['position'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
    location = json['location'];
    endDate = json['end_date'];
    noOfLikes = json['no_of_likes'];
    noOfComments = json['no_of_comments'];
    createdAt = json['created_at'];
    peopleAttending = json['people_attending'];
    image = json['image'];
      if (json['polls'] != null) {
      polls = <Polls>[];
      json['polls'].forEach((v) {
        polls!.add(new Polls.fromJson(v));
      });
    }
    votes = json['votes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['author_username'] = this.authorUsername;
    data['author_image'] = this.authorImage;
    data['position'] = this.position;
    data['type'] = this.type;
    data['title'] = this.title;
    data['description'] = this.description;
    data['location'] = this.location;
    data['end_date'] = this.endDate;
    data['no_of_likes'] = this.noOfLikes;
    data['no_of_comments'] = this.noOfComments;
    data['created_at'] = this.createdAt;
    data['people_attending'] = this.peopleAttending;
    data['image'] = this.image;
       if (this.polls != null) {
      data['polls'] = this.polls!.map((v) => v.toJson()).toList();
    }
    data['votes'] = this.votes;
    return data;
  }
}

class Polls {
  int? id;
  String? title;
  int? votes;

  Polls({this.id, this.title, this.votes});

  Polls.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    votes = json['votes'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['votes'] = this.votes;
    return data;
  }
}