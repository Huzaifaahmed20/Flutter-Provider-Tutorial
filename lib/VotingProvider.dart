import 'package:flutter/foundation.dart';

class VotingProvider extends ChangeNotifier {
  List _votingData = [];

  List get getData => _votingData;

  void incVotes(int index) {
    _votingData[index]['votes']++;
    notifyListeners();
  }

  void addItem(String value) {
    _votingData.add({'title': value, 'votes': 0});
    notifyListeners();
  }
}
