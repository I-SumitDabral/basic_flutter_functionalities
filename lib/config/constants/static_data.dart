import 'dart:math';

import 'package:audio_service/audio_service.dart';
import 'package:raftlabs_assignment/config/constants/app_strings.dart';

class StaticData {
  StaticData._();
  static const List<String> navBarDataList = [
    AppStrings.firstModule,
    AppStrings.secondModule,
    AppStrings.thirdModule,
    AppStrings.fourthModule,
  ];
  static const List<String> categoryList = [
    "Animals",
    "Anime",
    "Anti-Malware",
    "Art \u0026 Design",
    "Authentication \u0026 Authorization",
    "Blockchain",
    "Books",
    "Business",
    "Calendar",
    "Cloud Storage \u0026 File Sharing",
    "Continuous Integration",
    "Cryptocurrency",
    "Currency Exchange",
    "Data Validation",
    "Development",
    "Dictionaries",
    "Documents \u0026 Productivity",
    "Email",
    "Entertainment",
    "Environment",
    "Events",
    "Finance",
    "Food \u0026 Drink",
    "Games \u0026 Comics",
    "Geocoding",
    "Government",
    "Health",
    "Jobs",
    "Machine Learning",
    "Music",
    "News",
    "Open Data",
    "Open Source Projects",
    "Patent",
    "Personality",
    "Phone",
    "Photography",
    "Programming",
    "Science \u0026 Math",
    "Security",
    "Shopping",
    "Social",
    "Sports \u0026 Fitness",
    "Test Data",
    "Text Analysis",
    "Tracking",
    "Transportation",
    "URL Shorteners",
    "Vehicle",
    "Video",
    "Weather"
  ];

  static double calculateDistance(
    lat1,
    lon1,
  ) {
    double lat2 = 37.0902;
    double lon2 = 95.7129;
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  static const config = AudioServiceConfig(
    androidNotificationChannelId:
        'com.example.raftlabs_assignment.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
}
