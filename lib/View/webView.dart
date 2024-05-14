import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class WebViewClass extends StatefulWidget {
  @override
  State<WebViewClass> createState() => _WebViewClassState();
}

class _WebViewClassState extends State<WebViewClass> {
  bool checkNet = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkStatus();
  }

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
//    ..setBackgroundColor(Colors.blue)
      ..loadRequest(
          Uri.parse('https://flutter.dev/') //'https://valet.parkmatebh.com'
          );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff005ac2),
        title: Text(
          'Risaala Valet  ',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (await controller.canGoBack()) {
            controller.goBack();
            return false; // Returning false will prevent the default back button action
          }
          return true; // Let the system handle the back button action
        },
        child:
            checkNet == false ? show() : WebViewWidget(controller: controller),
      ),
    );
  }

  void checkStatus() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      checkNet = true;
      setState(() {});

      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      checkNet = true;
      setState(() {});

      // I am connected to a wifi network.
    } else {
      checkNet = false;
      setState(() {});

      print('No Internet');
    }
  }

  Widget show() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: Get.height * 0.1,
          ),
          Icon(
            Icons.wifi_off_rounded,
            size: 90,
            color: Colors.grey.shade400,
          ),
          Text(
            'No Internet Connection',
            style: TextStyle(
                fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w500),
          ),
          Text(
            'Try these steps to get back online',
            style: TextStyle(
              fontSize: 17,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          Container(
            width: Get.width * 0.7,
            //  color: Colors.amber,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle_sharp,
                      color: Colors.black38,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Check Your modem and router',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle_sharp,
                      color: Colors.black38,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Reconnect to Wi-Fi ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                checkStatus();
              },
              child: Text(
                'Reload Page',
                style: TextStyle(
                  color: Color(0xff005ac2),
                ),
              ))
        ]),
      ),
    );
  }
}
