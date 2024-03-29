import 'package:coin_master/firebase_options.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test on Current platform getter', () {

    test('return android option for Android platform', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      final options = DefaultFirebaseOptions.currentPlatform;
      expect(options, equals(DefaultFirebaseOptions.android));
    });

    test('return ios option for ios platform', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      final options = DefaultFirebaseOptions.currentPlatform;
      expect(options, equals(DefaultFirebaseOptions.ios));
    });
    
    test('throws UnsupportedError for unsupported platforms', () {
      for(final unsupportedPlatform in [
        TargetPlatform.windows,
        TargetPlatform.linux,
        TargetPlatform.macOS,
      ]){
        debugDefaultTargetPlatformOverride = unsupportedPlatform ;
        expect(()=>DefaultFirebaseOptions.currentPlatform, throwsUnsupportedError);
      }
    });
  });
}