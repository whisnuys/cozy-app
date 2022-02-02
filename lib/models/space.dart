class Space {
  late int id;
  late String name;
  late String imageUrl;
  late int price;
  late String city;
  late String country;
  late int rating;
  late String address;
  late String phone;
  late String mapUrl;
  late List photos;
  late int numberOfKitchen;
  late int numberOfBedrooms;
  late int numberOfCupboards;

  Space({
    this.id = 0,
    this.name = '',
    required imageUrl,
    this.price = 0,
    this.city = '',
    this.country = '',
    this.rating = 0,
    this.address = '',
    this.mapUrl = '',
    this.phone = '',
    this.photos = const [],
    this.numberOfBedrooms = 0,
    this.numberOfCupboards = 0,
    this.numberOfKitchen = 0,
  });

  Space.fromJson(json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    country = json['country'];
    imageUrl = json['image_url'];
    price = json['price'];
    rating = json['rating'];
    address = json['address'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    photos = json['photos'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfKitchen = json['number_of_kitchens'];
    numberOfCupboards = json['number_of_cupboards'];
  }
}
