
class CartItemModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingItemCart rating;

  CartItemModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

   factory CartItemModel.fromJson(Map<String ,dynamic>json){
      return  CartItemModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: RatingItemCart.fromJson(json["rating"]),
      );
    }
  
  Map<String ,dynamic>toJson(){
    return {
      "id":id,
      "title":title,
      "price":price,
      "description":description,
      "category":category,
      "image":image,
      "rating":rating.toJson()
    };
  }


}

class RatingItemCart {
  final double rate;
  final int count;

  RatingItemCart({required this.rate, required this.count});
  RatingItemCart.fromJson(Map<String, dynamic> json) : rate = json["rate"], count = json["count"];
  toJson() => {"rate": rate, "count": count};
  
}