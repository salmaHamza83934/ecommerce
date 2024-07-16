/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 6
/// data : {"_id":"66942942ed0dc0016ca529d4","cartOwner":"668efdf8ed0dc0016c98b95a","products":[{"count":1,"_id":"66942942ed0dc0016ca529d5","product":"6428dd2edc1175abc65ca055","price":2649},{"count":1,"_id":"66942943ed0dc0016ca529de","product":"6428de2adc1175abc65ca05b","price":2999},{"count":1,"_id":"66942944ed0dc0016ca529e6","product":"6428def9dc1175abc65ca061","price":4829},{"count":1,"_id":"66942947ed0dc0016ca529ee","product":"6428d132dc1175abc65ca04f","price":2449},{"count":1,"_id":"66942949ed0dc0016ca529f6","product":"6428cf07dc1175abc65ca049","price":1079},{"count":3,"_id":"66948518ed0dc0016ca68b40","product":"6428ebc6dc1175abc65ca0b9","price":170}],"createdAt":"2024-07-14T19:38:42.223Z","updatedAt":"2024-07-15T03:10:56.090Z","__v":5,"totalCartPrice":14515}

class AddToCartResponseEntity {
  AddToCartResponseEntity({
      this.status, 
      this.message, 
      this.numOfCartItems, 
      this.data,});

  String? status;
  String? message;
  int? numOfCartItems;
  CartDataEntity? data;


}


class CartDataEntity {
  CartDataEntity({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});


  String? id;
  String? cartOwner;
  List<AddProductCartEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;


}


class AddProductCartEntity {
  AddProductCartEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  int? count;
  String? id;
  String? product;
  int? price;


}