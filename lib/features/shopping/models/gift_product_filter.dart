/// Product type used for filtering on the gifts catalog screen.
enum GiftProductType {
  experience,
  physical,
}

extension GiftProductTypeLabel on GiftProductType {
  String get filterLabel {
    switch (this) {
      case GiftProductType.experience:
        return 'Experiences';
      case GiftProductType.physical:
        return 'Physical';
    }
  }
}

/// Filter options on the gifts catalog screen.
enum GiftProductFilter {
  all,
  experiences,
  physical,
}

extension GiftProductFilterLabel on GiftProductFilter {
  String get label {
    switch (this) {
      case GiftProductFilter.all:
        return 'All';
      case GiftProductFilter.experiences:
        return 'Experiences';
      case GiftProductFilter.physical:
        return 'Physical';
    }
  }
}
