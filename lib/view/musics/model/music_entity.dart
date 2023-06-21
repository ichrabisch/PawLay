class Track {
  String? artworkUrl;
  String? genre;
  String? title;
  int? duration;
  String? downloadLink;
  String? path;
  Track(
      {this.artworkUrl,
      this.genre,
      this.title,
      this.duration,
      this.downloadLink});

  Track.fromJson(Map<String, dynamic> json) {
    artworkUrl = json['artwork_url'];
    genre = json['genre'];
    title = json['title'];
    duration = json['duration'];
    downloadLink = json['download_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artwork_url'] = this.artworkUrl;
    data['genre'] = this.genre;
    data['title'] = this.title;
    data['duration'] = this.duration;
    data['download_link'] = this.downloadLink;
    return data;
  }
}
