import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

final titles = [
  "Discover new places you will love",
  "Discover new places you will love",
  "Discover new places you will love",
  "Discover new places you will love",
];
final image = [
  'assets/images/success.jpeg',
  'assets/images/success.jpeg',
  'assets/images/success.jpeg',
  'assets/images/success.jpeg',
];

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController _pageController;
  ValueNotifier _valueNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
      initialPage: _valueNotifier.value,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _pageViewHeight = MediaQuery.of(context).size.height * .72;
    double _imageSize = MediaQuery.of(context).size.width * .85;
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: FlatButton(
              onPressed: () {},
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Container(
            height: _pageViewHeight,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                _valueNotifier.value = index;
              },
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Container(
                      height: _imageSize,
                      width: _imageSize,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: ExactAssetImage(
                              image[index],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 48, bottom: 32),
                      child: Text(
                        titles[index],
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32, right: 32),
                      child: Text(
                        'Discover new places you will love Discover new places you will love ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: 4,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: PageViewIndicator(
                pageIndexNotifier: _valueNotifier,
                length: image.length,
                normalBuilder: (animationController, index) => Circle(
                  size: 8.0,
                  color: Colors.grey,
                ),
                highlightedBuilder: (animationController, index) =>
                    ScaleTransition(
                  scale: CurvedAnimation(
                    parent: animationController,
                    curve: Curves.ease,
                  ),
                  child: Circle(
                    size: 12.0,
                    color: Colors.black87,
                  ),
                ),
                indicatorPadding: EdgeInsets.all(2),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              color: Color.fromRGBO(73, 144, 226, 1),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: Text(
                  'DISCOVER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
