import 'package:coin_master/flavor_config.dart';
import 'package:coin_master/main_common.dart';

void main() {
  final mockConfig = FlavorConfig();
  mockConfig.flavorType = FlavorType.mock;
  mockConfig.setFlavorPermission(Feature.mockOption, true);
  mainCommon(mockConfig);
}
