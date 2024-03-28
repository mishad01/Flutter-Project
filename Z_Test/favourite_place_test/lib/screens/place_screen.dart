import 'package:favourite_place_test/providers/user_places.dart';
import 'package:favourite_place_test/screens/add_place_screen.dart';
import 'package:favourite_place_test/widget/place_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceScreen extends ConsumerStatefulWidget {
  PlaceScreen({super.key});
  @override
  ConsumerState<PlaceScreen> createState() {
    return _PlaceScreen();
  }
}

class _PlaceScreen extends ConsumerState<PlaceScreen> {
  late Future<void> _placesFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(UserPlaceProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final userPlaces = ref.watch(UserPlaceProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Place'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPlaceScreen(),
                  ),
                );
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: _placesFuture,
            builder: (context, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : PlaceList(places: userPlaces),
          )),
    );
  }
}
