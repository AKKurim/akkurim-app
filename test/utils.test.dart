import 'package:flutter_test/flutter_test.dart';
import 'package:ak_kurim_app/utils/utils.dart';

void main() {
  group('Utils Tests', () {
    test('should check if a current version is greater or equal to minimal',
        () {
      final result = Utils.ensureMinimumVersion(
          currentVersion: "2.0.0", minimumVersion: "2.0.0");
      expect(result, true);

      final result2 = Utils.ensureMinimumVersion(
          currentVersion: "2.1.0", minimumVersion: "2.0.1");
      expect(result2, true);

      final result3 = Utils.ensureMinimumVersion(
          currentVersion: "2.0.0", minimumVersion: "2.1.0");
      expect(result3, false);
    });
  });
}
