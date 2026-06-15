/// Category filters on the shopping home screen.
enum ShoppingCategory {
  all,
  experiences,
  digitalGoods,
}

extension ShoppingCategoryLabel on ShoppingCategory {
  String get label {
    switch (this) {
      case ShoppingCategory.all:
        return 'All';
      case ShoppingCategory.experiences:
        return 'Experiences';
      case ShoppingCategory.digitalGoods:
        return 'Digital Goods';
    }
  }
}
