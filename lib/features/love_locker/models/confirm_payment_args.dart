import 'package:love_lock/features/love_locker/widgets/payment_method_tile.dart';

/// Navigation args for the confirm payment screen.
class ConfirmPaymentArgs {
  const ConfirmPaymentArgs({
    required this.amount,
    this.serviceFee = 0,
    required this.paymentMethod,
  });

  final double amount;
  final double serviceFee;
  final PaymentMethod paymentMethod;

  double get total => amount + serviceFee;
}
