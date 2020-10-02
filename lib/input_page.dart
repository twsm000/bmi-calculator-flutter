import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'reusable_card.dart';
import 'icon_labeled.dart';
import 'constant_types.dart';

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
  double height = 180;

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _getButtonsMaleAndFemale(),
          Expanded(
            flex: 1,
            child: ReusableCard(
              color: activeCardColor,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        "HEIGHT",
                        style: labelTextStyle,
                      ),
                    ),
                  ),
                  _getHeight(),
                  _getSlider(),
                ],
              ),
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

  Widget _getButtonsMaleAndFemale() {
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

  Widget _getHeight() {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            height.toInt().toString(),
            style: numberTextStyle,
          ),
          Text(
            " cm",
            style: labelTextStyle,
          )
        ],
      ),
    );
  }

  Widget _getSlider() {
    return Expanded(
      flex: 1,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          inactiveTrackColor: inactiveSliderColor,
          activeTrackColor: activeSliderColor,
          thumbColor: bottomContainerColor,
          overlayColor: overlaySliderColor,
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 15,
          ),
          overlayShape: RoundSliderOverlayShape(
            overlayRadius: 30,
          ),
        ),
        child: Slider(
          value: height,
          min: minHeight,
          max: maxHeight,
          inactiveColor: inactiveSliderColor,
          onChanged: (double value) {
            setState(() {
              height = value;
            });
          },
        ),
      ),
    );
  }
}
