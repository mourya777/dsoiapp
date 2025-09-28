import 'dart:convert';

class SubCategoryModel {
  final String scatId;
  final String scatTitle;
  final String scatType;

  SubCategoryModel({
    required this.scatId,
    required this.scatTitle,
    required this.scatType,
  });

  factory SubCategoryModel.fromMap(Map<String, dynamic> map) {
    return SubCategoryModel(
      scatId: map['scat_id']?.toString() ?? '',
      scatTitle: map['scat_title']?.toString() ?? '',
      scatType: map['scat_type']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'scat_id': scatId, 'scat_title': scatTitle, 'scat_type': scatType};
  }
}

class CategoryModel {
  final String catId;
  final String title;
  final List<SubCategoryModel> subCategories;

  CategoryModel({
    required this.catId,
    required this.title,
    required this.subCategories,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      catId: map['cat_id']?.toString() ?? '',
      title: map['title']?.toString() ?? '',
      subCategories:
      (map['subcat'] as List<dynamic>?)
          ?.map((e) => SubCategoryModel.fromMap(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cat_id': catId,
      'title': title,
      'subcat': subCategories.map((e) => e.toMap()).toList(),
    };
  }
}

class MenuModel {
  final List<CategoryModel> categories;

  MenuModel({required this.categories});

  factory MenuModel.fromJson(String source) {
    final Map<String, dynamic> data = json.decode(source);
    return MenuModel(
      categories: (data['Record'] as List<dynamic>)
          .map((e) => CategoryModel.fromMap(e))
          .toList(),
    );
  }

  String toJson() {
    return json.encode({'Record': categories.map((e) => e.toMap()).toList()});
  }
}
