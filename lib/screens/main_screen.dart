import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/converter.dart';
import '../models/converterfactory.dart';
import '../models/currency_converter.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController controller = TextEditingController();
  UnitConverter converterInstance = CurruncyConverter();
  var fromUnit = 'USD';
  var toUnit = 'USD';
  var amount = 1.0;
  var result = 1.0;
  int fromIndex;
  int toIndex;
  void setFromUnit(val) {
    print('set from');
    fromUnit = converterInstance.getUnitsList()[val];
    fromIndex=val;
    calcuulate();
  }

  void setAmount(val) {
        print('set amount');

    amount = double.parse(val);
    print(amount);
    calcuulate();
  }

  void setToUnit(val) {
    toIndex=val;
        print('set to');

    toUnit = converterInstance.getUnitsList()[val];
    calcuulate();
  }

  void calcuulate() {
        print('calculate ');

    setState(() {
      result = (converterInstance.getUnitsRates()[fromUnit] /
              converterInstance.getUnitsRates()[toUnit]) *
          amount;
    });
    print(result);
  }
  String dropdownValue = 'Curruncy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('unit converter'),
      ),
      body: Column(children: <Widget>[
        DropdownButton<String>(
          value: dropdownValue,
          elevation: 0,
          items: <DropdownMenuItem<String>>[
        DropdownMenuItem<String>(
          value: 'Curruncy',
          child: Text('Curruncy'),
        ),
         DropdownMenuItem<String>(
          value: 'Time',
          child: Text('Time'),
        ),
         DropdownMenuItem<String>(
          value: 'Distance',
          child: Text('Distance'),
        ),
          ],
          onChanged: (String value) {
        setState(() {
          dropdownValue=value;
          converterInstance=ConverterFactory.factoryMethod(value);
         fromUnit = converterInstance.getUnitsList()[fromIndex];
         toUnit = converterInstance.getUnitsList()[toIndex];
         calcuulate();

        });
          },
        ),
        Expanded(
            child: HeaderWidget(
                converterInstance, setFromUnit, setToUnit, setAmount)),
        Expanded(child: FooterWidget(result)),
      ]),
    );
  }
}
