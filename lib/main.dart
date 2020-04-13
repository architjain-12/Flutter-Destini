import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'story_brain.dart';

StoryBrain storyBrain = StoryBrain();

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      //home: StoryPage(),
      title: 'Destini',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => HomeScreen(),

        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second' :(context) => Title(),
         '/third': (context) => StoryPage(),


       '/fourth': (context) => Profile(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
//            constraints: BoxConstraints.expand(),
//            decoration: BoxDecoration(
//                image: DecorationImage(
//                    image: AssetImage('images/backgroundimageapp.jpg'),
//                    fit: BoxFit.cover)
//            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Center(
                  child: Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Column(
                    children: <Widget>[
                      Text('DESTINI \n ',
                        textAlign: TextAlign.center, style:
                        TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold , fontFamily: 'pacifico'),
                      ),
                      Text('Choose your Adventure',
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Image.asset('images/startingAnimate.gif' ,
                  scale: 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 80.0),
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(28.0),
                        side: BorderSide(color: Colors.blue)),
                    color: Colors.cyan[600],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text('Get Started' ,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Navigate to the second screen using a named route.
                      Navigator.pushNamed(context, '/second');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/techRain.gif'),
                    fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 300.0),
                    child: Column(
                      children: <Widget>[
                        Text('EPISODE 1: \n ',
                          textAlign: TextAlign.center, style:
                          TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold ),
                        ),
                        Text('The Murderer',
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold , fontFamily: 'pacifico'),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 80.0),
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(28.0),
                        side: BorderSide(color: Colors.grey)),
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                      child: Text('Start' ,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Navigate to the second screen using a named route.
                      Navigator.pushNamed(context, '/third');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'),
                fit: BoxFit.cover)
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    //Choice 1 made by user.
                    setState(() {
                      storyBrain.nextStory(1);
                    });

                  },
                  color: Colors.red,
                  child: Text(
                    storyBrain.getChoice1(), textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Visibility(
                visible: storyBrain.buttonShouldBeVisible(),
                child: Expanded(
                  flex: 2,
                  child: FlatButton(
                    onPressed: () {
                      //Choice 2 made by user.
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },
                    color: Colors.blue,
                    child: Text(
                      storyBrain.getChoice2(), textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !storyBrain.buttonShouldBeVisible(),
                child: Expanded(
                  flex: 2,
                  child: FlatButton(
                    onPressed: () {
                      //APP CREDITS.
                      setState(() {
                        storyBrain.restart();
                        Navigator.pushNamed(context, '/fourth');
                      });
                    },
                    color: Colors.blue,
                    child: Text(
                      'View Credits!', textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[600],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/Profile_image.jpg'),
              ),
              Text(
                'Archit Jain',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'pacifico',
                ),
              ),
              Text(
                'FLUTTER & WEB DEVELOPER' ,
                style: TextStyle(
                  letterSpacing: 2.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Times New Roman',
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade200,
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child:  ListTile(
                    leading: Icon(
                        Icons.phone,
                        color: Colors.teal.shade900
                    ),
                    title: Text(
                      '+91-9873955774' ,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.teal.shade900,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    leading: Icon(
                        Icons.email,
                        color: Colors.teal.shade900
                    ),
                    title: Text(
                      'architjain08@gmail.com' ,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.teal.shade900,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(28.0),
                        side: BorderSide(color: Colors.blue)),
                    color: Colors.blue[800],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
                      child: Text('Restart' ,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Navigate to the second screen using a named route.
                      Navigator.pushNamed(context, '/second');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
