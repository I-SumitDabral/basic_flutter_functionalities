import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:raftlabs_assignment/domain/entities/location/location_model.dart';

@lazySingleton
class LocationClient {
  final Location _location;

  LocationClient(this._location);

  Future<LocationModel?> getCurrentLocation() async {
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    locationData = await _location.getLocation();
    final lat = locationData.latitude;
    final long = locationData.longitude;
    if (lat == null || long == null) {
      return null;
    }
    return LocationModel(lat, long);
  }
}
