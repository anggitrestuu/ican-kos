class Space {
  late String id;
  late String spaceName;
  late String imageUrl;
  late int price;
  late String city;
  late String country;
  late int rating;
  late String address;
  late String phone;
  late String mapUrl;
  late List photos;
  late int numberOfKitchens;
  late int numberOfBedrooms;
  late int numberOfCupboards;
  late bool isFavorite;

  Space(
      {required this.id,
      required this.spaceName,
      required this.imageUrl,
      required this.price,
      required this.city,
      required this.country,
      required this.rating,
      required this.address,
      required this.phone,
      required this.mapUrl,
      required this.photos,
      required this.numberOfKitchens,
      required this.numberOfBedrooms,
      required this.numberOfCupboards,
      required this.isFavorite});

  Space.fromJson(json) {
    id = json['id'];
    spaceName = json['name'];
    imageUrl = json['image_url'];
    price = json['price'];
    city = json['city'];
    country = json['country'];
    rating = json['rating'];
    address = json['address'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    photos = json['photos'];
    numberOfKitchens = json['number_of_kitchens'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfCupboards = json['number_of_cupboards'];
    isFavorite = json['isFavorite'];
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': spaceName,
      'image_url': imageUrl,
      'price': price,
      'city': city,
      'country': country,
      'rating': rating,
      'address': address,
      'phone': phone,
      'map_url': mapUrl,
      'photos': photos,
      'number_of_kitchens': numberOfKitchens,
      'number_of_bedrooms': numberOfBedrooms,
      'number_of_cupboards': numberOfCupboards,
      'isFavorite': isFavorite,
    };
  }
}
