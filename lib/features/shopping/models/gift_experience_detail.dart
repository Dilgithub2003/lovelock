import 'package:love_lock/features/shopping/models/gift_experience.dart';
import 'package:love_lock/features/shopping/models/gift_experience_inclusion.dart';

/// Full detail payload for a gift experience detail screen.
class GiftExperienceDetail {
  const GiftExperienceDetail({
    required this.experience,
    required this.badgeLabel,
    required this.rating,
    required this.reviewCount,
    required this.priceUsd,
    required this.priceSubtitle,
    required this.inclusions,
    required this.narrativeParagraphs,
  });

  final GiftExperience experience;
  final String badgeLabel;
  final double rating;
  final int reviewCount;
  final int priceUsd;
  final String priceSubtitle;
  final List<GiftExperienceInclusion> inclusions;
  final List<String> narrativeParagraphs;
}

/// Route argument — experience id to resolve from sample data.
class GiftExperienceDetailArgs {
  const GiftExperienceDetailArgs({required this.experienceId});

  final String experienceId;
}
