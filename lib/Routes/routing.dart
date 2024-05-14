import 'package:flutter/material.dart';
import 'package:practice/View/webView.dart';

class AppRoutes {
  Route<dynamic>? onGenrateRoot(RouteSettings settings) {
    switch (settings.name) {
      case 'WebViewClass':
        return MaterialPageRoute(
          builder: (context) => WebViewClass(),
        );
    }
  }
}
