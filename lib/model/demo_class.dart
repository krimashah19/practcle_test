class DemoClass {
  bool status;
  String message;
  int count;
  List<DemoData> data;
  Extra extra;

  DemoClass({this.status, this.message, this.count, this.data, this.extra});

  DemoClass.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    count = json['count'];
    if (json['data'] != null) {
      data = new List<DemoData>();
      json['data'].forEach((v) {
        data.add(new DemoData.fromJson(v));
      });
    }
    extra = json['extra'] != null ? new Extra.fromJson(json['extra']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.extra != null) {
      data['extra'] = this.extra.toJson();
    }
    return data;
  }
}

class DemoData {
  int id;
  String slug;
  int categoryId;
  Null authorId;
  int postId;
  String title;
  Null tags;
  String shortDescription;
  String description;
  String thumbImage;
  List<String> bannerImage;
  Null scialMediaImage;
  String time;
  int isFeatured;
  int isVotingEnable;
  String url;
  int tweetPublished;
  int savedDraft;
  int status;
  String scheduleDate;
  String endDate;
  String publishName;
  Null videoUrl;
  String country;
  String createdAt;
  Null updatedAt;
  Null deletedAt;
  String trimedDescription;
  int isVote;
  int isBookmark;
  int viewCount;
  int yesPercent;
  int noPercent;
  String authorName;
  String image;
  String categoryName;
  String color;
  String createDate;

  DemoData(
      {this.id,
        this.slug,
        this.categoryId,
        this.authorId,
        this.postId,
        this.title,
        this.tags,
        this.shortDescription,
        this.description,
        this.thumbImage,
        this.bannerImage,
        this.scialMediaImage,
        this.time,
        this.isFeatured,
        this.isVotingEnable,
        this.url,
        this.tweetPublished,
        this.savedDraft,
        this.status,
        this.scheduleDate,
        this.endDate,
        this.publishName,
        this.videoUrl,
        this.country,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.trimedDescription,
        this.isVote,
        this.isBookmark,
        this.viewCount,
        this.yesPercent,
        this.noPercent,
        this.authorName,
        this.image,
        this.categoryName,
        this.color,
        this.createDate});

  DemoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    categoryId = json['category_id'];
    authorId = json['author_id'];
    postId = json['post_id'];
    title = json['title'];
    tags = json['tags'];
    shortDescription = json['short_description'];
    description = json['description'];
    thumbImage = json['thumb_image'];
    bannerImage = json['banner_image'].cast<String>();
    scialMediaImage = json['scial_media_image'];
    time = json['time'];
    isFeatured = json['is_featured'];
    isVotingEnable = json['is_voting_enable'];
    url = json['url'];
    tweetPublished = json['tweet_published'];
    savedDraft = json['saved_draft'];
    status = json['status'];
    scheduleDate = json['schedule_date'];
    endDate = json['end_date'];
    publishName = json['publish_name'];
    videoUrl = json['video_url'];
    country = json['country'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    trimedDescription = json['trimed_description'];
    isVote = json['is_vote'];
    isBookmark = json['is_bookmark'];
    viewCount = json['view_count'];
    yesPercent = json['yes_percent'];
    noPercent = json['no_percent'];
    authorName = json['author_name'];
    image = json['image'];
    categoryName = json['category_name'];
    color = json['color'];
    createDate = json['create_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['category_id'] = this.categoryId;
    data['author_id'] = this.authorId;
    data['post_id'] = this.postId;
    data['title'] = this.title;
    data['tags'] = this.tags;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['thumb_image'] = this.thumbImage;
    data['banner_image'] = this.bannerImage;
    data['scial_media_image'] = this.scialMediaImage;
    data['time'] = this.time;
    data['is_featured'] = this.isFeatured;
    data['is_voting_enable'] = this.isVotingEnable;
    data['url'] = this.url;
    data['tweet_published'] = this.tweetPublished;
    data['saved_draft'] = this.savedDraft;
    data['status'] = this.status;
    data['schedule_date'] = this.scheduleDate;
    data['end_date'] = this.endDate;
    data['publish_name'] = this.publishName;
    data['video_url'] = this.videoUrl;
    data['country'] = this.country;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['trimed_description'] = this.trimedDescription;
    data['is_vote'] = this.isVote;
    data['is_bookmark'] = this.isBookmark;
    data['view_count'] = this.viewCount;
    data['yes_percent'] = this.yesPercent;
    data['no_percent'] = this.noPercent;
    data['author_name'] = this.authorName;
    data['image'] = this.image;
    data['category_name'] = this.categoryName;
    data['color'] = this.color;
    data['create_date'] = this.createDate;
    return data;
  }
}

class Extra {
  bool showingall;

  Extra({this.showingall});

  Extra.fromJson(Map<String, dynamic> json) {
    showingall = json['showingall'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['showingall'] = this.showingall;
    return data;
  }
}
