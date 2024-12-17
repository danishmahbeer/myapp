import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';  // Import your main app entry file
import 'package:webview_flutter/webview_flutter.dart';  // Import WebView widget for testing

void main() {
  testWidgets('Splash Screen shows and navigates to Dashboard', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Wait for the splash screen to complete
    await tester.pumpAndSettle();

    // Verify that the Dashboard is displayed
    expect(find.byType(Dashboard), findsOneWidget); // Check if the Dashboard widget is displayed
  });

  testWidgets('Navigation to Home Screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Wait for the splash screen to complete
    await tester.pumpAndSettle();

    // Find and tap on the Home button
    final homeButton = find.text('Home');
    expect(homeButton, findsOneWidget); // Verify the Home button is found
    await tester.tap(homeButton); // Simulate tap on Home button
    await tester.pumpAndSettle(); // Wait for navigation to complete

    // Verify that the Home screen is displayed
    expect(find.byType(LinkScreen), findsOneWidget); // Check if the LinkScreen is displayed
  });

  testWidgets('Verify LinkScreen URL navigation', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Wait for the splash screen to complete
    await tester.pumpAndSettle();

    // Find and tap on the first LinkScreen link
    final homeLink = find.text('Home'); // Example, adjust according to your navigation logic
    expect(homeLink, findsOneWidget);
    await tester.tap(homeLink); // Simulate tap on Home link
    await tester.pumpAndSettle(); // Wait for the page to load

    // Verify that the WebView is displaying the correct URL
    expect(find.byType(WebViewWidget), findsOneWidget); // Check if WebView widget is rendered
  });
}
