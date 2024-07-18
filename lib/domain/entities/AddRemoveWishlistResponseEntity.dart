/// status : "success"
/// message : "Product removed successfully to your wishlist"
/// data : ["6428ead5dc1175abc65ca0ad","6428e997dc1175abc65ca0a1","6428e5e6dc1175abc65ca084","6428e884dc1175abc65ca096","6428eb43dc1175abc65ca0b3","6428e479dc1175abc65ca078","6428e509dc1175abc65ca07e","6428ce55dc1175abc65ca043","6428c3b8dc1175abc65ca00e","6428ebc6dc1175abc65ca0b9"]

class AddRemoveWishlistResponseEntity {
  AddRemoveWishlistResponseEntity({
      this.status, 
      this.message, 
      this.data,});


  String? status;
  String? message;
  List<String>? data;



}