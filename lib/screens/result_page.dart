import 'package:flutter/material.dart';

import '../constants.dart';
import '../components/full_width_button.dart';
import '../components/reusable_card.dart';
import '../routes.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _getTitle(),
          _getResultCard(),
          _getButtonRecalculate(),
        ],
      ),
    );
  }

  Widget _getTitle() {
    return Expanded(
      flex: 1,
      child: Container(
        child: Center(
          child: Text(
            "Your Result",
            style: TextStyle(
              fontSize: 42,
              color: activeTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getResultCard() {
    Widget getCategory() {
      return Expanded(
        flex: 1,
        child: Container(
          child: Center(
            child: Text(
              "CATEGORY",
              style: TextStyle(
                color: Color(0xFF4BDD7B),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
    }

    Widget getResult() {
      return Expanded(
        flex: 1,
        child: Container(
          child: Center(
            child: Text(
              "26.7",
              style: TextStyle(
                color: activeTextColor,
                fontSize: 80,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }

    Widget getDescription() {
      return Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Center(
            child: Text(
              "You have a higher than normal body weight. Try to exercise more.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: activeTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
    }

    return Expanded(
      flex: 7,
      child: Container(
        child: ReusableCard(
          margin: EdgeInsets.only(
            left: defaultMargin,
            top: 3,
            right: defaultMargin,
            bottom: defaultMargin,
          ),
          color: activeCardColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              getCategory(),
              getResult(),
              getDescription(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getButtonRecalculate() {
    return FullWidthButton(
      label: "RE-CALCULATE",
      onPress: () {
        AppRoutes.closePage(context);
      },
    );
  }
}
