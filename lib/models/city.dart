class City {
  int id;
  String text;
  String imageUrl;
  bool isPopular;

  City(
      {required this.id,
      required this.text,
      required this.imageUrl,
      this.isPopular = false});
}
