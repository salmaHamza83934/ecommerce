import 'package:ecommerce_app/data/model/response/ProductResponseDto.dart';
import 'package:ecommerce_app/domain/entities/GetWishlistResponseEntity.dart';

/// status : "success"
/// count : 10
/// data : [{"sold":10359,"images":["1680403156555-3.jpeg","1680403156555-2.jpeg","1680403156554-1.jpeg","1680403156556-4.jpeg"],"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"ratingsQuantity":18,"_id":"6428ead5dc1175abc65ca0ad","title":"Woman Shawl","slug":"woman-shawl","description":"Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen","quantity":220,"price":149,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403156501-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"createdAt":"2023-04-02T02:39:17.204Z","updatedAt":"2024-07-16T22:31:35.117Z","__v":0,"id":"6428ead5dc1175abc65ca0ad"},{"sold":6871,"images":["1680402838330-1.jpeg","1680402838331-3.jpeg","1680402838332-4.jpeg","1680402838331-2.jpeg","1680402838332-5.jpeg"],"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"ratingsQuantity":18,"_id":"6428e997dc1175abc65ca0a1","title":"Woman Shawl","slug":"woman-shawl","description":"Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen","quantity":220,"price":149,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680402838276-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"createdAt":"2023-04-02T02:33:59.274Z","updatedAt":"2024-07-16T22:31:35.117Z","__v":0,"id":"6428e997dc1175abc65ca0a1"},{"sold":2557,"images":["1680401893496-2.jpeg","1680401893496-1.jpeg","1680401893497-4.jpeg","1680401893496-3.jpeg"],"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"ratingsQuantity":5,"_id":"6428e5e6dc1175abc65ca084","title":"Woman Standart Fit Knitted Cardigan","slug":"woman-standart-fit-knitted-cardigan","description":"Material\tPolyester Blend\nColour Name\tBeige\nDepartment\tWomen","quantity":222,"price":499,"priceAfterDiscount":449,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680401893316-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"createdAt":"2023-04-02T02:18:14.346Z","updatedAt":"2024-07-16T18:01:46.595Z","__v":0,"id":"6428e5e6dc1175abc65ca084"},{"sold":3952,"images":["1680402563676-2.jpeg","1680402563676-3.jpeg","1680402563677-4.jpeg","1680402563675-1.jpeg","1680402563677-5.jpeg"],"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"ratingsQuantity":10,"_id":"6428e884dc1175abc65ca096","title":"Woman Shawl","slug":"woman-shawl","description":"Material\tPolyester Blend\nColour Name\tBeige\nDepartment\tWomen","quantity":228,"price":349,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680402563605-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.2,"createdAt":"2023-04-02T02:29:24.696Z","updatedAt":"2024-07-16T18:01:46.595Z","__v":0,"id":"6428e884dc1175abc65ca096"},{"sold":9120,"images":["1680403266805-1.jpeg","1680403266806-3.jpeg","1680403266806-2.jpeg","1680403266807-4.jpeg"],"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"ratingsQuantity":18,"_id":"6428eb43dc1175abc65ca0b3","title":"Woman Shawl","slug":"woman-shawl","description":"Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen","quantity":220,"price":149,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"createdAt":"2023-04-02T02:41:07.506Z","updatedAt":"2024-07-16T22:31:35.117Z","__v":0,"id":"6428eb43dc1175abc65ca0b3"},{"sold":2847,"images":["1680401528923-1.jpeg","1680401528924-2.jpeg"],"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"ratingsQuantity":6,"_id":"6428e479dc1175abc65ca078","title":"Woman Socks","slug":"woman-socks","description":"Colour Name\tPink\nDepartment\tWomen\nMaterial Composition\tPolyester Blend","quantity":117,"price":199,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680401528864-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.3,"createdAt":"2023-04-02T02:12:09.566Z","updatedAt":"2024-07-16T18:01:46.595Z","__v":0,"id":"6428e479dc1175abc65ca078"},{"sold":2594,"images":["1680401672624-2.jpeg","1680401672623-1.jpeg","1680401672624-3.jpeg"],"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"ratingsQuantity":5,"_id":"6428e509dc1175abc65ca07e","title":"Relaxed Fit Knitted Joggers Lilac","slug":"relaxed-fit-knitted-joggers-lilac","description":"Colour Name\tPink\nDepartment\tWomen\nMaterial Composition\tPolyester Blend","quantity":222,"price":499,"priceAfterDiscount":189,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680401672268-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"createdAt":"2023-04-02T02:14:33.277Z","updatedAt":"2024-07-16T18:01:46.595Z","__v":0,"id":"6428e509dc1175abc65ca07e"},{"sold":863,"images":["1680395860011-4.jpeg","1680395860011-2.jpeg","1680395860010-1.jpeg","1680395860011-3.jpeg"],"subcategory":[{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048"}],"ratingsQuantity":17,"_id":"6428ce55dc1175abc65ca043","title":"Court Tennis Track Pants Black","slug":"court-tennis-track-pants-black","description":"Soft and sustainable polyester fabric\nElastic waist for comfortable fit\nMultiple pockets for quick storage\nWash according to care label instructions\nNike signature branding detail","quantity":170,"price":3159,"priceAfterDiscount":2199,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680395859874-cover.jpeg","category":{"_id":"6439d5b90049ad0b52b90048","name":"Men's Fashion","slug":"men's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511865180.jpeg"},"brand":{"_id":"64089c3924b25627a2531593","name":"Adidas","slug":"adidas","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285881943.png"},"ratingsAverage":2.8,"createdAt":"2023-04-02T00:37:41.008Z","updatedAt":"2024-07-16T12:03:24.019Z","__v":0,"id":"6428ce55dc1175abc65ca043"},{"sold":397,"images":["1680393143751-1.jpeg","1680393143752-3.jpeg","1680393143752-2.jpeg"],"subcategory":[{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048"}],"ratingsQuantity":3,"_id":"6428c3b8dc1175abc65ca00e","title":"Slim Fit Long Sleeve Dobby Men's Shirt","slug":"slim-fit-long-sleeve-dobby-men's-shirt","description":"Material\tCotton Blend\nColour Name\tBLUE\nDepartment\tMen\nMaterial Composition\tMAIN FABRIC: 64% Cotton 36% Polyester\nItem Pack Quantity\tSingle\nPack Size\tSingle\nModel Number\tW21770Z8-S7N-823090\nModel Name\tW21770Z8-S7N-823090","quantity":60,"price":549,"priceAfterDiscount":343,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680393143423-cover.jpeg","category":{"_id":"6439d5b90049ad0b52b90048","name":"Men's Fashion","slug":"men's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511865180.jpeg"},"brand":{"_id":"64089d9e24b25627a25315a5","name":"LC Waikiki","slug":"lc-waikiki","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678286238428.png"},"ratingsAverage":4.7,"createdAt":"2023-04-01T23:52:24.326Z","updatedAt":"2024-07-16T01:33:46.427Z","__v":0,"id":"6428c3b8dc1175abc65ca00e"},{"sold":5372,"images":["1680403397482-1.jpeg","1680403397482-2.jpeg","1680403397483-3.jpeg","1680403397485-4.jpeg"],"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"ratingsQuantity":18,"_id":"6428ebc6dc1175abc65ca0b9","title":"Woman Shawl","slug":"woman-shawl","description":"Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen","quantity":225,"price":170,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"createdAt":"2023-04-02T02:43:18.400Z","updatedAt":"2024-07-16T21:20:11.022Z","__v":0,"id":"6428ebc6dc1175abc65ca0b9"}]

