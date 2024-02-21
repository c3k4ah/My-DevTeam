import '../../domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  const LocationModel({
    String? id,
    String? collectionId,
    String? collectionName,
    DateTime? created,
    DateTime? updated,
    String? country,
    String? city,
    double? long,
    double? lat,
  }) : super(
          id: id,
          collectionId: collectionId,
          collectionName: collectionName,
          created: created,
          updated: updated,
          country: country,
          city: city,
          long: long,
          lat: lat,
        );

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'] ?? '',
      collectionId: json['collectionId'] ?? '',
      collectionName: json['collectionName'] ?? '',
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'].toString()),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'].toString()),
      country: json['country'] ?? '',
      city: json['city'] ?? '',
      long: json['long'] == null ? 0.0 : double.parse(json['long'].toString()),
      lat: json['lat'] == null ? 0.0 : double.parse(json['lat'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'country': country,
      'city': city,
      'long': long,
      'lat': lat,
    };
  }

  factory LocationModel.fromEntity(LocationEntity entity) {
    return LocationModel(
      id: entity.id,
      collectionId: entity.collectionId,
      collectionName: entity.collectionName,
      created: entity.created,
      updated: entity.updated,
      country: entity.country,
      city: entity.city,
      long: entity.long,
      lat: entity.lat,
    );
  }
}
