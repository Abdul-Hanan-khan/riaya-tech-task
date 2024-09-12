class ProductModel {
  int? status;
  List<Data>? data;
  Meta? meta;

  ProductModel({this.status, this.data, this.meta});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

}

class Data {
  int? id;
  int? regularPrice;
  int? estimatedSaleCount;
  int? estimatedSaleUpdateDuration;
  int? estimatedViewCount;
  int quantity =0;
  double? salePrice;
  String? title;
  String? details;
  String? productCode;
  bool? onSale;
  String? color;
  String? identifier;
  String? depoterColor;
  String? lastSaleUpdate;
  List<Variants>? variants;
  String? coverImage;
  List<Gallery>? gallery;
  String? publishedAt;
  bool? isWishlist;

  Data(
      {this.id,
      this.regularPrice,
      this.estimatedSaleCount,
      this.estimatedSaleUpdateDuration,
      this.estimatedViewCount,
      this.salePrice,
      this.title,
      this.details,
      this.productCode,
      this.onSale,
      this.color,
      this.identifier,
      this.depoterColor,
      this.quantity =0,
      this.lastSaleUpdate,
      this.variants,
      this.coverImage,
      this.gallery,
      this.publishedAt,
      this.isWishlist});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    regularPrice = json['regular_price'];
    estimatedSaleCount = json['estimated_sale_count'];
    estimatedSaleUpdateDuration = json['estimated_sale_update_duration'];
    estimatedViewCount = json['estimated_view_count'];
    salePrice = json['sale_price'].toDouble();
    title = json['title'];
    details = json['details'];
    productCode = json['product_code'];
    onSale = json['on_sale'];
    color = json['color'];
    identifier = json['identifier'];
    depoterColor = json['depoter_color'];
    quantity = json['quantity']??0;
    lastSaleUpdate = json['last_sale_update'];
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(new Variants.fromJson(v));
      });
    }
    coverImage = json['cover_image'];
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(new Gallery.fromJson(v));
      });
    }
    publishedAt = json['published_at'];
    isWishlist = json['is_wishlist'];
  }

}

class Variants {
  int? id;
  String? sku;
  int? quantity;
  String? size;
  int? regularPrice;
  int? salePrice;

  Variants(
      {this.id,
      this.sku,
      this.quantity,
      this.size,
      this.regularPrice,
      this.salePrice});

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    quantity = json['quantity'];
    size = json['size'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
  }
}

class Gallery {
  String? url;

  Gallery({this.url});

  Gallery.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

}

class Meta {
  String? next;
  String? previous;
  int? perPage;
  int? currentPage;
  int? total;

  Meta({this.next, this.previous, this.perPage, this.currentPage, this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    next = json['next'];
    previous = json['previous'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    total = json['total'];
  }
}
