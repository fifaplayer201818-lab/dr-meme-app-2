class SubscriptionService {
  // Demo mode: change this to false to test locked subscription screen.
  bool active = true;
  DateTime subscriptionEndDate = DateTime.now().add(const Duration(days: 30));

  bool get isActive => active && subscriptionEndDate.isAfter(DateTime.now());
}

final subscriptionService = SubscriptionService();
