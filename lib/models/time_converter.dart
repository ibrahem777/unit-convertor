import './converter.dart';

class TimeConverter extends UnitConverter{
  @override
  List<String> getUnitsList() {
    return['millisecond','second','minute','hour',];
  }

  @override
  Map<String, double> getUnitsRates() {
    
    return{'millisecond':0.001,'second':1.0,'minute':60,'hour':3600,};
  }

}