class GetWishlistResponseDto extends GetWishlistResponseEntity{
  GetWishlistResponseDto({
      super.status,
      super.count,
      super.data,});

  GetWishlistResponseDto.fromJson(dynamic json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDto.fromJson(v));
      });
    }
  }



}


class Data {
  Data({
      this.sold, 
      this.images, 
      this.subcategory, 
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      });

  Data.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    id = json['id'];
  }
  int? sold;
  List<String>? images;
  List<Subcategory>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  Category? category;
  Brand? brand;
  double? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sold'] = sold;
    map['images'] = images;
    if (subcategory != null) {
      map['subcategory'] = subcategory?.map((v) => v.toJson()).toList();
    }
    map['ratingsQuantity'] = ratingsQuantity;
    map['_id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['description'] = description;
    map['quantity'] = quantity;
    map['price'] = price;
    map['imageCover'] = imageCover;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    map['ratingsAverage'] = ratingsAverage;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['id'] = id;
    return map;
  }

}

/// _id : "64089bbe24b25627a253158b"
/// name : "DeFacto"
/// slug : "defacto"
/// image : "https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"

class Brand {
  Brand({
      this.id, 
      this.name, 
      this.slug, 
      this.image,});

  Brand.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
  String? id;
  String? name;
  String? slug;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }

}

/// _id : "6439d58a0049ad0b52b9003f"
/// name : "Women's Fashion"
/// slug : "women's-fashion"
/// image : "https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"

class Category {
  Category({
      this.id, 
      this.name, 
      this.slug, 
      this.image,});

  Category.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
  String? id;
  String? name;
  String? slug;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }

}

/// _id : "6407f1bcb575d3b90bf95797"
/// name : "Women's Clothing"
/// slug : "women's-clothing"
/// category : "6439d58a0049ad0b52b9003f"

class Subcategory {
  Subcategory({
      this.id, 
      this.name, 
      this.slug, 
      this.category,});

  Subcategory.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
  String? id;
  String? name;
  String? slug;
  String? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    return map;
  }

}