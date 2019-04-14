import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Karwash Profile',
      debugShowCheckedModeBanner: false,
      home: UserProfilePage(),
    );
  }
}

class UserProfilePage extends StatelessWidget {

  final String _fullName = 'Delano Taiwo';
  final String _status = 'Ready to Hire(Suv Washer)';
  final String _bio = "\"Hi im 13 if you need your car washed im always available.\"";
  final String _hires = '19';
  final String _contact = 'damn2litty@gmail.com';

  Widget _buildCoverImage (Size screenSize) {
    return Container(
      height: screenSize.height / 2.6,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://www.pixelstalk.net/wp-content/uploads/2015/12/Easter-Wallpaper-HD-620x388.jpg'),
          fit: BoxFit.cover
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBdsZxLT_2UdVAxwH4ANI5zaBXVTUqVPSSjup7nHQXkXZHtY_8'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: Colors.white,
            width: 10.0,
          ),
        ),
      ),
    );
  }

  Widget _buildFullName() {
    TextStyle _nameTextStyle = TextStyle(
      color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    );

    return Text(
      _fullName,
      style: _nameTextStyle,
    );
  }
 
 Widget _buildStatus(BuildContext context) {
   return Container(
     padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
     decoration: BoxDecoration(
       color: Theme.of(context).scaffoldBackgroundColor,
       borderRadius: BorderRadius.circular(4.0),
     ),
     child: Text(
       _status,
       style: TextStyle(
         color: Colors.black,
         fontSize: 20.0,
         fontWeight: FontWeight.w300,
       ),
     ),
   );
 }

 Widget _buildStatItem(String label, String count) {
   TextStyle _statLabelTextStyle = TextStyle(
     color: Colors.black,
     fontSize: 16.0,
     fontWeight: FontWeight.w200,
   );
   TextStyle _statCountTextStyle = TextStyle(
     color: Colors.black54,
     fontSize: 24.0,
     fontWeight: FontWeight.bold,
   );
   return Column(
     mainAxisAlignment: MainAxisAlignment.center,
     children: <Widget>[
       Text(
         count,
         style: _statCountTextStyle,
       ),
       Text(
         label,
         style: _statLabelTextStyle,
       ),
     ],
   );
 }

 Widget _buildStatContainer() {
   return Container(
     height: 60.0,
     margin: EdgeInsets.only(top:8.0),
     decoration: BoxDecoration(
       color: Colors.red
     ),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: <Widget>[
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             _buildStatItem("Hires",  _hires),
             _buildStatItem("Contact",  _contact),
             
           ],
         ),
       ],
     ),
   );
 }

 Widget _buildBio(BuildContext context) {

   TextStyle bioTextStyle = TextStyle(
     fontWeight: FontWeight.w500, 
     fontStyle: FontStyle.italic,
     color: Colors.black45,
     fontSize: 16.0,
   );
   return Container(
     color: Theme.of(context).scaffoldBackgroundColor,
     padding: EdgeInsets.all(8.0),
     child: Text(
       _bio,
       textAlign: TextAlign.center,
       style: bioTextStyle
     ),
   );

 }

Widget _buildSeparator(Size screenSize) {
  return Container(
    width: screenSize.width / 1.6,
    height: 2.0,
    color: Colors.black54,
    margin: EdgeInsets.only(top:4.0),
  );
}


Widget _buildGetInTouch(BuildContext context) {
  return Container(
    color: Theme.of(context).scaffoldBackgroundColor,
    padding: EdgeInsets.only(top:8.0),
    child: Text(
      "Get In Touch ${_fullName.split("")[0]},",
      style: TextStyle(
        fontSize:16.0
      ),
    ),
  );
}

Widget _buildButtons() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: Row(
      children: <Widget>[
        Expanded(
          child: InkWell(
            onTap: () => print("Hire"),
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.yellow,
              ),
              child: Center(
                child: Text(
                  "Hire",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: InkWell(
            onTap: () => print("Request Accepted"),
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Contact",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

  @override 
  Widget build(BuildContext context) {
    Size screenSize =MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildCoverImage(screenSize),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: screenSize.height / 6.4,
                  ),
                  _buildProfileImage(),
                  _buildFullName(),
                  _buildStatus(context),
                  _buildStatContainer(),
                  _buildBio(context),
                  _buildSeparator(screenSize),
                  SizedBox(height: 10.0),
                  _buildGetInTouch(context),
                  SizedBox(height: 8.0),
                  _buildButtons(),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}

