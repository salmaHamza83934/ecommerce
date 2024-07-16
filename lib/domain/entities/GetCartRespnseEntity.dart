import 'package:ecommerce_app/domain/entities/CategoryOrBrandsResponseEntity.dart';

/// status : "success"
/// numOfCartItems : 6
/// data : {"_id":"66942942ed0dc0016ca529d4","cartOwner":"668efdf8ed0dc0016c98b95a","products":[{"count":1,"_id":"66942942ed0dc0016ca529d5","product":{"subcategory":[{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048"}],"_id":"6428dd2edc1175abc65ca055","title":"ESS Big Logo Hoodie TR Puma Black","quantity":200,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680399661234-cover.jpeg","category":{"_id":"6439d5b90049ad0b52b90048","name":"Men's Fashion","slug":"men's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511865180.jpeg"},"brand":{"_id":"64089d5c24b25627a253159f","name":"Puma","slug":"puma","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678286172219.png"},"ratingsAverage":4.8,"id":"6428dd2edc1175abc65ca055"},"price":2649},{"count":1,"_id":"66942943ed0dc0016ca529de","product":{"subcategory":[{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048"}],"_id":"6428de2adc1175abc65ca05b","title":"Softride Enzo NXT CASTLEROCK-High Risk R","quantity":173,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680399913757-cover.jpeg","category":{"_id":"6439d5b90049ad0b52b90048","name":"Men's Fashion","slug":"men's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511865180.jpeg"},"brand":{"_id":"64089d5c24b25627a253159f","name":"Puma","slug":"puma","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678286172219.png"},"ratingsAverage":2.8,"id":"6428de2adc1175abc65ca05b"},"price":2999},{"count":1,"_id":"66942944ed0dc0016ca529e6","product":{"subcategory":[{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048"}],"_id":"6428def9dc1175abc65ca061","title":"Orca Leather Boots Anthracite","quantity":273,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680400120400-cover.jpeg","category":{"_id":"6439d5b90049ad0b52b90048","name":"Men's Fashion","slug":"men's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511865180.jpeg"},"brand":{"_id":"64089dc924b25627a25315a8","name":"Jack & Jones","slug":"jack-and-jones","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678286281363.png"},"ratingsAverage":4.9,"id":"6428def9dc1175abc65ca061"},"price":4829},{"count":2,"_id":"66956e58ed0dc0016ca788b0","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428ebc6dc1175abc65ca0b9","title":"Woman Shawl","quantity":225,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428ebc6dc1175abc65ca0b9"},"price":170},{"count":2,"_id":"669570a6ed0dc0016ca78a8e","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428ead5dc1175abc65ca0ad","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403156501-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428ead5dc1175abc65ca0ad"},"price":149},{"count":1,"_id":"669570dfed0dc0016ca78acc","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428e997dc1175abc65ca0a1","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680402838276-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428e997dc1175abc65ca0a1"},"price":149}],"createdAt":"2024-07-14T19:38:42.223Z","updatedAt":"2024-07-15T18:56:31.294Z","__v":10,"totalCartPrice":11264}

class GetCartResponseEntity {
  GetCartResponseEntity({
      this.status, 
      this.numOfCartItems, 
      this.data,});

  String? status;
  int? numOfCartItems;
  GetCartDataEntity? data;


}


class GetCartDataEntity {
  GetCartDataEntity({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  String? id;
  String? cartOwner;
  List<GetProductCartEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;


}


class GetProductCartEntity {
  GetProductCartEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  int? count;
  String? id;
  ProductDataCartEntity? product;
  int? price;


}


class ProductDataCartEntity {
  ProductDataCartEntity({
      this.id,
      this.title, 
      this.quantity, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage,});

  String? id;
  String? title;
  int? quantity;
  String? imageCover;
  CategoryOrBrandsEntity? category;
  CategoryOrBrandsEntity? brand;
  double? ratingsAverage;


}


