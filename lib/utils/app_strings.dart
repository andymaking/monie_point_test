import 'dart:convert';

class ImageUrl {
  static const String homeImage1 = "https://res.cloudinary.com/dpxwaza71/image/upload/v1742466814/WhatsApp_Image_2025-03-20_at_11.31.34_AM_2_yfqdta.jpg";
  static const String homeImage2 = "https://res.cloudinary.com/dpxwaza71/image/upload/v1742466814/WhatsApp_Image_2025-03-20_at_11.31.33_AM_bsdbuf.jpg";
  static const String homeImage3 = "https://res.cloudinary.com/dpxwaza71/image/upload/v1742466814/WhatsApp_Image_2025-03-20_at_11.31.33_AM_1_yasfew.jpg";
  static const String homeImage4 = "https://res.cloudinary.com/dpxwaza71/image/upload/v1742670248/WhatsApp_Image_2025-03-20_at_11.31.34_AM_yuakwu.jpg";
  static const String homeImage5 = "https://res.cloudinary.com/dpxwaza71/image/upload/v1742670248/WhatsApp_Image_2025-03-20_at_11.31.34_AM_3_zvxwcv.jpg";
  static const String homeImage6 = "https://res.cloudinary.com/dpxwaza71/image/upload/v1742669617/e07a976e3a22cf55743dcd04208df4d5_f4tlkj.jpg";
  static String mapSetting = jsonEncode([
    {
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#242f3e"
        }
      ]
    },
    {
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#746855"
        }
      ]
    },
    {
      "elementType": "labels.text.stroke",
      "stylers": [
        {
          "color": "#242f3e"
        }
      ]
    },
    {
      "featureType": "administrative.locality",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#d59563"
        }
      ]
    },
    {
      "featureType": "poi",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#d59563"
        }
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#263c3f"
        }
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#6b9a76"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#38414e"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry.stroke",
      "stylers": [
        {
          "color": "#212a37"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#9ca5b3"
        }
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#746855"
        }
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "geometry.stroke",
      "stylers": [
        {
          "color": "#1f2835"
        }
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#f3d19c"
        }
      ]
    },
    {
      "featureType": "transit",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#2f3948"
        }
      ]
    },
    {
      "featureType": "transit.station",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#d59563"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#17263c"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#515c6d"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "labels.text.stroke",
      "stylers": [
        {
          "color": "#17263c"
        }
      ]
    }
  ]);
}


class AppString {
  static const String stPetersburg = "Saint Petersburg";
  static const String hiMarina = "Hi, Marina";
  static const String letsCreateYourPlace = "Let's select your\nperfect place";
  static const String buy = "buy";
  static const String offers = "offers";
  static const String rent = "rent";
  static const String listOfVariant = "List of variant";
}