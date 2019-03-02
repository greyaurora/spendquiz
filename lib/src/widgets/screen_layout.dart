import 'package:flutter/material.dart';

import 'package:spend_quiz/src/widgets/spend.dart';
import 'package:spend_quiz/src/widgets/quiz.dart';
import 'payment.dart';

enum Screen { spend, quiz }

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text('Spend Quiz!')),
      body: PageView(
        controller: pageController,
        onPageChanged: (int i) {
          Payment.of(context).reset();
          setState(() => currentPage = i);
        },
        children: <Widget>[Spend(), Quiz()],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: currentPage == 0
          ? FloatingActionButton(
              onPressed: () {
                if (!Payment.of(context).isValid) return;

                Payment.of(context).save();
              },
              child: Icon(Icons.attach_money, color: Colors.white),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          pageController.animateToPage(
            index,
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 500),
          );
        },
        currentIndex: currentPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            title: Text('Spend!'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            title: Text('Quiz!'),
          ),
        ],
      ),
    );
  }
}
