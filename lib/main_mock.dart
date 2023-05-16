import 'package:coin_master/flavor_config.dart';

void main() {
  final mockConfig = FlavorConfig();
  mockConfig.flavorType = FlavorType.mock;
  mockConfig.setFlavorPermission(Feature.mockOption, true);
  
}
