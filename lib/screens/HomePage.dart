import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madesoftlogic/constants.dart';
import 'package:madesoftlogic/screens/AddStaff.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Choice> choices = const <Choice>[
    const Choice(title: 'Add Staff', icon: Icons.person),
    const Choice(title: 'Log Out', icon: Icons.exit_to_app)
  ];

  void onItemMenuPress(Choice choice) {
    if (choice.title == 'Add Staff') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddStaff()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        iconTheme: IconThemeData(
          color: primaryColor, //change your color here
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected: onItemMenuPress,
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Row(
                    children: <Widget>[
                      Icon(choice.icon, color: primaryColor,),
                      SizedBox(width: 10,),
                      Text(choice.title, style: TextStyle(color: primaryColor),)
                    ],
                  )
                );
              }).toList();
            },
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            SizedBox(height: 15,),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                  BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  offset: Offset(0, 2),
                  blurRadius: 4.0,
                  spreadRadius: 1.0
                  )
                ]
              ),
              constraints: BoxConstraints.expand(height: 50),
              child: TabBar(
                labelColor: Colors.black,
                  indicatorColor: primaryColor,
                  indicatorWeight: 5,
                  tabs: [
                Tab(text: "DASHBOARD"),
                Tab(text: "ACTIVITY"),
              ]),
            ),
            Expanded(
              child: Container(
                child: TabBarView(children: [
                  homePageBody(),
                  Container(
                    child: Text("Activities"),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget homePageBody(){
    return ListView(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    offset: Offset(0, 2),
                    blurRadius: 4.0,
                    spreadRadius: 1.0
                )
              ]
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text('Today\'s Transaction', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                    Text('15 June 2020', style: TextStyle(color: Colors.black, fontSize: 11),),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 0),
                child: Column(
                  children: <Widget>[
                    Divider(color: Colors.grey.withOpacity(0.6), thickness: 2,),
                    SizedBox(height: 17,),
                    Text('#0.00', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),),
                    Text('Sales', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                    SizedBox(height: 9,),
                    Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                            height: 24,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: LinearProgressIndicator(
                              backgroundColor: secondaryColor,
                              valueColor: AlwaysStoppedAnimation(primaryColor),
                              value: 0.7,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        RichText(
                            text: TextSpan(
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 11),
                                children: <TextSpan>[
                                  TextSpan(text: '#0.00 \n'),
                                  TextSpan(text: 'Profit'),
                                ]
                            )
                        )
                      ],
                    ),
                    SizedBox(height: 9,),
                    Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                            height: 24,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: LinearProgressIndicator(
                              backgroundColor: secondaryColor,
                              valueColor: AlwaysStoppedAnimation(primaryColor),
                              value: 0.5,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        RichText(
                            text: TextSpan(
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 11),
                                children: <TextSpan>[
                                  TextSpan(text: '#0.00 \n'),
                                  TextSpan(text: 'Profit'),
                                ]
                            )
                        )
                      ],
                    ),
                  ],
                ),
              )


            ],
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width - 30.0,
            child: SizedBox(
              height: 1500,
              child: GridView.count(
                physics: new NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10.0,
                children: <Widget>[
                  _buildCard('Sales Register', 'assets/images/commerce-and-shopping@3x.png'),
                  _buildCard('Exchange', 'assets/images/product@3x.png',),

                  _buildCard('Airtime/Data', 'assets/images/sms@3x.png',),
                  _buildCard('Notifications', 'assets/images/notify.png',),

                  _buildCard('Reports', 'assets/images/report@3x.png',),
                  _buildCard('Sales', 'assets/images/sales@3x.png',),

                  _buildCard('Staffs', 'assets/images/man@3x.png',),
                  _buildCard('Expenses', 'assets/images/expenses@3x.png',),

                  _buildCard('Customers', 'assets/images/customer-behavior@3x.png',),
                  _buildCard('Offline Sales', 'assets/images/wifi@3x.png',),

                  _buildCard('Payments', 'assets/images/pay@3x.png',),
                  _buildCard('Setting', 'assets/images/gear@3x.png',),

                  _buildCard('Suppliers', 'assets/images/inventory@3x.png',),
                  _buildCard('Calculator', 'assets/images/budget@3x.png',),
                ],
              ),
            )
        ),
        SizedBox(height: 20,)
      ],
    );
  }

  Widget _buildCard(String name, String imgPath){
    return Padding(padding: EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0, bottom: 5.0),
      child: InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 14.0,
                    spreadRadius: 11.0,
                  offset: Offset(4, 7)
                )
              ],
              color: Colors.white
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Hero(
                  tag: imgPath,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imgPath,),
                          fit: BoxFit.contain,

                        )
                    ),
                  )),
              Text(name, style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500
              ),),
            ],
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}


