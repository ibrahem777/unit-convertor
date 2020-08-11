import './converter.dart';

class DistanceConverter extends UnitConverter {
  @override
  List<String> getUnitsList() {
    return ['meter', 'yard', 'foot', 'JR'];
  }

  @override
  Map<String, double> getUnitsRates() {
    return {
      'meter': 1.0,
      'yard': 0.9144,
      'foot': 0.3048,
      'inch': 0.0254,
    };
  }
}
