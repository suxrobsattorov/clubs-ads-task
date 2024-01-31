class ClubsAdsResponse {
  String? title;
  String? description;
  dynamic lat;
  String? updatedAt;
  String? createdAt;
  int? id;

  ClubsAdsResponse(
      {this.title,
      this.description,
      this.lat,
      this.updatedAt,
      this.createdAt,
      this.id});

  ClubsAdsResponse.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    lat = json['lat'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['lat'] = lat;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
