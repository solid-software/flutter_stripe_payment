import 'dart:async';

import 'package:flutter/services.dart';

class StripeSource {
  static const MethodChannel _channel = const MethodChannel('stripe_payment');

  /// opens the stripe dialog to add a new card
  /// if the source has been successfully added the card token will be returned
  static Future<String> addSource() async {
    final String token = await _channel.invokeMethod('addSource');
    return token;
  }

  static bool _publishableKeySet = false;

  static bool get ready => _publishableKeySet;

  /// set the publishable key that stripe should use
  /// call this once and before you use [addSource]
  static Future<void> setPublishableKey(String apiKey) async {
    await _channel.invokeMethod('setPublishableKey', apiKey);
    _publishableKeySet = true;
  }
}
