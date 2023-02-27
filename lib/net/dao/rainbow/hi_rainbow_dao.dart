import 'package:flutter_task_project/net/http/core/hi_net.dart';
import 'package:flutter_task_project/net/http/request/hi_base_request.dart';
import 'package:flutter_task_project/net/http/request/rainbow/hi_rainbow_carousel_request.dart';
import 'package:flutter_task_project/net/http/request/rainbow/hi_rainbow_feeds_request.dart';

class HiRainbowDao {
  static fetchCarousel() {
    return _sendCarousel();
  }

  static fetchFeeds(int pageIndex) {
    return _sendFeeds(pageIndex);
  }

  static _sendCarousel() async {
    HiBaseRequest request;
    request = HiRainbowCarouselRequest();
    request.add("userType", 1);
    var result = await HiNet().fire(request);
    return result;
  }

  static _sendFeeds(int pageIndex) async {
    HiBaseRequest request;
    request = HiRainbowFeedsRequest();
    request.add("TouristID", "9F2DB667-E32F-47BB-9A5E-23ED1C013800");
    request.add("userId",
        "xiYKGnf7tf\/pNKH3y6K3iAdaU7OHRAZVEsSdBBd+hD+rTcelwJ3VYgfZVJlXRNjHAtPZ\/RRORrHvwEYdXQhLsMrp12F0FKrvFT2rUHwO0Aj3TLXMPB9MJzRwXpGf44sM3JuE1as+ISilADt4ChTE5aZdCJZJWbEOdo5dN6Q7x9o=");
    request.add("pageindex", pageIndex);
    var result = await HiNet().fire(request);
    return result;
  }
}
