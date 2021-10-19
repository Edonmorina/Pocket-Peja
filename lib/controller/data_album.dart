class Album {
  final String locationTime;

  Album({
    required this.locationTime,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      locationTime: json['rows'][0]['elements'][0]['duration']['text'],
    );
  }
}
//['rows[0].elements[0].duration.text']