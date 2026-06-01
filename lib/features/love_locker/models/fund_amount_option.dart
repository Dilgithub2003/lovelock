/// Preset or custom fund amount option for the Add Funds screen.
class FundAmountOption {
  const FundAmountOption({
    required this.amountLabel,
    required this.pointsLabel,
    this.isCustom = false,
  });

  final String amountLabel;
  final String pointsLabel;
  final bool isCustom;
}
