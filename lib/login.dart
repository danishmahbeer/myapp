import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

// SplashScreen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const Image(
        image: AssetImage("assets/finallogo.jpg"),
      ),
      nextScreen: const Dashboard(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ride Share'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                currentScreen = 0;
              });
            },
          ),
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Visibility(
                      maintainAnimation: true,
                      maintainSize: true,
                      maintainState: true,
                      visible: currentScreen == 4,
                      child: const LinkScreen(
                          link: "https://onlinegrocery.pk/api/admin/login.php"),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      offset: const Offset(25, 0),
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 20)
                ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        currentScreen = 0;
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.home,
                              color: currentScreen == 0
                                  ? const Color(0xff01D28E)
                                  : Colors.black,
                            ),
                            Visibility(
                              maintainSize: false,
                              maintainAnimation: false,
                              maintainState: false,
                              visible: currentScreen == 0,
                              child: Text(
                                "Home",
                                style: TextStyle(
                                  color: currentScreen == 0
                                      ? const Color(0xff01D28E)
                                      : Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        currentScreen = 1;
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.person,
                              color: currentScreen == 1
                                  ? const Color(0xff01D28E)
                                  : Colors.black,
                            ),
                            Visibility(
                              maintainSize: false,
                              maintainAnimation: false,
                              maintainState: false,
                              visible: currentScreen == 1,
                              child: Text(
                                "About",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: currentScreen == 1
                                      ? const Color(0xff01D28E)
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        currentScreen = 2;
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.design_services,
                              color: currentScreen == 2
                                  ? const Color(0xff01D28E)
                                  : Colors.black,
                            ),
                            Visibility(
                              maintainSize: false,
                              maintainAnimation: false,
                              maintainState: false,
                              visible: currentScreen == 2,
                              child: Text(
                                "Services",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: currentScreen == 2
                                      ? const Color(0xff01D28E)
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        currentScreen = 3;
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.app_registration,
                              color: currentScreen == 3
                                  ? const Color(0xff01D28E)
                                  : Colors.black,
                            ),
                            Visibility(
                              maintainSize: false,
                              maintainAnimation: false,
                              maintainState: false,
                              visible: currentScreen == 3,
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: currentScreen == 3
                                      ? const Color(0xff01D28E)
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        currentScreen = 4;
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.login,
                              color: currentScreen == 4
                                  ? const Color(0xff01D28E)
                                  : Colors.black,
                            ),
                            Visibility(
                              maintainSize: false,
                              maintainAnimation: false,
                              maintainState: false,
                              visible: currentScreen == 4,
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: currentScreen == 4
                                      ? const Color(0xff01D28E)
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Main Home Screen With WebView
class LinkScreen extends StatefulWidget {
  const LinkScreen({super.key, required this.link});
  final String link;

  @override
  State<LinkScreen> createState() => _LinkScreenState();
}

class _LinkScreenState extends State<LinkScreen> {
  bool isLoading = true;
  late WebViewController _controller;

  Future<bool> _onWillPop(BuildContext context) async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return false;
    }
    return true; // Close the app if there is no back history
  }

  @override
  void initState() {
    super.initState();
    // Create the WebViewController
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true; // Show loading indicator
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false; // Hide loading indicator
            });
          },
          onWebResourceError: (WebResourceError error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Failed to load page. Please try again.")),
            );
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.link), headers: {
        'Cache-Control': 'no-cache, no-store, must-revalidate',
        'Pragma': 'no-cache',
        'Expires': '0'
      });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        body: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (isLoading) const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
