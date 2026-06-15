import 'package:flutter/material.dart';
import 'package:love_lock/features/shopping/data/shopping_sample_data.dart';
import 'package:love_lock/features/shopping/models/gift_experience.dart';
import 'package:love_lock/features/shopping/models/gift_experience_detail.dart';
import 'package:love_lock/features/shopping/models/gift_experience_inclusion.dart';

/// Detail content keyed by gift experience id.
abstract final class ShoppingExperienceDetails {
  static GiftExperience? findExperience(String id) {
    for (final item in ShoppingSampleData.catalogExperiences) {
      if (item.id == id) return item;
    }
    for (final item in ShoppingSampleData.experiences) {
      if (item.id == id) return item;
    }
    return null;
  }

  static GiftExperienceDetail? detailFor(String id) {
    final experience = findExperience(id);
    if (experience == null) return null;
    return _details[id] ?? _defaultDetail(experience);
  }

  static GiftExperienceDetail _defaultDetail(GiftExperience experience) {
    return GiftExperienceDetail(
      experience: experience,
      badgeLabel: 'EXCLUSIVE EXPERIENCE',
      rating: 4.8,
      reviewCount: 96,
      priceUsd: 399,
      priceSubtitle: 'ALL INCLUSIVE FOR TWO',
      inclusions: const [
        GiftExperienceInclusion(
          icon: Icons.restaurant_menu_outlined,
          title: 'Curated Menu',
          subtitle: 'Chef-selected seasonal pairings',
        ),
        GiftExperienceInclusion(
          icon: Icons.wine_bar_outlined,
          title: 'Premium Drinks',
          subtitle: 'Sommelier-guided selections',
        ),
        GiftExperienceInclusion(
          icon: Icons.music_note_outlined,
          title: 'Ambient Experience',
          subtitle: 'Live or curated soundtrack',
        ),
        GiftExperienceInclusion(
          icon: Icons.lock_outline_rounded,
          title: 'Custom Love Lock',
          subtitle: 'Engraved and placed in our vault',
        ),
      ],
      narrativeParagraphs: [
        experience.description,
        'Every moment is designed to celebrate your bond with thoughtful '
            'details, private settings, and an atmosphere that invites you '
            'to be fully present together.',
      ],
    );
  }

  static final Map<String, GiftExperienceDetail> _details = {
    'romantic-picnic': GiftExperienceDetail(
      experience: ShoppingSampleData.catalogExperiences[0],
      badgeLabel: 'EXCLUSIVE EXPERIENCE',
      rating: 4.9,
      reviewCount: 128,
      priceUsd: 499,
      priceSubtitle: 'ALL INCLUSIVE FOR TWO',
      inclusions: const [
        GiftExperienceInclusion(
          icon: Icons.restaurant_outlined,
          title: '6-Course Tasting',
          subtitle: 'Chef-curated seasonal delicacies',
        ),
        GiftExperienceInclusion(
          icon: Icons.wine_bar_outlined,
          title: 'Vintage Pairings',
          subtitle: 'Selected by master sommelier',
        ),
        GiftExperienceInclusion(
          icon: Icons.music_note_outlined,
          title: 'Live Serenade',
          subtitle: 'Private acoustic performer',
        ),
        GiftExperienceInclusion(
          icon: Icons.lock_outline_rounded,
          title: 'Custom Love Lock',
          subtitle: 'Engraved and placed in our vault',
        ),
      ],
      narrativeParagraphs: const [
        'Surrender to an evening where time dissolves and only the two of you '
            'remain. Nested in our private alcove, this experience is more '
            'than a meal; it\'s a curated journey through taste, scent, and '
            'sound designed to celebrate your unique bond.',
        'Under the soft glow of hand-poured beeswax candles and the gentle '
            'hum of live acoustic strings, you will indulge in a six-course '
            'seasonal menu, each paired with vintage reserves selected by our '
            'master sommelier.',
      ],
    ),
    'serenity-spa': GiftExperienceDetail(
      experience: ShoppingSampleData.catalogExperiences[1],
      badgeLabel: 'EXCLUSIVE EXPERIENCE',
      rating: 4.9,
      reviewCount: 112,
      priceUsd: 449,
      priceSubtitle: 'ALL INCLUSIVE FOR TWO',
      inclusions: const [
        GiftExperienceInclusion(
          icon: Icons.spa_outlined,
          title: 'Couples Massage',
          subtitle: '90-minute heated stone therapy',
        ),
        GiftExperienceInclusion(
          icon: Icons.water_drop_outlined,
          title: 'Aromatherapy Suite',
          subtitle: 'Private relaxation lounge access',
        ),
        GiftExperienceInclusion(
          icon: Icons.local_florist_outlined,
          title: 'Botanical Rituals',
          subtitle: 'Organic oils and floral bath soak',
        ),
        GiftExperienceInclusion(
          icon: Icons.lock_outline_rounded,
          title: 'Custom Love Lock',
          subtitle: 'Engraved and placed in our vault',
        ),
      ],
      narrativeParagraphs: const [
        'Step into a sanctuary where every sense is awakened and restored. '
            'This retreat is crafted for couples seeking stillness, renewal, '
            'and unhurried connection away from the world.',
        'From warm stone massage to a private aromatherapy suite, each ritual '
            'is sequenced to help you arrive together, breathe deeply, and '
            'leave feeling renewed in body and spirit.',
      ],
    ),
    'sunset-cruise': GiftExperienceDetail(
      experience: ShoppingSampleData.catalogExperiences[2],
      badgeLabel: 'EXCLUSIVE EXPERIENCE',
      rating: 4.8,
      reviewCount: 94,
      priceUsd: 549,
      priceSubtitle: 'ALL INCLUSIVE FOR TWO',
      inclusions: const [
        GiftExperienceInclusion(
          icon: Icons.directions_boat_outlined,
          title: 'Private Cruise',
          subtitle: 'Sunset route with dedicated captain',
        ),
        GiftExperienceInclusion(
          icon: Icons.local_bar_outlined,
          title: 'Champagne Service',
          subtitle: 'Vintage flutes and chilled reserve',
        ),
        GiftExperienceInclusion(
          icon: Icons.photo_camera_outlined,
          title: 'Memory Capture',
          subtitle: 'Professional golden-hour photos',
        ),
        GiftExperienceInclusion(
          icon: Icons.lock_outline_rounded,
          title: 'Custom Love Lock',
          subtitle: 'Engraved and placed in our vault',
        ),
      ],
      narrativeParagraphs: const [
        'Glide across the water as the sky turns gold and the city fades '
            'into the horizon. This cruise is an invitation to slow down, '
            'toast to your story, and watch the day dissolve together.',
        'With champagne service, a private route, and a photographer to '
            'capture the moment, every detail is arranged so you can focus '
            'entirely on each other.',
      ],
    ),
  };
}
