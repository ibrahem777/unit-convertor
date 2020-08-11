import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/converter.dart';

class HeaderWidget extends StatelessWidget {
  Function setFromUnit;
  Function setToUnit;
  UnitConverter converterInstance;
  Function setAmount;
  HeaderWidget(this.converterInstance,this.setFromUnit,this.setToUnit,this.setAmount);
  @override
  Widget build(BuildContext context) {
    return  Row(
            children: <Widget>[
              Expanded(
                child: CupertinoPicker(
                    itemExtent: 50,
                    onSelectedItemChanged: (val) {
                      setFromUnit(val);
                    },
                    children: converterInstance
                        .getUnitsList()
                        .map((e) => FittedBox(child: Text(e)))
                        .toList()),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Amount'),
                 keyboardType: TextInputType.number,
                  onChanged: (val) {
                    
                   setAmount(val);
                  
                  },
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                    itemExtent: 50,
                    onSelectedItemChanged: (val) {
                      setToUnit(val);
                    },
                    children: converterInstance
                        .getUnitsList()
                        .map((e) => Text(e))
                        .toList()),
              ),
            ],
          );
  }
}