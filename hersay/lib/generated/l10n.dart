// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Enable Audio:`
  String get enableAudio {
    return Intl.message(
      'Enable Audio:',
      name: 'enableAudio',
      desc: '',
      args: [],
    );
  }

  /// `No camera found`
  String get noCameraFound {
    return Intl.message(
      'No camera found',
      name: 'noCameraFound',
      desc: '',
      args: [],
    );
  }

  /// `Error Loading Items!`
  String get errorLoadingItems {
    return Intl.message(
      'Error Loading Items!',
      name: 'errorLoadingItems',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Games List`
  String get gamesList {
    return Intl.message(
      'Games List',
      name: 'gamesList',
      desc: '',
      args: [],
    );
  }

  /// `Request a Swap!`
  String get requestASwap {
    return Intl.message(
      'Request a Swap!',
      name: 'requestASwap',
      desc: '',
      args: [],
    );
  }

  /// `Error Getting Swap Item id!`
  String get errorGettingSwapItemId {
    return Intl.message(
      'Error Getting Swap Item id!',
      name: 'errorGettingSwapItemId',
      desc: '',
      args: [],
    );
  }

  /// `Error Loading Data`
  String get errorLoadingData {
    return Intl.message(
      'Error Loading Data',
      name: 'errorLoadingData',
      desc: '',
      args: [],
    );
  }

  /// `Empty List`
  String get emptyList {
    return Intl.message(
      'Empty List',
      name: 'emptyList',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please Input Phone Number`
  String get pleaseInputPhoneNumber {
    return Intl.message(
      'Please Input Phone Number',
      name: 'pleaseInputPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Loading!`
  String get loading {
    return Intl.message(
      'Loading!',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Send me a Code!`
  String get sendMeACode {
    return Intl.message(
      'Send me a Code!',
      name: 'sendMeACode',
      desc: '',
      args: [],
    );
  }

  /// `Saudi Arabia`
  String get saudiArabia {
    return Intl.message(
      'Saudi Arabia',
      name: 'saudiArabia',
      desc: '',
      args: [],
    );
  }

  /// `USA`
  String get usa {
    return Intl.message(
      'USA',
      name: 'usa',
      desc: '',
      args: [],
    );
  }

  /// `Lebanon`
  String get lebanon {
    return Intl.message(
      'Lebanon',
      name: 'lebanon',
      desc: '',
      args: [],
    );
  }

  /// `Syria`
  String get syria {
    return Intl.message(
      'Syria',
      name: 'syria',
      desc: '',
      args: [],
    );
  }

  /// `Chat Room`
  String get chatRoom {
    return Intl.message(
      'Chat Room',
      name: 'chatRoom',
      desc: '',
      args: [],
    );
  }

  /// `Start Writing`
  String get startWriting {
    return Intl.message(
      'Start Writing',
      name: 'startWriting',
      desc: '',
      args: [],
    );
  }

  /// `Be the First to Comment`
  String get beTheFirstToComment {
    return Intl.message(
      'Be the First to Comment',
      name: 'beTheFirstToComment',
      desc: '',
      args: [],
    );
  }

  /// `Search a Game :)`
  String get searchAGame {
    return Intl.message(
      'Search a Game :)',
      name: 'searchAGame',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `to my collection`
  String get toMyCollection {
    return Intl.message(
      'to my collection',
      name: 'toMyCollection',
      desc: '',
      args: [],
    );
  }

  /// `Please Upload the Image`
  String get pleaseUploadTheImage {
    return Intl.message(
      'Please Upload the Image',
      name: 'pleaseUploadTheImage',
      desc: '',
      args: [],
    );
  }

  /// `Submit Game!`
  String get submitGame {
    return Intl.message(
      'Submit Game!',
      name: 'submitGame',
      desc: '',
      args: [],
    );
  }

  /// `Upload Image`
  String get uploadImage {
    return Intl.message(
      'Upload Image',
      name: 'uploadImage',
      desc: '',
      args: [],
    );
  }

  /// `Empty Tag List`
  String get emptyTagList {
    return Intl.message(
      'Empty Tag List',
      name: 'emptyTagList',
      desc: '',
      args: [],
    );
  }

  /// `Insert via a Preset`
  String get insertViaAPreset {
    return Intl.message(
      'Insert via a Preset',
      name: 'insertViaAPreset',
      desc: '',
      args: [],
    );
  }

  /// `Insert via Camera`
  String get insertViaCamera {
    return Intl.message(
      'Insert via Camera',
      name: 'insertViaCamera',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Feedback!`
  String get feedback {
    return Intl.message(
      'Feedback!',
      name: 'feedback',
      desc: '',
      args: [],
    );
  }

  /// `Feed`
  String get feed {
    return Intl.message(
      'Feed',
      name: 'feed',
      desc: '',
      args: [],
    );
  }

  /// `TOS`
  String get tos {
    return Intl.message(
      'TOS',
      name: 'tos',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Set Exchange Game`
  String get setExchangeGame {
    return Intl.message(
      'Set Exchange Game',
      name: 'setExchangeGame',
      desc: '',
      args: [],
    );
  }

  /// `Start Chat`
  String get startChat {
    return Intl.message(
      'Start Chat',
      name: 'startChat',
      desc: '',
      args: [],
    );
  }

  /// `Set Game`
  String get setGame {
    return Intl.message(
      'Set Game',
      name: 'setGame',
      desc: '',
      args: [],
    );
  }

  /// `Username:`
  String get username {
    return Intl.message(
      'Username:',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get signOut {
    return Intl.message(
      'Sign out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Not Logged in!`
  String get notLoggedIn {
    return Intl.message(
      'Not Logged in!',
      name: 'notLoggedIn',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Empty Comment!`
  String get emptyComment {
    return Intl.message(
      'Empty Comment!',
      name: 'emptyComment',
      desc: '',
      args: [],
    );
  }

  /// `Save Profile`
  String get saveProfile {
    return Intl.message(
      'Save Profile',
      name: 'saveProfile',
      desc: '',
      args: [],
    );
  }

  /// `Saving!`
  String get saving {
    return Intl.message(
      'Saving!',
      name: 'saving',
      desc: '',
      args: [],
    );
  }

  /// `Please Provide a short story about you :)`
  String get pleaseProvideAShortStoryAboutYou {
    return Intl.message(
      'Please Provide a short story about you :)',
      name: 'pleaseProvideAShortStoryAboutYou',
      desc: '',
      args: [],
    );
  }

  /// `Please Provide your Name :)`
  String get pleaseProvideYourName {
    return Intl.message(
      'Please Provide your Name :)',
      name: 'pleaseProvideYourName',
      desc: '',
      args: [],
    );
  }

  /// `Please Upload your Image :)`
  String get pleaseUploadYourImage {
    return Intl.message(
      'Please Upload your Image :)',
      name: 'pleaseUploadYourImage',
      desc: '',
      args: [],
    );
  }

  /// `Uploading`
  String get uploading {
    return Intl.message(
      'Uploading',
      name: 'uploading',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get comment {
    return Intl.message(
      'Comment',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `This Game is Great`
  String get thisGameIsGreat {
    return Intl.message(
      'This Game is Great',
      name: 'thisGameIsGreat',
      desc: '',
      args: [],
    );
  }

  /// `برونزي`
  String get pronze {
    return Intl.message(
      'برونزي',
      name: 'pronze',
      desc: '',
      args: [],
    );
  }

  /// `فضي`
  String get silver {
    return Intl.message(
      'فضي',
      name: 'silver',
      desc: '',
      args: [],
    );
  }

  /// `Anime`
  String get anime {
    return Intl.message(
      'Anime',
      name: 'anime',
      desc: '',
      args: [],
    );
  }

  /// `قيم المسلسل`
  String get EvaluteSerise {
    return Intl.message(
      'قيم المسلسل',
      name: 'EvaluteSerise',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Confirm!`
  String get confirm {
    return Intl.message(
      'Confirm!',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `قيم المسلسل`
  String get RateSeries {
    return Intl.message(
      'قيم المسلسل',
      name: 'RateSeries',
      desc: '',
      args: [],
    );
  }

  /// `حول`
  String get About {
    return Intl.message(
      'حول',
      name: 'About',
      desc: '',
      args: [],
    );
  }

  /// `المزيد`
  String get More {
    return Intl.message(
      'المزيد',
      name: 'More',
      desc: '',
      args: [],
    );
  }

  /// `التصنيف`
  String get Classification {
    return Intl.message(
      'التصنيف',
      name: 'Classification',
      desc: '',
      args: [],
    );
  }

  /// `آخر الحلقات`
  String get LastEpisodes {
    return Intl.message(
      'آخر الحلقات',
      name: 'LastEpisodes',
      desc: '',
      args: [],
    );
  }

  /// `آخر الردود والتعليقات`
  String get LastReplaysAndComments {
    return Intl.message(
      'آخر الردود والتعليقات',
      name: 'LastReplaysAndComments',
      desc: '',
      args: [],
    );
  }

  /// `مشاركة`
  String get Share {
    return Intl.message(
      'مشاركة',
      name: 'Share',
      desc: '',
      args: [],
    );
  }

  /// `أحببته`
  String get Like {
    return Intl.message(
      'أحببته',
      name: 'Like',
      desc: '',
      args: [],
    );
  }

  /// `متابعة`
  String get Follow {
    return Intl.message(
      'متابعة',
      name: 'Follow',
      desc: '',
      args: [],
    );
  }

  /// `حلقة`
  String get Episode {
    return Intl.message(
      'حلقة',
      name: 'Episode',
      desc: '',
      args: [],
    );
  }

  /// `الموسم`
  String get Season {
    return Intl.message(
      'الموسم',
      name: 'Season',
      desc: '',
      args: [],
    );
  }

  /// `حلقات جديدة`
  String get newEpisodes {
    return Intl.message(
      'حلقات جديدة',
      name: 'newEpisodes',
      desc: '',
      args: [],
    );
  }

  /// `مسلسلات متابعة`
  String get watchedSeries {
    return Intl.message(
      'مسلسلات متابعة',
      name: 'watchedSeries',
      desc: '',
      args: [],
    );
  }

  /// `مسلسلات قد تعجبك`
  String get mayLikeSeries {
    return Intl.message(
      'مسلسلات قد تعجبك',
      name: 'mayLikeSeries',
      desc: '',
      args: [],
    );
  }

  /// `ذهبي`
  String get gold {
    return Intl.message(
      'ذهبي',
      name: 'gold',
      desc: '',
      args: [],
    );
  }

  /// `نقطة`
  String get point {
    return Intl.message(
      'نقطة',
      name: 'point',
      desc: '',
      args: [],
    );
  }

  /// `عضو`
  String get member {
    return Intl.message(
      'عضو',
      name: 'member',
      desc: '',
      args: [],
    );
  }

  /// `ابدأ متابعة المسلسلات`
  String get startWachingSeries {
    return Intl.message(
      'ابدأ متابعة المسلسلات',
      name: 'startWachingSeries',
      desc: '',
      args: [],
    );
  }

  /// `ddd`
  String get test {
    return Intl.message(
      'ddd',
      name: 'test',
      desc: '',
      args: [],
    );
  }

  /// `إحصاءات`
  String get statics {
    return Intl.message(
      'إحصاءات',
      name: 'statics',
      desc: '',
      args: [],
    );
  }

  /// `التقييم العام`
  String get generalEvaluation {
    return Intl.message(
      'التقييم العام',
      name: 'generalEvaluation',
      desc: '',
      args: [],
    );
  }

  /// `التعليقات الشهرية`
  String get monthlyComments {
    return Intl.message(
      'التعليقات الشهرية',
      name: 'monthlyComments',
      desc: '',
      args: [],
    );
  }

  /// `تفاعل جديد`
  String get newInteraction {
    return Intl.message(
      'تفاعل جديد',
      name: 'newInteraction',
      desc: '',
      args: [],
    );
  }

  /// `إرسال التعليق`
  String get sendComment {
    return Intl.message(
      'إرسال التعليق',
      name: 'sendComment',
      desc: '',
      args: [],
    );
  }

  /// `اضف تعليقك`
  String get addYourComment {
    return Intl.message(
      'اضف تعليقك',
      name: 'addYourComment',
      desc: '',
      args: [],
    );
  }

  /// `يحوي حرق`
  String get spoilerAlert {
    return Intl.message(
      'يحوي حرق',
      name: 'spoilerAlert',
      desc: '',
      args: [],
    );
  }

  /// `هناك مشكلة ما أعد التعليق لاحقا`
  String get ommentingError {
    return Intl.message(
      'هناك مشكلة ما أعد التعليق لاحقا',
      name: 'ommentingError',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `المسلسلات الموصى بها عالميا`
  String get worldWideSeries {
    return Intl.message(
      'المسلسلات الموصى بها عالميا',
      name: 'worldWideSeries',
      desc: '',
      args: [],
    );
  }

  /// `المسلسلات الموصى بها حسب تفضيلاتك`
  String get recomendationByFavorite {
    return Intl.message(
      'المسلسلات الموصى بها حسب تفضيلاتك',
      name: 'recomendationByFavorite',
      desc: '',
      args: [],
    );
  }

  /// `أعضاء نشيطين`
  String get activeMembers {
    return Intl.message(
      'أعضاء نشيطين',
      name: 'activeMembers',
      desc: '',
      args: [],
    );
  }

  /// `الإعدادات العامة`
  String get genaeralSettings {
    return Intl.message(
      'الإعدادات العامة',
      name: 'genaeralSettings',
      desc: '',
      args: [],
    );
  }

  /// `الحساب`
  String get account {
    return Intl.message(
      'الحساب',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `الخصوصية`
  String get privacy {
    return Intl.message(
      'الخصوصية',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `حصل خطأ ما`
  String get errorHappened {
    return Intl.message(
      'حصل خطأ ما',
      name: 'errorHappened',
      desc: '',
      args: [],
    );
  }

  /// `تابع استخدام التطبيق`
  String get continueUsingApp {
    return Intl.message(
      'تابع استخدام التطبيق',
      name: 'continueUsingApp',
      desc: '',
      args: [],
    );
  }

  /// `عادي`
  String get ordinary {
    return Intl.message(
      'عادي',
      name: 'ordinary',
      desc: '',
      args: [],
    );
  }

  /// `اكتشف`
  String get explore {
    return Intl.message(
      'اكتشف',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  /// `متابع`
  String get isFollowed {
    return Intl.message(
      'متابع',
      name: 'isFollowed',
      desc: '',
      args: [],
    );
  }

  /// `مساعدة`
  String get help {
    return Intl.message(
      'مساعدة',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `تعديل`
  String get edit {
    return Intl.message(
      'تعديل',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `التعليقات`
  String get comments {
    return Intl.message(
      'التعليقات',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `متابعات`
  String get following {
    return Intl.message(
      'متابعات',
      name: 'following',
      desc: '',
      args: [],
    );
  }

  /// `مسلسل`
  String get series {
    return Intl.message(
      'مسلسل',
      name: 'series',
      desc: '',
      args: [],
    );
  }

  /// `عني`
  String get aboutMe {
    return Intl.message(
      'عني',
      name: 'aboutMe',
      desc: '',
      args: [],
    );
  }

  /// `نشاطات`
  String get activities {
    return Intl.message(
      'نشاطات',
      name: 'activities',
      desc: '',
      args: [],
    );
  }

  /// `No New Episodes`
  String get noNewEpisodes {
    return Intl.message(
      'No New Episodes',
      name: 'noNewEpisodes',
      desc: '',
      args: [],
    );
  }

  /// `No Notifications Yet!`
  String get noNotificationsYet {
    return Intl.message(
      'No Notifications Yet!',
      name: 'noNotificationsYet',
      desc: '',
      args: [],
    );
  }

  /// `Your Name`
  String get yourName {
    return Intl.message(
      'Your Name',
      name: 'yourName',
      desc: '',
      args: [],
    );
  }

  /// `name_hont`
  String get name_hont {
    return Intl.message(
      'name_hont',
      name: 'name_hont',
      desc: '',
      args: [],
    );
  }

  /// `Name Hint`
  String get nameHint {
    return Intl.message(
      'Name Hint',
      name: 'nameHint',
      desc: '',
      args: [],
    );
  }

  /// `Name is empty`
  String get nameIsEmpty {
    return Intl.message(
      'Name is empty',
      name: 'nameIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please tell us about your self`
  String get pleaseTellUsAboutYourSelf {
    return Intl.message(
      'Please tell us about your self',
      name: 'pleaseTellUsAboutYourSelf',
      desc: '',
      args: [],
    );
  }

  /// `تم التقييم بنجاح`
  String get ratingSuccessfully {
    return Intl.message(
      'تم التقييم بنجاح',
      name: 'ratingSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `قيم الحلقة`
  String get RateEpisode {
    return Intl.message(
      'قيم الحلقة',
      name: 'RateEpisode',
      desc: '',
      args: [],
    );
  }

  /// `صباح الخير`
  String get GoodMorning {
    return Intl.message(
      'صباح الخير',
      name: 'GoodMorning',
      desc: '',
      args: [],
    );
  }

  /// `مساء الخير`
  String get GoodEvining {
    return Intl.message(
      'مساء الخير',
      name: 'GoodEvining',
      desc: '',
      args: [],
    );
  }

  /// `لقد قمت بتقييم هذا الأنمي مسبقا`
  String get YouHaveRatedThisAnime {
    return Intl.message(
      'لقد قمت بتقييم هذا الأنمي مسبقا',
      name: 'YouHaveRatedThisAnime',
      desc: '',
      args: [],
    );
  }

  /// `لقد قمت بتقييم هذه الحلقة مسبقا`
  String get YouHaveRatedThisEpisode {
    return Intl.message(
      'لقد قمت بتقييم هذه الحلقة مسبقا',
      name: 'YouHaveRatedThisEpisode',
      desc: '',
      args: [],
    );
  }

  /// `شكرا لحماسك`
  String get ThanksYourExcitement {
    return Intl.message(
      'شكرا لحماسك',
      name: 'ThanksYourExcitement',
      desc: '',
      args: [],
    );
  }

  /// `الغاء المتابعة`
  String get unFollow {
    return Intl.message(
      'الغاء المتابعة',
      name: 'unFollow',
      desc: '',
      args: [],
    );
  }

  /// `I have account`
  String get iHaveAnAccount {
    return Intl.message(
      'I have account',
      name: 'iHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `سجل حسابا جديدا`
  String get registerNewAccount {
    return Intl.message(
      'سجل حسابا جديدا',
      name: 'registerNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `لا املك حسابا`
  String get iDontHaveAnAccount {
    return Intl.message(
      'لا املك حسابا',
      name: 'iDontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Ca not Sign in!`
  String get caNotSignIn {
    return Intl.message(
      'Ca not Sign in!',
      name: 'caNotSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Create new account`
  String get createNewAccount {
    return Intl.message(
      'Create new account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Select an Image`
  String get selectAnImage {
    return Intl.message(
      'Select an Image',
      name: 'selectAnImage',
      desc: '',
      args: [],
    );
  }

  /// `تعليقات سابقة`
  String get previousComments {
    return Intl.message(
      'تعليقات سابقة',
      name: 'previousComments',
      desc: '',
      args: [],
    );
  }

  /// `التصنيفات`
  String get categories {
    return Intl.message(
      'التصنيفات',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `ابحث عن انمي`
  String get searchForAnAnime {
    return Intl.message(
      'ابحث عن انمي',
      name: 'searchForAnAnime',
      desc: '',
      args: [],
    );
  }

  /// `مسلسلات تصدر قريبا`
  String get comingSoonSeries {
    return Intl.message(
      'مسلسلات تصدر قريبا',
      name: 'comingSoonSeries',
      desc: '',
      args: [],
    );
  }

  /// `حلقات ستصدر قريباً`
  String get comingSoonEpisodes {
    return Intl.message(
      'حلقات ستصدر قريباً',
      name: 'comingSoonEpisodes',
      desc: '',
      args: [],
    );
  }

  /// `اخفاء التعليقات`
  String get hideComments {
    return Intl.message(
      'اخفاء التعليقات',
      name: 'hideComments',
      desc: '',
      args: [],
    );
  }

  /// `اظهار التعليقات`
  String get showComments {
    return Intl.message(
      'اظهار التعليقات',
      name: 'showComments',
      desc: '',
      args: [],
    );
  }

  /// `هذا التعليق يحوي حرق`
  String get commentContainsSpoiler {
    return Intl.message(
      'هذا التعليق يحوي حرق',
      name: 'commentContainsSpoiler',
      desc: '',
      args: [],
    );
  }

  /// `confirm code`
  String get confirmCode {
    return Intl.message(
      'confirm code',
      name: 'confirmCode',
      desc: '',
      args: [],
    );
  }

  /// `resend code`
  String get resendCode {
    return Intl.message(
      'resend code',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `email address is required`
  String get emailAddressIsRequired {
    return Intl.message(
      'email address is required',
      name: 'emailAddressIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `send me code`
  String get sendMeCode {
    return Intl.message(
      'send me code',
      name: 'sendMeCode',
      desc: '',
      args: [],
    );
  }

  /// `this field cannot be empty`
  String get thisFieldCannotBeEmpty {
    return Intl.message(
      'this field cannot be empty',
      name: 'thisFieldCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `you can use only numbers`
  String get youCanUseOnlyNumbers {
    return Intl.message(
      'you can use only numbers',
      name: 'youCanUseOnlyNumbers',
      desc: '',
      args: [],
    );
  }

  /// `الرجاء ادخال الإيميل الخاص بك`
  String get pleaseEnterYourEmail {
    return Intl.message(
      'الرجاء ادخال الإيميل الخاص بك',
      name: 'pleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور يجب ان تكون من 5 محارف على الأقل`
  String get passwordShouldBeAtLeastFiveChar {
    return Intl.message(
      'كلمة المرور يجب ان تكون من 5 محارف على الأقل',
      name: 'passwordShouldBeAtLeastFiveChar',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Chats`
  String get chats {
    return Intl.message(
      'Chats',
      name: 'chats',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Manual`
  String get manual {
    return Intl.message(
      'Manual',
      name: 'manual',
      desc: '',
      args: [],
    );
  }

  /// `Automatic`
  String get automatic {
    return Intl.message(
      'Automatic',
      name: 'automatic',
      desc: '',
      args: [],
    );
  }

  /// `Benzene`
  String get benzene {
    return Intl.message(
      'Benzene',
      name: 'benzene',
      desc: '',
      args: [],
    );
  }

  /// `Diesel`
  String get diesel {
    return Intl.message(
      'Diesel',
      name: 'diesel',
      desc: '',
      args: [],
    );
  }

  /// `Accepted`
  String get accepted {
    return Intl.message(
      'Accepted',
      name: 'accepted',
      desc: '',
      args: [],
    );
  }

  /// `Un accepted`
  String get unAccepted {
    return Intl.message(
      'Un accepted',
      name: 'unAccepted',
      desc: '',
      args: [],
    );
  }

  /// `Car Type`
  String get carType {
    return Intl.message(
      'Car Type',
      name: 'carType',
      desc: '',
      args: [],
    );
  }

  /// `Brand`
  String get brand {
    return Intl.message(
      'Brand',
      name: 'brand',
      desc: '',
      args: [],
    );
  }

  /// `Company`
  String get company {
    return Intl.message(
      'Company',
      name: 'company',
      desc: '',
      args: [],
    );
  }

  /// `Engine`
  String get engine {
    return Intl.message(
      'Engine',
      name: 'engine',
      desc: '',
      args: [],
    );
  }

  /// `Year of release`
  String get yearOfRelease {
    return Intl.message(
      'Year of release',
      name: 'yearOfRelease',
      desc: '',
      args: [],
    );
  }

  /// `Gear Type`
  String get gearType {
    return Intl.message(
      'Gear Type',
      name: 'gearType',
      desc: '',
      args: [],
    );
  }

  /// `state`
  String get state {
    return Intl.message(
      'state',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `Mileages`
  String get mileages {
    return Intl.message(
      'Mileages',
      name: 'mileages',
      desc: '',
      args: [],
    );
  }

  /// `CC`
  String get cc {
    return Intl.message(
      'CC',
      name: 'cc',
      desc: '',
      args: [],
    );
  }

  /// `Fuel`
  String get fuel {
    return Intl.message(
      'Fuel',
      name: 'fuel',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `description`
  String get roomsDescription {
    return Intl.message(
      'description',
      name: 'roomsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Select main image`
  String get selectMainImage {
    return Intl.message(
      'Select main image',
      name: 'selectMainImage',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `your request has been added and in hold for admin approval`
  String get yourRequestHasBeenAddedAndInHoldForAdmin {
    return Intl.message(
      'your request has been added and in hold for admin approval',
      name: 'yourRequestHasBeenAddedAndInHoldForAdmin',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Sell Phone`
  String get sellPhone {
    return Intl.message(
      'Sell Phone',
      name: 'sellPhone',
      desc: '',
      args: [],
    );
  }

  /// `Laptop`
  String get laptop {
    return Intl.message(
      'Laptop',
      name: 'laptop',
      desc: '',
      args: [],
    );
  }

  /// `Desktop`
  String get desktop {
    return Intl.message(
      'Desktop',
      name: 'desktop',
      desc: '',
      args: [],
    );
  }

  /// `Headphone`
  String get headphone {
    return Intl.message(
      'Headphone',
      name: 'headphone',
      desc: '',
      args: [],
    );
  }

  /// `Device Type`
  String get deviceType {
    return Intl.message(
      'Device Type',
      name: 'deviceType',
      desc: '',
      args: [],
    );
  }

  /// `Cpu`
  String get cpu {
    return Intl.message(
      'Cpu',
      name: 'cpu',
      desc: '',
      args: [],
    );
  }

  /// `RAM`
  String get ram {
    return Intl.message(
      'RAM',
      name: 'ram',
      desc: '',
      args: [],
    );
  }

  /// `Battery`
  String get battery {
    return Intl.message(
      'Battery',
      name: 'battery',
      desc: '',
      args: [],
    );
  }

  /// `Build Year`
  String get buildYear {
    return Intl.message(
      'Build Year',
      name: 'buildYear',
      desc: '',
      args: [],
    );
  }

  /// `Use Duration`
  String get useDuration {
    return Intl.message(
      'Use Duration',
      name: 'useDuration',
      desc: '',
      args: [],
    );
  }

  /// `Guage`
  String get guage {
    return Intl.message(
      'Guage',
      name: 'guage',
      desc: '',
      args: [],
    );
  }

  /// `furnished`
  String get furnished {
    return Intl.message(
      'furnished',
      name: 'furnished',
      desc: '',
      args: [],
    );
  }

  /// `unfurnished`
  String get unfurnished {
    return Intl.message(
      'unfurnished',
      name: 'unfurnished',
      desc: '',
      args: [],
    );
  }

  /// `Real Estate Type`
  String get realEstateType {
    return Intl.message(
      'Real Estate Type',
      name: 'realEstateType',
      desc: '',
      args: [],
    );
  }

  /// `Space`
  String get space {
    return Intl.message(
      'Space',
      name: 'space',
      desc: '',
      args: [],
    );
  }

  /// `Appartment Floor or Number of Floors`
  String get appartmentFloorOrNumberOfFloors {
    return Intl.message(
      'Appartment Floor or Number of Floors',
      name: 'appartmentFloorOrNumberOfFloors',
      desc: '',
      args: [],
    );
  }

  /// `Cladding`
  String get cladding {
    return Intl.message(
      'Cladding',
      name: 'cladding',
      desc: '',
      args: [],
    );
  }

  /// `Home Furmishing`
  String get homeFurmishing {
    return Intl.message(
      'Home Furmishing',
      name: 'homeFurmishing',
      desc: '',
      args: [],
    );
  }

  /// `Rooms number`
  String get roomsNumber {
    return Intl.message(
      'Rooms number',
      name: 'roomsNumber',
      desc: '',
      args: [],
    );
  }

  /// `upload Pics`
  String get uploadPics {
    return Intl.message(
      'upload Pics',
      name: 'uploadPics',
      desc: '',
      args: [],
    );
  }

  /// `Show Pics`
  String get showPics {
    return Intl.message(
      'Show Pics',
      name: 'showPics',
      desc: '',
      args: [],
    );
  }

  /// `Type :`
  String get type {
    return Intl.message(
      'Type :',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Traveled Distance :`
  String get traveledDistance {
    return Intl.message(
      'Traveled Distance :',
      name: 'traveledDistance',
      desc: '',
      args: [],
    );
  }

  /// `Dureation of use :`
  String get dureationOfUse {
    return Intl.message(
      'Dureation of use :',
      name: 'dureationOfUse',
      desc: '',
      args: [],
    );
  }

  /// `Cylynder :`
  String get cylynder {
    return Intl.message(
      'Cylynder :',
      name: 'cylynder',
      desc: '',
      args: [],
    );
  }

  /// `Plated`
  String get plated {
    return Intl.message(
      'Plated',
      name: 'plated',
      desc: '',
      args: [],
    );
  }

  /// `Request Lawer`
  String get requestLawer {
    return Intl.message(
      'Request Lawer',
      name: 'requestLawer',
      desc: '',
      args: [],
    );
  }

  /// `Request Chat`
  String get requestChat {
    return Intl.message(
      'Request Chat',
      name: 'requestChat',
      desc: '',
      args: [],
    );
  }

  /// `Duration of use :`
  String get durationOfUse {
    return Intl.message(
      'Duration of use :',
      name: 'durationOfUse',
      desc: '',
      args: [],
    );
  }

  /// `Display :`
  String get display {
    return Intl.message(
      'Display :',
      name: 'display',
      desc: '',
      args: [],
    );
  }

  /// `Processor :`
  String get processor {
    return Intl.message(
      'Processor :',
      name: 'processor',
      desc: '',
      args: [],
    );
  }

  /// `Storage :`
  String get storage {
    return Intl.message(
      'Storage :',
      name: 'storage',
      desc: '',
      args: [],
    );
  }

  /// `Graphics :`
  String get graphics {
    return Intl.message(
      'Graphics :',
      name: 'graphics',
      desc: '',
      args: [],
    );
  }

  /// `Floors number :`
  String get floorsNumber {
    return Intl.message(
      'Floors number :',
      name: 'floorsNumber',
      desc: '',
      args: [],
    );
  }

  /// `Address :`
  String get address {
    return Intl.message(
      'Address :',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Rooms :`
  String get rooms {
    return Intl.message(
      'Rooms :',
      name: 'rooms',
      desc: '',
      args: [],
    );
  }

  /// `Edit Account`
  String get editAccount {
    return Intl.message(
      'Edit Account',
      name: 'editAccount',
      desc: '',
      args: [],
    );
  }

  /// `what you want to seach about`
  String get whatYouWantToSeachAbout {
    return Intl.message(
      'what you want to seach about',
      name: 'whatYouWantToSeachAbout',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Chat with Owner`
  String get chatWithOwner {
    return Intl.message(
      'Chat with Owner',
      name: 'chatWithOwner',
      desc: '',
      args: [],
    );
  }

  /// `Chat with Lawyer`
  String get chatWithLawyer {
    return Intl.message(
      'Chat with Lawyer',
      name: 'chatWithLawyer',
      desc: '',
      args: [],
    );
  }

  /// `likes your`
  String get likesYour {
    return Intl.message(
      'likes your',
      name: 'likesYour',
      desc: '',
      args: [],
    );
  }

  /// `Go Back`
  String get goBack {
    return Intl.message(
      'Go Back',
      name: 'goBack',
      desc: '',
      args: [],
    );
  }

  /// `description`
  String get descriptio {
    return Intl.message(
      'description',
      name: 'descriptio',
      desc: '',
      args: [],
    );
  }

  /// `car`
  String get car {
    return Intl.message(
      'car',
      name: 'car',
      desc: '',
      args: [],
    );
  }

  /// `realEstate`
  String get realestate {
    return Intl.message(
      'realEstate',
      name: 'realestate',
      desc: '',
      args: [],
    );
  }

  /// `device`
  String get device {
    return Intl.message(
      'device',
      name: 'device',
      desc: '',
      args: [],
    );
  }

  /// `Advanced search`
  String get advancedSearch {
    return Intl.message(
      'Advanced search',
      name: 'advancedSearch',
      desc: '',
      args: [],
    );
  }

  /// `choose entity`
  String get chooseEntity {
    return Intl.message(
      'choose entity',
      name: 'chooseEntity',
      desc: '',
      args: [],
    );
  }

  /// `please give us your name`
  String get pleaseGiveUsYourName {
    return Intl.message(
      'please give us your name',
      name: 'pleaseGiveUsYourName',
      desc: '',
      args: [],
    );
  }

  /// `Profile updated successfully`
  String get profileUpdatedSuccessfully {
    return Intl.message(
      'Profile updated successfully',
      name: 'profileUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Back to home`
  String get backToHome {
    return Intl.message(
      'Back to home',
      name: 'backToHome',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Lowest Price`
  String get lowestPrice {
    return Intl.message(
      'Lowest Price',
      name: 'lowestPrice',
      desc: '',
      args: [],
    );
  }

  /// `Highest Price`
  String get highestPrice {
    return Intl.message(
      'Highest Price',
      name: 'highestPrice',
      desc: '',
      args: [],
    );
  }

  /// `Select your image`
  String get selectYourImage {
    return Intl.message(
      'Select your image',
      name: 'selectYourImage',
      desc: '',
      args: [],
    );
  }

  /// `You do not have any notification`
  String get youDoNotHaveAnyNotification {
    return Intl.message(
      'You do not have any notification',
      name: 'youDoNotHaveAnyNotification',
      desc: '',
      args: [],
    );
  }

  /// `You did not sell or buy any thing yet`
  String get youDidNotSellOrBuyAnyThingYet {
    return Intl.message(
      'You did not sell or buy any thing yet',
      name: 'youDidNotSellOrBuyAnyThingYet',
      desc: '',
      args: [],
    );
  }

  /// `You did not chat with any one`
  String get youDidNotChatWithAnyOne {
    return Intl.message(
      'You did not chat with any one',
      name: 'youDidNotChatWithAnyOne',
      desc: '',
      args: [],
    );
  }

  /// `Started at :`
  String get startedAt {
    return Intl.message(
      'Started at :',
      name: 'startedAt',
      desc: '',
      args: [],
    );
  }

  /// `Add more images`
  String get addMoreImages {
    return Intl.message(
      'Add more images',
      name: 'addMoreImages',
      desc: '',
      args: [],
    );
  }

  /// `Thre is not other images`
  String get threIsNotOtherImages {
    return Intl.message(
      'Thre is not other images',
      name: 'threIsNotOtherImages',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `image:`
  String get image {
    return Intl.message(
      'image:',
      name: 'image',
      desc: '',
      args: [],
    );
  }

  /// `Images`
  String get images {
    return Intl.message(
      'Images',
      name: 'images',
      desc: '',
      args: [],
    );
  }

  /// `Create report`
  String get createReport {
    return Intl.message(
      'Create report',
      name: 'createReport',
      desc: '',
      args: [],
    );
  }

  /// `Reason is required`
  String get reasonIsRequired {
    return Intl.message(
      'Reason is required',
      name: 'reasonIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Reason of the report`
  String get reasonOfTheReport {
    return Intl.message(
      'Reason of the report',
      name: 'reasonOfTheReport',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Please complete the form`
  String get pleaseCompleteTheForm {
    return Intl.message(
      'Please complete the form',
      name: 'pleaseCompleteTheForm',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get report {
    return Intl.message(
      'Report',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `your report was sent to the Admin`
  String get yourReportWasSentToTheAdmin {
    return Intl.message(
      'your report was sent to the Admin',
      name: 'yourReportWasSentToTheAdmin',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}