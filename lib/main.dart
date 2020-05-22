import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => HomeScreen(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/vex': (context) => VexProj(),
      '/vex2': (context) => Vex2Proj(),
      '/rov': (context) => RovProj(),
      '/pong': (context) => PongProj(),
      '/web': (context) => WebProj(),
      '/mi': (context) => MiProj(),
      '/first': (context) => FirstProj(),
    },
  ));
}

class HomeScreen extends StatelessWidget {

  Card buildCardMain(IconData icon, String text, String nextPage, double pad, context) {
    var func = () {};

    if (nextPage != '') {
      func = () {Navigator.pushNamed(context, nextPage);};
    }

    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: InkWell(
        splashColor: Colors.tealAccent,
        onTap: func,
        child: Padding(
          padding: EdgeInsets.all(pad),
          child: ListTile(
            leading: Icon(
              icon,
              color: Colors.teal,
            ),
            title: Text(
              text,
              style: TextStyle(
                color: Colors.teal[900],
                fontFamily: 'SpaceMono',
                fontSize: 15.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column buildTitle(String title, double dividerLen) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Arcade',
            fontSize: 20.0,
            color: Colors.teal[100],
            letterSpacing: 2.3,
          ),
        ),
        SizedBox(
          height: 20.0,
          width: dividerLen,
          child: Divider(
            color: Colors.tealAccent,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.teal,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/Sebastian.jpg'),
                ),
                Text(
                  'Sebastian Scurtescu',
                  style: TextStyle(
                    fontFamily: 'SpaceMono',
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                buildTitle('STUDENT', 150),
                buildCardMain(Icons.phone, '669-231-9756', '', 10.0, context),
                buildCardMain(Icons.email, 'sebastian.scurtescu@gmail.com', '', 10.0,  context),
                buildTitle('PAST PROJECTS', 275.0),
                buildCardMain(Icons.dehaze, 'Vex Robot 2020', '/vex', 10.0, context),
                buildCardMain(Icons.dehaze, 'Rov Robot 2019', '/rov', 10.0, context),
                buildCardMain(Icons.dehaze, 'Python Pong Recreation 2019', '/pong', 10.0, context),
                buildCardMain(Icons.dehaze, 'FIRST Robotics 2017', '/first', 10.0, context),
                buildTitle('CURRENT PROJECTS', 325.0),
                buildCardMain(Icons.dehaze, 'This App', '/mi', 10.0, context),
                buildCardMain(Icons.dehaze, 'Online Portfolio', '/web', 10.0, context),
                buildCardMain(Icons.dehaze, 'Vex Robot 2021', '/vex2', 10.0, context),
                buildTitle('LANGUAGES I AM LEARNING', 450.0),
                buildCardMain(Icons.trip_origin, 'Python', '', 10.0, context),
                buildCardMain(Icons.trip_origin, 'Go', '', 10.0, context),
                buildCardMain(Icons.trip_origin, 'Dart', '', 10.0, context),
                buildCardMain(Icons.trip_origin, 'C/C++', '', 10.0, context),
                buildCardMain(Icons.trip_origin, 'HTML', '', 10.0, context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Scaffold buildDescription(String description, String title,String img, context) {
  return Scaffold(
    backgroundColor: Colors.teal,
    body: ListView(
      children: [
        Column(
          children: [
            AppBar(
              backgroundColor: Colors.teal,
              title: Text(
                title,
                style: TextStyle(
                  color: Colors.tealAccent,
                  fontFamily: 'SpaceMono',
                  fontSize: 30.0,
                ),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.tealAccent,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        Image.asset('images/$img'),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                description,
                style: TextStyle(
                  color: Colors.teal,
                  fontFamily: 'SpaceMono',
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class VexProj extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildDescription('The robotics team at my school participated in the Vex robotics competition in 2020. We were broken up into teams and, although I helped with building the robot as well, I was the only programmer on our team  of three. I used C++ to program the robot.', 'Vex Robotics 2020', 'Vex2020.png', context);
  }
}

class Vex2Proj extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildDescription('We will be taking part in the Vex robotics competition next year. More coming later.', 'Vex Robotics 2021', '', context);
  }
}


class RovProj extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildDescription("In 2019, the robotics team at my school decided to dive into making underwater ROV's. We were split into two groups and we each built our own robot. Our team only had two people, I was the programmer and my friend the builder of the robot. We are yet to actually use the robot, but we had completed it and had done small tests. Hopefully we will start using it soon.", 'ROV', 'ROV.jpg', context);
  }
}

class PongProj extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildDescription('During 2019 I was learning to program in Python3 and as a partway through project I programmed a remake of the game Pong, but with my own twist. My version allowed to play with up to four people. My friends and I had loads of fun playing this game.', 'Pong', 'Pong.png', context);
  }
}

class WebProj extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildDescription('At my school they allow us to design our own courses and if they get approved, we can actually take them for credits. I made one of these courses for learning how to use Django with Python to make an online portfolio/blog. I learned the basics of Django and had a functioning blog by the end of the year. I set up an Apache server on a school computer and hosted my website for everyone in the school to see. I plan on moving it to a different server, so that more people would be have access to it.', 'WebSite Portfolio', '', context);
  }
}

class MiProj extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildDescription("This year I decided to take on the challenge of learning how to use Flutter and Dart to program apps for Android and iOS. I built the app which you are currently using with Dart and Flutter as part of my course. I plan to keep adding to it and to also learn how to use Flutter's cross platform capabilities to deploy it to the web.", 'This App', '', context);
  }
}

class FirstProj extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildDescription("During 2016 to 2017 my school's robotics team participated in the FIRST Robotics competition. This was my first year getting involved in robots and programming. Out team made an amazing robot, and we placed second in BC, Canada.", 'FIRST Robotics', 'CyberScorpions2017.jpg', context);
  }
}

