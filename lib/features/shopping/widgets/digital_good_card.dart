import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:love_lock/core/theme/app_colors.dart';
import 'package:love_lock/features/shopping/models/digital_good.dart';
import 'package:love_lock/features/shopping/models/voucher_detail.dart';
import 'package:love_lock/routes/app_routes.dart';

/// Digital voucher card for the shopping catalog.
class DigitalGoodCard extends StatelessWidget {
  const DigitalGoodCard({
    super.key,
    required this.item,
    this.width = 200,
    this.onTap,
  });

  final DigitalGood item;
  final double width;
  final VoidCallback? onTap;

  void _handleTap(BuildContext context) {
    if (onTap != null) {
      onTap!();
      return;
    }
    context.push(
      AppRoutes.voucherDetail,
      extra: VoucherDetailArgs(voucherId: item.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final formattedPoints = _formatPoints(item.lovePoints);

    return SizedBox(
      width: width,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _handleTap(context),
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 16 / 10,
                  child: Image.asset(
                    item.imageAsset,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                item.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.onBackground,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                item.subtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                  letterSpacing: 0.4,
                  fontWeight: FontWeight.w600,
                  color: AppColors.onBackground.withValues(alpha: 0.5),
                ),
              ),
              const SizedBox(height: 4),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: formattedPoints,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                    TextSpan(
                      text: ' LOVEPOINTS',
                      style: TextStyle(
                        fontSize: 10,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onBackground.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatPoints(int points) {
    final text = points.toString();
    final buffer = StringBuffer();
    for (var i = 0; i < text.length; i++) {
      final fromEnd = text.length - i;
      buffer.write(text[i]);
      if (fromEnd > 1 && fromEnd % 3 == 1) {
        buffer.write(',');
      }
    }
    return buffer.toString();
  }
}
