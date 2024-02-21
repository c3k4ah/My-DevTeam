import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final String? id;
  final String? collectionId;
  final String? collectionName;
  final DateTime? created;
  final DateTime? updated;
  final String? country;
  final String? city;
  final double? long;
  final double? lat;

  const LocationEntity({
    this.id,
    this.collectionId,
    this.collectionName,
    this.created,
    this.updated,
    this.country,
    this.city,
    this.long,
    this.lat,
  });

  @override
  List<Object?> get props => [
        id,
        collectionId,
        collectionName,
        created,
        updated,
        country,
        city,
        long,
        lat,
      ];

  LocationEntity copyWith({
    String? id,
    String? collectionId,
    String? collectionName,
    DateTime? created,
    DateTime? updated,
    String? country,
    String? city,
    double? long,
    double? lat,
  }) {
    return LocationEntity(
      id: id ?? this.id,
      collectionId: collectionId ?? this.collectionId,
      collectionName: collectionName ?? this.collectionName,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      country: country ?? this.country,
      city: city ?? this.city,
      long: long ?? this.long,
      lat: lat ?? this.lat,
    );
  }
}
