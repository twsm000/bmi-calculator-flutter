import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../components/reusable_card.dart';
import '../components/icon_labeled.dart';
import '../constants.dart';
import '../components/rounded_icon_button.dart';
import '../routes.dart';
import '../components/full_width_button.dart';
import '../bmi_calculator.dart';

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
  Gender male = Gender(
    name: "MALE",
    cardColor: inactiveCardColor,
    iconColor: inactiveLabelColor,
  );
  Gender female = Gender(
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
    newActiveGender.iconColor = activeTextColor;

    this.selectedGender = newActiveGender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _getMaleAndFemaleCards(),
            _getSliderCard(),
            _getWeightAndAgeCards(),
            _getButtonCalculate(),
          ],
        ),
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
              updateColor(this.male);
            });
          },
          margin: EdgeInsets.only(
            left: defaultMargin,
            top: defaultMargin,
            right: minMargin,
            bottom: minMargin,
          ),
          color: this.male.cardColor,
          child: IconLabeled(
            icon: FontAwesomeIcons.mars,
            iconColor: this.male.iconColor,
            label: this.male.name,
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
              updateColor(this.female);
            });
          },
          margin: EdgeInsets.only(
            left: minMargin,
            top: defaultMargin,
            right: defaultMargin,
            bottom: minMargin,
          ),
          color: this.female.cardColor,
          child: IconLabeled(
            icon: FontAwesomeIcons.venus,
            iconColor: this.female.iconColor,
            label: this.female.name,
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
        child: _VerticalSpinCard(
          label: "WEIGHT",
          value: this.weight,
          onAfterUpdateValue: (double value) {
            this.weight = value;
          },
          margin: EdgeInsets.only(
            left: defaultMargin,
            top: minMargin,
            right: minMargin,
            bottom: minMargin,
          ),
        ),
      );
    }

    Widget getAgeCard() {
      return Expanded(
        flex: 1,
        child: _VerticalSpinCard(
          label: "AGE",
          value: this.age,
          onAfterUpdateValue: (double value) {
            this.age = value;
          },
          margin: EdgeInsets.only(
            left: minMargin,
            top: minMargin,
            right: defaultMargin,
            bottom: minMargin,
          ),
        ),
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
    return FullWidthButton(
      label: "CALCULATE",
      onPress: () {
        if (this.selectedGender.name == null) {
          Alert alert;
          Function closeAlert = () {
            alert.dismiss();
          };

          alert = Alert(
            context: this.context,
            type: AlertType.warning,
            title: "GENDER NOT SELECTED",
            desc: "Please, select a gender before calculate!",
            style: AlertStyle(
              isCloseButton: false,
              isOverlayTapDismiss: false,
              backgroundColor: activeCardColor,
              titleStyle: TextStyle(
                color: activeTextColor,
              ),
              descStyle: TextStyle(
                color: activeTextColor,
              ),
            ),
            buttons: [
              DialogButton(
                color: bottomContainerColor,
                child: Text(
                  "OK",
                  style: TextStyle(
                    color: activeTextColor,
                    fontSize: 18,
                  ),
                ),
                onPressed: closeAlert,
              ),
            ],
          );
          alert.show();
          return;
        }

        BMICalculator().setHeight(height).setWeight(weight);
        AppRoutes.result.navigateFrom(context);
      },
    );
  }
}

class _VerticalSpinCard extends StatefulWidget {
  final String label;
  final double value;
  final EdgeInsetsGeometry margin;
  final Function(double value) onAfterUpdateValue;
  _VerticalSpinCard({
    @required this.label,
    @required this.margin,
    @required this.value,
    @required this.onAfterUpdateValue,
  });

  @override
  _VerticalSpinCardState createState() =>
      _VerticalSpinCardState(value: this.value);
}

class _VerticalSpinCardState extends State<_VerticalSpinCard> {
  double value;
  _VerticalSpinCardState({@required this.value});

  @override
  Widget build(BuildContext context) {
    Function onIncreaseValue = () {
      setState(() {
        value++;
        widget.onAfterUpdateValue(value);
      });
    };

    Function onDecreaseValue = () {
      setState(() {
        value--;
        widget.onAfterUpdateValue(value);
      });
    };

    return ReusableCard(
      margin: this.widget.margin,
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
                onPressed: onDecreaseValue,
                icon: Icon(FontAwesomeIcons.minus),
              ),
              SizedBox(
                width: 10,
              ),
              RoundIconButton(
                onPressed: onIncreaseValue,
                icon: Icon(FontAwesomeIcons.plus),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
