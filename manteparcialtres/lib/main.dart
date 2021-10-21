import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:manteparcialtres/add.dart';
import 'package:manteparcialtres/database.dart';
import 'package:manteparcialtres/view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parcial Tres',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Parcial Home Page'), 
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late Database db;
  List docs = [];
  initialise() {
    db = Database();
    db.initiliase();
    db.read().then((value) => {
          setState(() {
            docs = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(56, 75, 49, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(56, 75, 49, 1.0),
        title: Text("Equipos"),
      ),
      body: ListView.builder(
        itemCount: docs.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(10),
          
            child: ListTile(
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                View(equipo: docs[index], db: db)))
                                
                    .then((value) => {
                          if (value != null) {initialise()}
                        });
              },
              contentPadding: EdgeInsets.only(right: 30, left: 36),
              
              title: Text(docs[index]['nombre']), 
              trailing: Text(docs[index]['estaenprimera']),
            ),
          );
        },
      ),

      floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
       floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
         //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          
          FloatingActionButton(
            onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Add(db: db)))
              .then((value) {
            if (value != null) {
              initialise();
            }
          }
          );
        },
            tooltip: 'Increment',
            heroTag: 'increment',
            child: Icon(Icons.add),
          ),
          SizedBox(
            height: 15.0, //Esto es solo para dar cierto margen entre los FAB
          ),
          FloatingActionButton(
            onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApP()))
              .then((value) {
            if (value != null) {
              initialise();
            }
          }
          );
        },
            tooltip: 'Decrement',
            heroTag: 'Decrement',
            child: Icon(Icons.account_circle),
          ),
        ],
      ),
       )
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Add(db: db)))
              .then((value) {
            if (value != null) {
              initialise();
            }
          }
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/
      
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




//capitanes
class MyApP extends StatelessWidget {
 /*const MyApP({Key? key, required this.title}) : super(key: key);
 final String title;*/

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const MyPage(title: 'Flutter Demo Home Page'),
      
    );
  }
}
class MyPage extends StatefulWidget {
  const MyPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  late Database db;
  List docs = [];
  initialise() {
    db = Database();
    db.initiliase();
    db.Leer().then((value) => {
          setState(() {
            docs = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(56, 75, 49, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(56, 75, 49, 1.0),
        title: Text("Capitanes"),
      ),
      body: ListView.builder(
        itemCount: docs.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(10),
          
            child: ListTile(
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Vista(capitanes: docs[index], db: db)))
                    .then((value) => {
                          if (value != null) {initialise()}
                        });
              },
              contentPadding: EdgeInsets.only(right: 30, left: 36),
              
              title: Text(docs[index]['equipo_id']), 
              trailing: Text(docs[index]['nombre']),
              
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Agregar(db: db)))
              .then((value) {
            if (value != null) {
              initialise();
            }
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
