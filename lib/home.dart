import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentIndex = 0;
  final PageController controller = PageController();

  List<String> images = [
    "https://www.shutterstock.com/shutterstock/photos/2117917952/display_1500/stock-vector-blood-bag-with-a-heart-blood-donation-day-for-poster-banner-card-and-background-vector-2117917952.jpg",
    "https://www.shutterstock.com/shutterstock/photos/1928072312/display_1500/stock-vector-world-blood-donor-day-june-th-vector-design-with-blood-bag-transferring-blood-concept-1928072312.jpg",
    "https://www.shutterstock.com/shutterstock/photos/1888368172/display_1500/stock-photo-blood-donation-concept-with-realistic-detailed-d-red-droplet-and-thin-line-icons-illustration-of-1888368172.jpg",
    "https://www.shutterstock.com/shutterstock/photos/2303388635/display_1500/stock-photo-doctor-in-a-white-coat-receive-blood-donation-blood-transfusion-world-blood-donor-day-red-cross-2303388635.jpg",
    "https://www.shutterstock.com/shutterstock/photos/193408172/display_1500/stock-vector-blood-bag-isolated-on-white-193408172.jpg",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BloodLink', style: TextStyle(color: Colors.white),),
       centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white,),
              onPressed: () {}),
          ],

        backgroundColor: Color(0xff880808),
        leading: IconButton(onPressed: (){},
        icon: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white,),
          onPressed: () {} ,
        ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15)
          )
        ),
      ),

      body: Column(
        children: [
          SizedBox(height: 14,),
          SizedBox(height: 200,
            width: double.infinity,
            child: PageView.builder(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index % images.length;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Image.network(
                      images[index % images.length],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < images.length; i++)
                buildIndicator(currentIndex == i)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    controller.jumpToPage(currentIndex - 1);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                IconButton(
                  onPressed: () {
                    controller.jumpToPage(currentIndex + 1);
                  },
                  icon: Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, '/addbreedingdata');
            },
            child: Card(
              color:Color(0xff880808),
              elevation: 5,
              margin: EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                height: 150,
                width: 150,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Blood Donate',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8)
                        ),
                         child: Icon(Icons.bloodtype_sharp, color: Colors.white,)
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, '/addbreedingdata');
            },
            child: Card(
              color:Color(0xff880808),
              elevation: 5,
              margin: EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                height: 150,
                width: 150,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Blood Receive',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.white),),
                      SizedBox(height: 10,),
                      Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Icon(Icons.bloodtype_sharp, color: Colors.white,)
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

        ],


      ),

    );

  }

  Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        height: isSelected ? 12 : 10,
        width: isSelected ? 12 : 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}



