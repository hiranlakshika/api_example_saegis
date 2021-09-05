import 'package:api_example/model/color_product.dart';
import 'package:api_example/services/color_product_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorProductService service = ColorProductService();
    return Scaffold(
      appBar: AppBar(
        title: Text('API Example'),
        centerTitle: true,
      ),
      body: FutureBuilder<ColorProduct?>(
        future: service.getColorProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Text(snapshot.data!.data![index].name ?? ''),
                        Text(snapshot.data!.data![index].color ?? ''),
                      ],
                    ),
                  );
                },
                itemCount: snapshot.data!.data!.length,
              );
            } else {
              return Center(child: Text('No data'));
            }
          }
        },
      ),
    );
  }
}
