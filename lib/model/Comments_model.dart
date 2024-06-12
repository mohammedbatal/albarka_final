// ignore_for_file: file_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Comments {
  int? id;
  String? name;
  String? description;
  double? price;
  Comments({
    this.id,
    this.name,
    this.description,
    this.price,
  });

  Comments copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
  }) {
    return Comments(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
    };
  }

  factory Comments.fromMap(Map<String, dynamic> map) {
    return Comments(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Comments.fromJson(String source) =>
      Comments.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Comments(id: $id, name: $name, description: $description, price: $price)';
  }

  @override
  bool operator ==(covariant Comments other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ description.hashCode ^ price.hashCode;
  }
}
