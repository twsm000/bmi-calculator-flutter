import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'reusable_card.dart';
import 'icon_labeled.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);
const bottomContainerHeight = 80.0;

class Gender {
  String name;
  Color color;

  Gender({this.name, this.color});
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender _male = Gender(name: "MALE", color: inactiveCardColor);
  Gender _female = Gender(name: "FEMALE", color: inactiveCardColor);
  Gender selectedGender = Gender();

  void updateColor(Gender newActiveGender) {
    this.selectedGender.color = inactiveCardColor;
    newActiveGender.color = activeCardColor;
    this.selectedGender = newActiveGender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          _getButtonsMaleFemale(),
          Expanded(
            flex: 1,
            child: ReusableCard(
              color: activeCardColor,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: ReusableCard(
                      color: activeCardColor,
                    )),
                Expanded(
                    flex: 1,
                    child: ReusableCard(
                      color: activeCardColor,
                    )),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }

  Widget _getButtonsMaleFemale() {
    return Expanded(
      flex: 1,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ReusableCard(
              onPress: () {
                setState(() {
                  updateColor(this._male);
                });
              },
              color: this._male.color,
              child: IconLabeled(
                FontAwesomeIcons.mars,
                this._male.name,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ReusableCard(
              onPress: () {
                setState(() {
                  updateColor(this._female);
                });
              },
              color: this._female.color,
              child: IconLabeled(
                FontAwesomeIcons.venus,
                this._female.name,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
