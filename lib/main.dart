import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './VotingProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider.value(
        value: VotingProvider(),
        child: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final TextEditingController valueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print('build');
    final dataProvider = Provider.of<VotingProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Voting App'),
        centerTitle: true,
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          TextField(
            controller: valueController,
          ),
          RaisedButton(
            onPressed: () {
              if (valueController.text.isNotEmpty) {
                dataProvider.addItem(valueController.text);
              }
            },
            child: Text('Add Items'),
          ),
          Consumer<VotingProvider>(
              builder: (_, data, __) => Expanded(
                    child: ListView.builder(
                      itemCount: data.getData.length,
                      itemBuilder: (_, index) => Card(
                        elevation: 5,
                        child: ListTile(
                          onTap: () {
                            data.incVotes(index);
                          },
                          title: Text('${data.getData[index]['title']}'),
                          trailing: CircleAvatar(
                            child: Text('${data.getData[index]['votes']}'),
                          ),
                        ),
                      ),
                    ),
                  ))
        ],
      )),
    );
  }
}
