import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Version 1.0.0',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ESTE ES UN EJEMPLO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(APIPaths.baseApiUrl +
                '\n${PickingAPIPaths.hostNameScheme}' +
                '\n${RecoleccionAPIPaths.hostNameScheme}' +
                '\n${SupplyApiPaths.hostNameScheme}' +
                '\n${DispatchApiPaths.hostNameScheme}'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class APIPaths {
  static const String baseApiUrl = String.fromEnvironment('RECEIVINGBASEAPI',
      //testing
      defaultValue: 'https://wms.agglobal.com/ingreso-test/api/');
  //defaultValue: 'http://192.168.3.10:6052/api/');
  //produccion
  //defaultValue: 'http://192.168.3.4:6051/api/');

  static const String ingresoUrl = baseApiUrl + 'Ingreso';
  static const String positionProductUrl = ingresoUrl + '/GetPositionProducts?position=';
  static const String loginUrl = baseApiUrl + 'login/login?';
  static const String imageUrl = 'http://192.168.3.2:5566/';
  static const String imageProvider = 'https://res.cloudinary.com/agglobal-com/image/upload/';
}

class PickingAPIPaths {
  static const String hostNameScheme = String.fromEnvironment('PICKINGBASEAPI',
      defaultValue: 'https://wms.agglobal.com/picking-test');
  static const String asignationStatusPath = hostNameScheme + '/api/Routes/asignation-status';
  static const String routes = hostNameScheme + '/api/Routes';
  static const String reasonsIncomplete = routes + '/reasons-incomplete';
  static const String finishRoute = routes + '/finish';
  static const String beginRoute = routes + '/begin';
}

class RecoleccionAPIPaths {
  static const String hostNameScheme = String.fromEnvironment('RECOLECCIONBASEAPI',
      defaultValue: 'http://192.168.3.10:6057/api/recolecciones/');
  //defaultValue: 'http://192.168.3.4:4001/api/recolecciones/');//produccion
}

class SupplyApiPaths {
  static const String hostNameScheme = String.fromEnvironment('SUPPLYBASEAPI',
      defaultValue: 'https://wms.agglobal.com/inventory-test');
  static const String restockOrders = hostNameScheme + '/api/Supply/employee/Restock/Orders';
  static const String suppyRequest = hostNameScheme + '/api/Supply/picking/';
  static const String beginRestock = hostNameScheme + '/api/Supply/beginRestock/';
  static const String validateReservePosition = hostNameScheme + '/api/Supply/position/';
  static const String endSupply = hostNameScheme + '/api/Supply/EndSupply';
}

class DispatchApiPaths {
  static const String hostNameScheme = String.fromEnvironment('DISPATCHBASEAPI',
      defaultValue: 'https://wms.agglobal.com/despacho-test');
  static const String trunkGuides = hostNameScheme + '/api/tracking-numbers';
  static const String warehouseOrders = hostNameScheme + '/api/warehouse-orders/';

  static String setCloseTruckGuideEndpoint(String id) {
    return trunkGuides + '/$id/close';
  }

  static String setEmbarkEndpoint(String idTruckGuide, String idBundle, String idDesglose) {
    return hostNameScheme +
        "/api/tracking-numbers/$idTruckGuide/bundles/$idBundle/partition/$idDesglose/embark";
  }

  static String setDisembarkEndpoint(String idTruckGuide, String idBundle, String idDesglose) {
    return hostNameScheme +
        "/api/tracking-numbers/$idTruckGuide/bundles/$idBundle/partition/$idDesglose/disembark";
  }
}
