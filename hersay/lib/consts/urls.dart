class Urls {
  static const String DOMAIN = 'http://turkey-app.yes-cloud.de';
  static const String BASE_API = DOMAIN + '/html/public/index.php';
  static const String IMAGES_ROOT = DOMAIN + '/upload/';
  //USER APIS
  static const API_SIGN_UP = BASE_API + '/user';
  static const PROFILE = BASE_API + '/userprofile';
  static const CREATE_TOKEN_API = BASE_API + '/login_check';
  //REAL ESTATE APIS
  static const ADD_NEW_REAL_ESTATE = BASE_API + '/realEstate';
  static const ALL_REAL_ESTATES = BASE_API + '/allRealEstate';
  static const GET_REAL_ESTATE_DETAILS = BASE_API + '/realEstate/';
  static const GET_USER_REAL_ESTATES = BASE_API + '/realEstates';
  static const DELETE_REAL_ESTATE = BASE_API +'/realEstate/';
  //CAR APIS
  static const ADD_NEW_CAR = BASE_API + '/cars';
  static const ALL_CARS = BASE_API + '/allCars';
  static const GET_CAR_DETAILS = BASE_API + '/car/';
  static const GET_USER_CARS = BASE_API + '/cars';
  static const DELETE_CAR = BASE_API +'/cars/';
  //ELECTRONIC DEVICES APIS
  static const ADD_NEW_DEVICE = BASE_API + '/devices';
  static const ALL_DEVICES = BASE_API + '/allDevices';
  static const GET_DEVICE_DETAILS = BASE_API + '/device/';
  static const GET_USER_DEVICES = BASE_API + '/devices';
  static const DELETE_DEVICE = BASE_API +'/devices/';
  //SEARCH AND FILTRATION
  static const SEARCH = BASE_API + '/search/';
  static const FILTERED_SEARCH = BASE_API + '/filter';
  //IMAGES
  static const UPLOAD_FILE = BASE_API + '/uploadfile';
  static const ADD_PRODUCT_IMAGE = BASE_API + '/image';
  //NOTIFICATION
  static const NOTIFICATION = BASE_API +'/notification';
  //HISTORY
  static const HISTORY = BASE_API +'/history';
  //CHAT
  static const CHAT = BASE_API + '/chat';
  static const MY_CHATS = BASE_API + '/getallchat';
  //REACTION
  static const REACT = BASE_API + '/reactions';
  static const DELETE_REACT = BASE_API + '/reaction/';
  //REPORT
  static const REPORT_API = BASE_API + '/report';



}
