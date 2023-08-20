enum EndPoints { items, details }

enum FlavorType { preProd, prod, uat, mock }

enum Feature { finArtSms, mockOption }

class FlavorConfig {
  late FlavorType flavorType;
  late Map<EndPoints, String> apiEndpoints;
  final Map<Feature, bool> _flavorFeatures = {
    Feature.finArtSms: true,
  };

  setFlavorPermission(Feature featureName, bool value) {
    _flavorFeatures[featureName] = value;
  }

  bool getFlavorPermission(Feature featureName) =>
      _flavorFeatures[featureName] ?? false;
}
