import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class Assessment extends StatefulWidget {
  const Assessment({Key? key }) : super(key: key);

  @override
  State<Assessment> createState() => _AssessmentState();
}

class _AssessmentState extends State<Assessment> {

  var temp4 = 'Financial Analyst';
  var temp5 = <String>[];
  var lenth1;
  List<DropdownMenuItem> subdomains = [];
  List<String> subdomains1 = [];
  List<String> subdomains2 = [];
  List<String> tempsub = [];
  var blah,blah2;
  String temps="";
  List<String> subdomains3 = ["Assessment 1","Assesment 2","Assesment 3","Assesment 4","Assesment 5"];

  bool showSpinner = false;
  // var db = firebase.firestore();
  @override
  // var blah = text1;
  Widget build(BuildContext context) {

    return Scaffold(
      // resizeToAvoidBottomInset : false,
      appBar: AppBar(backgroundColor: Color(0xff000000),
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bluebg1.png"),
            fit: BoxFit.cover,
          ),
        ),

        child:ModalProgressHUD(
          inAsyncCall: showSpinner,
          child:
          Center(
            child:SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),

                  // Step 4 <-- SEE HERE
                  Text(
                    'Below are the assessments that can be taken',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  const SizedBox(height: 5),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),

                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: subdomains3.length,
                            itemBuilder: (BuildContext context,int index){
                              return Card(
                                child: ListTile(
                                  //leading: Icon(Icons.music_note),
                                  title: Text('${subdomains3[index]}'),
                                  onTap : () async {
    String url = "https://docs.google.com/forms/d/1exGH-Wm4uIOy4tbmpfmRc1QG2406ShIwGqmR-usf8pw/edit";
    var urllaunchable = await canLaunch(url); //canLaunch is from url_launcher package
    if(urllaunchable){
    await launch(url); //launch is from url_launcher package to launch URL
    }else{
    print("URL can't be launched.");
    }
    },
                                ),
                                color: Colors.black54,
                                elevation: 8,
                                shadowColor: Colors.lightBlueAccent,
                                margin: EdgeInsets.all(20),
                              );
                            }
                        ),
                        const SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),

                        )
                      ],
                    ),

                  ),
                  const SizedBox(height: 3),
                ],
              ),
            ),
          ),),
      ),

    );
  }
  showDataAlert(arg1) {
    List<String> ug_courses = [];
    List<String> pg_courses = [];
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: EdgeInsets.only(
              top: 10.0,
            ),
            backgroundColor: Colors.black54,
            title: Text(
              '$arg1',
              style: TextStyle(fontSize: 25.0),
            ),
            content: Container(
              height: 400,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Colleges').where('name',isEqualTo: arg1)
                          .snapshots(),
                      builder:
                          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot3) {
                        var al = snapshot3.data!.docs[0].get("District").toString();
                        var bl = snapshot3.data!.docs[0].get("State").toString();
                        var el = snapshot3.data!.docs[0].get("category").toString();

                        if (!snapshot3.hasData) {
                          debugPrint('IT has data');
                          return CircularProgressIndicator();
                        }
                        return Center(
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 100,
                                padding: const EdgeInsets.all(8.0),
                                child: Card(

                                  child: ListTile(
                                    //leading: Icon(Icons.music_note),

                                    title: Text('District: ''$al'),
                                  ),
                                  color: Colors.black54,
                                  elevation: 8,
                                  shadowColor: Colors.lightBlueAccent,
                                  margin: EdgeInsets.only(top: 13.0,
                                      left: 20.0,
                                      bottom: 5.0,
                                      right: 20.0),
                                  // onTap: () {
                                  //   showAlertDialog(context);
                                  // },

                                ),
                              ),
                              // const SizedBox(height: 100),
                              // Expanded(child: SizedBox.shrink()),
                              Container(
                                width: double.infinity,
                                height: 100,
                                padding: const EdgeInsets.all(8.0),
                                child: Card(

                                  child: ListTile(
                                    //leading: Icon(Icons.music_note),

                                    title: Text('State: ''$bl'),
                                  ),
                                  color: Colors.black54,
                                  elevation: 8,
                                  shadowColor: Colors.lightBlueAccent,
                                  margin: EdgeInsets.only(top: 5.0,
                                      left: 20.0,
                                      bottom: 20.0,
                                      right: 20.0),
                                  // onTap: () {
                                  //   showAlertDialog(context);
                                  // },

                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 100,
                                padding: const EdgeInsets.all(8.0),
                                child: Card(

                                  child: ListTile(
                                    //leading: Icon(Icons.music_note),

                                    title: Text('Category: ''$el'),
                                  ),
                                  color: Colors.black54,
                                  elevation: 8,
                                  shadowColor: Colors.lightBlueAccent,
                                  margin: EdgeInsets.only(top: 5.0,
                                      left: 20.0,
                                      bottom: 20.0,
                                      right: 20.0),
                                  // onTap: () {
                                  //   showAlertDialog(context);
                                  // },

                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 60,
                                padding: const EdgeInsets.all(8.0),
                                // margin: const EdgeInsets.only(top: 0.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blueAccent,
                                    // fixedSize: Size(250, 50),
                                  ),
                                  child: Text(
                                    "Close",
                                  ),
                                ),
                              ),


                            ],),);



                      },
                    ),

                  ],
                ),
              ),
            ),
          );
        });
  }
  void _sendDataToFifthScreen(BuildContext context) {

  }


}
