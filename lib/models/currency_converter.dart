import './converter.dart';

class CurruncyConverter extends UnitConverter{
  @override
  List<String> getUnitsList() {
    return['USD','IS','EGY','JR'];
  }

  @override
  Map<String, double> getUnitsRates() {
    
    return{'USD':3.5,'IS':1.0,'EGY':0.27,'JR':5.2,};
  }

}