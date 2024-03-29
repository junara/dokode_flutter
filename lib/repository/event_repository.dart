class EventRepository {
  final int id;
  final String name;
  final String placeId;
  final String token;
  final String url;
  final String thumbnailSmall;
  final String thumbnailLarge;
  final String venueName;
  final String displayStartAt;
  final String organizer;
  final String organizerAffiliation;

  EventRepository.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'],
        token = json['token'],
        url = json['url'],
        thumbnailSmall = json['thumbnail_small'],
        thumbnailLarge = json['thumbnail_large'],
        displayStartAt = json['display_start_at'],
        organizer = json['organizer'],
        organizerAffiliation= json['organizer_affiliation'],
        placeId = json['venues'][0]['place_id'],
        venueName = json['venues'][0]['name'];
}
