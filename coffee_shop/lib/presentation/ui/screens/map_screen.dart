import 'package:coffee_shop/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late GoogleMapController _googleMapController;
  Position? _currentPosition;
  LatLng _currentLatLng =
      const LatLng(22.35542888372639, 91.82072960419521); // Default position
  Marker? _currentMarker;
  Polyline? _currentPolyLine;
  List<LatLng> _polyLineCoordinates = [];
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _getRealTimeLocationUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildGoogleMapSection(),
          buildCurrentLocationSection(context),
          Container(),
          Align(
            alignment:
                Alignment.bottomCenter, // Aligns the section at the bottom
            child: _buildTimeSection(), // This is your custom section
          ),
        ],
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getCurrentLocation();
          _getRealTimeLocationUpdate();
        },
        child: Icon(Icons.location_history),
      ),*/
    );
  }

  Widget buildCurrentLocationSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xffEDEDED),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {});
              },
              icon: const Center(child: Icon(Icons.arrow_back_ios)),
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xffEDEDED),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () {
                _getCurrentLocation();
                _getRealTimeLocationUpdate();
              },
              icon: const Icon(Icons.gps_fixed),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGoogleMapSection() {
    return GoogleMap(
      mapType: MapType.terrain,
      initialCameraPosition: CameraPosition(
        target: _currentLatLng,
        zoom: 18,
      ),
      onMapCreated: (GoogleMapController controller) {
        _googleMapController = controller;
      },
      onTap: (LatLng latLng) {
        print('Checking Real time ${latLng}');
        _currentLatLng = latLng;
        _googleMapController
            .animateCamera(CameraUpdate.newLatLng(_currentLatLng));
        /*_updateMarkerPosition(_currentLatLng);
            _updatePolyLine(
                _currentLatLng);*/ // Add the tapped position to the polyline

        setState(() {});
      },
      markers: _currentMarker != null ? {_currentMarker!} : {},
      polylines: _currentPolyLine != null ? {_currentPolyLine!} : {},
    );
  }

  Widget _buildTimeSection() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 330,
      width: 400,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        // color: Colors.greenAccent,
        /*color: Colors.yellow,*/
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 5,
              width: 45,
              decoration: BoxDecoration(
                  color: Color(0xffE3E3E3),
                  borderRadius: BorderRadius.circular(16)),
            ),
            Gap(10),
            Text(
              '10 minutes left',
              style: textTheme.titleLarge!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Gap(10),
            RichText(
              text: TextSpan(
                text: 'Delivery to  ',
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.8),
                  letterSpacing: 0.4,
                ),
                children: [
                  TextSpan(
                      text: 'Jl. Kpg Sutoyo',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.4))
                ],
              ),
            ),
            const Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 4,
                  width: 71.25,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16)),
                ),
                Container(
                  height: 4,
                  width: 71.25,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16)),
                ),
                Container(
                  height: 4,
                  width: 71.25,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16)),
                ),
                Container(
                  height: 4,
                  width: 71.25,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16)),
                ),
              ],
            ),
            Gap(20),
            _buildCoffeeOrderStatus(),
            _buildCoffeeDeliveryGuyInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildCoffeeOrderStatus() {
    return Container(
      height: 77,
      width: 335,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  AssetPath.deliver,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )),
            Gap(10),
            Container(
              //color: Colors.yellow,
              height: 61,
              width: 243,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Delivered your order',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                    child: Text(
                      'We will deliver your goods to you in the shortest possible time.',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildCoffeeDeliveryGuyInfo() {
    return Container(
      height: 77,
      width: 335,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  AssetPath.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )),
            Gap(10),
            Container(
              //color: Colors.yellow,
              height: 61,
              width: 243,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Brooklyn Simmons',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                    child: Text(
                      'Personal Courier',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    /*
    TODO: CHECK PERMISSION
    TODO: CHECK GPS
    TODO: GET CURRENT LOCATION
    */
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      //
      bool isEnable = await Geolocator.isLocationServiceEnabled();
      if (isEnable) {
        _currentPosition = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.best,
            distanceFilter: 10,
          ),
        );
        _currentLatLng = LatLng(
          _currentPosition!.latitude,
          _currentPosition!.longitude,
        );
        _googleMapController.animateCamera(
          CameraUpdate.newLatLng(_currentLatLng),
        );

        if (mounted) {
          setState(() {});
        }
      } else {
        Geolocator.openLocationSettings();
      }
    } else {
      if (permission == LocationPermission.deniedForever) {
        Geolocator.openAppSettings();
        return;
      }
      LocationPermission p = await Geolocator.requestPermission();
      _getCurrentLocation();
    }
  }

  Future<void> _getRealTimeLocationUpdate() async {
    /*
  TODO: CHECK PERMISSION
  TODO : CHECK GPS SERVICE
  TODO: GET CURRENT LOCATION
  */
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      final isEnable = await Geolocator.isLocationServiceEnabled();
      if (isEnable) {
        Geolocator.getPositionStream(
            locationSettings: const LocationSettings(
          distanceFilter: 10,
          timeLimit: Duration(seconds: 10),
          accuracy: LocationAccuracy.best,
        )).listen(
          (Position position) {
            print(position);
            _currentLatLng = LatLng(position.latitude, position.longitude);
            _googleMapController
                .animateCamera(CameraUpdate.newLatLng(_currentLatLng));
            _updateMarkerPosition(_currentLatLng);
            _updatePolyLine(_currentLatLng);
            setState(() {});
          },
        );
      } else {
        Geolocator.openAppSettings();
      }
    } else {
      if (permission == LocationPermission.deniedForever) {
        Geolocator.openAppSettings();
        return;
      }
      LocationPermission requestPermission =
          await Geolocator.requestPermission();
      if (requestPermission == LocationPermission.always ||
          requestPermission == LocationPermission.whileInUse) {
        _getRealTimeLocationUpdate();
      }
    }
  }

  void _updateMarkerPosition(LatLng newPosition) {
    _currentMarker = Marker(
      markerId: const MarkerId('currentLocation'),
      position: newPosition,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      infoWindow: InfoWindow(
          title: 'My Current Location',
          snippet:
              'Lat: ${newPosition.latitude}, Lng: ${newPosition.longitude}'),
    );
  }

  void _updatePolyLine(LatLng newPosition) {
    _polyLineCoordinates.add(newPosition);
    _currentPolyLine = Polyline(
      polylineId: const PolylineId('trackingPolyLine'),
      color: Colors.greenAccent,
      width: 5,
      points: _polyLineCoordinates,
    );
    setState(() {});
  }
}
