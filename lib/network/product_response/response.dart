import 'package:json_annotation/json_annotation.dart';
import '../../data/vos/rating_vo.dart';
part 'response.g.dart';
@JsonSerializable()
class ProductResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'price')
  double? price;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'category')
  String? category;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'rating')
  RatingVO? rating;

  ProductResponse(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating});

  factory ProductResponse.fromJson(Map<String, dynamic> json)=>_$ProductResponseFromJson(json);

}
