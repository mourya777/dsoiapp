class Product {
  String prdId;
  String prdName;
  String prdPrice;
  String prdStock;
  String prdDesc;
  String prdType;

  Product({
    required this.prdId,
    required this.prdName,
    required this.prdPrice,
    required this.prdStock,
    required this.prdDesc,
    required this.prdType,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      prdId: json['prd_id'] ?? '',
      prdName: json['prd_name'] ?? '',
      prdPrice: json['prd_price'] ?? '',
      prdStock: json['prd_stock'] ?? '',
      prdDesc: json['prd_desc'] ?? '',
      prdType: json['prd_type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'prd_id': prdId,
      'prd_name': prdName,
      'prd_price': prdPrice,
      'prd_stock': prdStock,
      'prd_desc': prdDesc,
      'prd_type': prdType,
    };
  }
}
