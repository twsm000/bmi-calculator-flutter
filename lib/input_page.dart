import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'reusable_card.dart';
import 'icon_labeled.dart';
import 'constant_types.dart';
import 'rounded_icon_button.dart';
import 'routes.dart';

class Gender {
  String name;
  Color cardColor;
  Color iconColor;

  Gender({this.name, this.cardColor, this.iconColor});
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender _male = Gender(
    name: "MALE",
    cardColor: inactiveCardColor,
    iconColor: inactiveLabelColor,
  );
  Gender _female = Gender(
    name: "FEMALE",
    cardColor: inactiveCardColor,
    iconColor: inactiveLabelColor,
  );
  Gender selectedGender = Gender();
  double height = 186;
  double weight = 96;
  double age = 26;

  void updateColor(Gender newActiveGender) {
    this.selectedGender.cardColor = inactiveCardColor;
    this.selectedGender.iconColor = inactiveLabelColor;

    newActiveGender.cardColor = activeCardColor;
    newActiveGender.iconColor = Colors.white;

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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: labelTextStyle,
                          ),
                          Text(
                            this.weight.toInt().toString(),
                            style: numberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    this.weight--;
                                  });
                                },
                                icon: Icon(FontAwesomeIcons.minus),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    this.weight++;
                                  });
                                },
                                icon: Icon(FontAwesomeIcons.plus),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: ReusableCard(
                      color: activeCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: labelTextStyle,
                          ),
                          Text(
                            this.age.toInt().toString(),
                            style: numberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    this.age--;
                                  });
                                },
                                icon: Icon(FontAwesomeIcons.minus),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    this.age++;
                                  });
                                },
                                icon: Icon(FontAwesomeIcons.plus),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              AppRoutes.result.navigateFrom(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  "CALCULATE",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            ),
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
              color: this._male.cardColor,
              child: IconLabeled(
                icon: FontAwesomeIcons.mars,
                iconColor: this._male.iconColor,
                label: this._male.name,
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
              color: this._female.cardColor,
              child: IconLabeled(
                icon: FontAwesomeIcons.venus,
                iconColor: this._female.iconColor,
                label: this._female.name,
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
          inactiveTrackColor: inactiveLabelColor,
          activeTrackColor: activeSliderColor,
          thumbColor: bottomContainerColor,
          overlayColor: overlaySliderColor,
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 15,
          ),
          overlayShape: RoundSliderOverlayShape(
            overlayRadius: 23,
          ),
        ),
        child: Slider(
          value: height,
          min: minHeight,
          max: maxHeight,
          inactiveColor: inactiveLabelColor,
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
