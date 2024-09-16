class Location {
  final double latitude;
  final double longitude;

  Location(this.latitude, this.longitude);
  Location.empty()
      : latitude = 0.0,
        longitude = 0.0;
}
