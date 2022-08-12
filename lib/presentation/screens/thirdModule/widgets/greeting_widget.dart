import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raftlabs_assignment/presentation/shared/helper_widgets.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({Key? key}) : super(key: key);

  Greetings get decideGreetingMessaage {
    final time = DateTime.now().hour;
    print(time);
    if (time < 12) {
      return Greetings("Good Morning",
          "https://wallpaperboat.com/wp-content/uploads/2020/04/morning-wallpaper-download-full-2.jpg");
    }
    if (time <= 16 && time >= 12) {
      return Greetings("Good Afternoon",
          "https://th.bing.com/th/id/OIP.zOq9txd9XNOg_vpyFii2bgHaFj?w=252&h=189&c=7&r=0&o=5&dpr=1.56&pid=1.7");
    }
    if (time <= 20 && time > 16) {
      return Greetings("Good Evening",
          "https://th.bing.com/th/id/OIP.UI5_qhO9bRO_VqFCFjD3JQHaE7?pid=ImgDet&rs=1");
    }
    return Greetings("Good Night",
        "https://preview.redd.it/0079yvsnusg31.jpg?auto=webp&s=b7e445873fb4c7960e3b0a876ae00427cdae98f4");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ps8,
      child: SizedBox(
        height: 0.4.sh,
        child: Column(
          children: [
            Text(
              decideGreetingMessaage.text,
              style: TextStyle(fontSize: 30.sp),
            ),
            Image.network(
              decideGreetingMessaage.imageUrl,
              height: 0.3.sh,
              width: double.infinity,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}

class Greetings {
  final String text;
  final String imageUrl;

  Greetings(this.text, this.imageUrl);
}
