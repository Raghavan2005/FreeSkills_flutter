import 'package:FreeSkills/pages/screens/player_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart';
import 'package:provider/provider.dart';
import '../provider/UserDataState_Provider.dart';

class DeepLinkHandler {
  final AppLinks _appLinks = AppLinks();

  // Function to initialize deep link handling
  Future<void> initializeDeepLink(BuildContext context) async {
    // 1. Check if the app was launched with a deep link
    Uri? initialUri = await _appLinks.getInitialLink();
    if (initialUri != null) {
      _handleDeepLink(initialUri, context);
    }

    // 2. Listen for deep links while the app is running
    _appLinks.uriLinkStream.listen((Uri uri) {
      _handleDeepLink(uri, context);
    });
  }

  // Function to handle the deep link
  void _handleDeepLink(Uri uri, BuildContext context) {
    // Print the deep link URI to the console (for debugging)
    final up = Provider.of<UserdatastateProvider>(context, listen: false);

    // Extract the path segments of the URI
    List<String> index = uri.pathSegments.toList();

    // Check if the path segment is 'share'
    if (index.isNotEmpty && index[0] == "share") {
      if (index.length > 1 && index[1].toString().length == 8) {
        // Handle deep link when the ID is valid
        String playerId = index[1].toString();

        // Ensure the player ID exists in the data provider
        if (up.centraldataset.containsKey(playerId)) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PlayerScreen(item: up.centraldataset[playerId])),
          );
        } else {
          // Handle case when the player ID does not exist
          _showError(context, "Player not found.");
        }
      } else {
        // Handle case when the ID is invalid or doesn't meet the expected length
        _showError(context, "Invalid player ID.");
      }
    } else {
      // Handle case when the deep link path does not match 'share'
      _showError(context, "No matching deep link path found.");
    }
  }

  // Helper method to show error messages
  void _showError(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
