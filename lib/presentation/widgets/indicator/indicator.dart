import 'package:flutter/material.dart';

class Indicator{
  loadingIndicator() {
    return const Text('Refreshing..',
        style: TextStyle(
            color: Colors.grey, fontFamily: 'SourceSansPro-SemiBold'));
  }

  completeIndicator() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.done,
          color: Colors.grey,
        ),
        SizedBox(
          width: 10,
        ),
        Text('Refresh Completed',
            style: TextStyle(
                color: Colors.grey, fontFamily: 'SourceSansPro-SemiBold'))
      ],
    );
  }

  failedIndicator() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.close,
          color: Colors.grey,
        ),
        SizedBox(
          width: 10,
        ),
        Text('Failed',
            style: TextStyle(
                color: Colors.grey, fontFamily: 'SourceSansPro-SemiBold'))
      ],
    );
  }
}