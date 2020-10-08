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
          _getMaleAndFemaleCards(),
          _getSliderCard(),
          _getWeightAndAgeCards(),
          _getButtonCalculate(),
        ],
      ),
    );
  }

  Widget _getMaleAndFemaleCards() {
    Widget getCardMale() {
      return Expanded(
        flex: 1,
        child: ReusableCard(
          onPress: () {
            setState(() {
              updateColor(this._male);
            });
          },
          margin: EdgeInsets.only(
            left: defaultMargin,
            top: defaultMargin,
            right: minMargin,
            bottom: minMargin,
          ),
          color: this._male.cardColor,
          child: IconLabeled(
            icon: FontAwesomeIcons.mars,
            iconColor: this._male.iconColor,
            label: this._male.name,
          ),
        ),
      );
    }

    Widget getCardFemale() {
      return Expanded(
        flex: 1,
        child: ReusableCard(
          onPress: () {
            setState(() {
              updateColor(this._female);
            });
          },
          margin: EdgeInsets.only(
            left: minMargin,
            top: defaultMargin,
            right: defaultMargin,
            bottom: minMargin,
          ),
          color: this._female.cardColor,
          child: IconLabeled(
            icon: FontAwesomeIcons.venus,
            iconColor: this._female.iconColor,
            label: this._female.name,
          ),
        ),
      );
    }

    return Expanded(
      flex: 1,
      child: Row(
        children: [
          getCardMale(),
          getCardFemale(),
        ],
      ),
    );
  }

  Widget _getSliderCard() {
    Widget getTextHeight() {
      return Expanded(
        flex: 1,
        child: Center(
          child: Text(
            "HEIGHT",
            style: labelTextStyle,
          ),
        ),
      );
    }

    Widget getUserHeight() {
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

    Widget getUserHeightSlider() {
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

    return Expanded(
      flex: 1,
      child: ReusableCard(
        margin: EdgeInsets.symmetric(
          vertical: minMargin,
          horizontal: defaultMargin,
        ),
        color: activeCardColor,
        child: Column(
          children: [
            getTextHeight(),
            getUserHeight(),
            getUserHeightSlider(),
          ],
        ),
      ),
    );
  }

  Widget _getWeightAndAgeCards() {
    Widget getWeightCard() {
      return Expanded(
        flex: 1,
        child: _VerticalSpinCard(label: "WEIGHT", value: this.weight),
      );
    }

    Widget getAgeCard() {
      return Expanded(
        flex: 1,
        child: _VerticalSpinCard(label: "AGE", value: this.age),
      );
    }

    return Expanded(
      flex: 1,
      child: Row(
        children: [
          getWeightCard(),
          getAgeCard(),
        ],
      ),
    );
  }

  Widget _getButtonCalculate() {
    return GestureDetector(
      onTap: () {
        AppRoutes.result.navigateFrom(context);
      },
      child: Container(
        child: Center(
          child: Text(
            "CALCULATE",
            style: buttonTextStyle,
          ),
        ),
        color: bottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}

class _VerticalSpinCard extends StatefulWidget {
  final String label;
  final double value;
  _VerticalSpinCard({@required this.label, @required this.value});

  @override
  _VerticalSpinCardState createState() =>
      _VerticalSpinCardState(value: this.value);
}

class _VerticalSpinCardState extends State<_VerticalSpinCard> {
  double value;

  _VerticalSpinCardState({@required this.value});

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      margin: EdgeInsets.only(
        left: defaultMargin,
        top: minMargin,
        right: minMargin,
        bottom: defaultMargin,
      ),
      color: activeCardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.widget.label,
            style: labelTextStyle,
          ),
          Text(
            this.value.toInt().toString(),
            style: numberTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundIconButton(
                onPressed: () {
                  setState(() {
                    this.value--;
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
                    this.value++;
                  });
                },
                icon: Icon(FontAwesomeIcons.plus),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
