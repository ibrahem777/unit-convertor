import './converter.dart';
import './currency_converter.dart';
import './distance_converter.dart';
import './time_converter.dart';
enum ConverterType{
  CurruncyConverter,
}
class ConverterFactory{

 static UnitConverter factoryMethod(String instenceType){
switch (instenceType) {
  case 'Curruncy':
    return CurruncyConverter();
    break;
     case 'Time':
    return TimeConverter();
    break;
    case 'Distance':
    return DistanceConverter();
    break;
  
}
  }
}