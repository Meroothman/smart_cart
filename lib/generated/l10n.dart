// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Auto shop`
  String get app_name {
    return Intl.message(
      'Auto shop',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Smart Market`
  String get on_board_title {
    return Intl.message(
      'Welcome to Smart Market',
      name: 'on_board_title',
      desc: '',
      args: [],
    );
  }

  /// `Easy Scan QR Code`
  String get on_board_title2 {
    return Intl.message(
      'Easy Scan QR Code',
      name: 'on_board_title2',
      desc: '',
      args: [],
    );
  }

  /// `Easy Shopping for you`
  String get on_board_title3 {
    return Intl.message(
      'Easy Shopping for you',
      name: 'on_board_title3',
      desc: '',
      args: [],
    );
  }

  /// `Easy end of your shopping`
  String get on_board_title4 {
    return Intl.message(
      'Easy end of your shopping',
      name: 'on_board_title4',
      desc: '',
      args: [],
    );
  }

  /// `Secure and Easy Payment`
  String get on_board_title5 {
    return Intl.message(
      'Secure and Easy Payment',
      name: 'on_board_title5',
      desc: '',
      args: [],
    );
  }

  /// `Prepare for a seamless shopping experience with our smart trolley.Let's start!`
  String get on_board_body {
    return Intl.message(
      'Prepare for a seamless shopping experience with our smart trolley.Let\'s start!',
      name: 'on_board_body',
      desc: '',
      args: [],
    );
  }

  /// `Link your Cart to the app by scanning its QR code for convenient shopping features`
  String get on_board_body2 {
    return Intl.message(
      'Link your Cart to the app by scanning its QR code for convenient shopping features',
      name: 'on_board_body2',
      desc: '',
      args: [],
    );
  }

  /// `Put Your Products in Trolley Ensure products are placed clearly in the trolley for easy reading, enabling a smooth shopping experience`
  String get on_board_body3 {
    return Intl.message(
      'Put Your Products in Trolley Ensure products are placed clearly in the trolley for easy reading, enabling a smooth shopping experience',
      name: 'on_board_body3',
      desc: '',
      args: [],
    );
  }

  /// `The app calculates your total in real-time. Click checkout when done.`
  String get on_board_body4 {
    return Intl.message(
      'The app calculates your total in real-time. Click checkout when done.',
      name: 'on_board_body4',
      desc: '',
      args: [],
    );
  }

  /// `Pay securely through the app for a hassle-free checkout, embracing the future of shopping!`
  String get on_board_body5 {
    return Intl.message(
      'Pay securely through the app for a hassle-free checkout, embracing the future of shopping!',
      name: 'on_board_body5',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next_text {
    return Intl.message(
      'Next',
      name: 'next_text',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip_text {
    return Intl.message(
      'Skip',
      name: 'skip_text',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get my_cart_title {
    return Intl.message(
      'My Cart',
      name: 'my_cart_title',
      desc: '',
      args: [],
    );
  }

  /// `Order Total Price`
  String get order_info_item_title {
    return Intl.message(
      'Order Total Price',
      name: 'order_info_item_title',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get order_discount_title {
    return Intl.message(
      'Discount',
      name: 'order_discount_title',
      desc: '',
      args: [],
    );
  }

  /// ` Total Price`
  String get total_price {
    return Intl.message(
      ' Total Price',
      name: 'total_price',
      desc: '',
      args: [],
    );
  }

  /// `Price :`
  String get price_text {
    return Intl.message(
      'Price :',
      name: 'price_text',
      desc: '',
      args: [],
    );
  }

  /// `quantity :`
  String get quantity_text {
    return Intl.message(
      'quantity :',
      name: 'quantity_text',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get EGP {
    return Intl.message(
      'EGP',
      name: 'EGP',
      desc: '',
      args: [],
    );
  }

  /// ` total:`
  String get total_text {
    return Intl.message(
      ' total:',
      name: 'total_text',
      desc: '',
      args: [],
    );
  }

  /// `CheckOut  >`
  String get check_out_text {
    return Intl.message(
      'CheckOut  >',
      name: 'check_out_text',
      desc: '',
      args: [],
    );
  }

  /// `CheckOut`
  String get check_out_title {
    return Intl.message(
      'CheckOut',
      name: 'check_out_title',
      desc: '',
      args: [],
    );
  }

  /// `Orders History`
  String get orders_history_text {
    return Intl.message(
      'Orders History',
      name: 'orders_history_text',
      desc: '',
      args: [],
    );
  }

  /// `No orders yet! Go shopping!`
  String get orders_history_title {
    return Intl.message(
      'No orders yet! Go shopping!',
      name: 'orders_history_title',
      desc: '',
      args: [],
    );
  }

  /// `Order ID :`
  String get order_id {
    return Intl.message(
      'Order ID :',
      name: 'order_id',
      desc: '',
      args: [],
    );
  }

  /// `Order Date :`
  String get order_date {
    return Intl.message(
      'Order Date :',
      name: 'order_date',
      desc: '',
      args: [],
    );
  }

  /// ` Continue `
  String get continue_title_button {
    return Intl.message(
      ' Continue ',
      name: 'continue_title_button',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_title {
    return Intl.message(
      'Login',
      name: 'login_title',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up_title {
    return Intl.message(
      'Sign Up',
      name: 'sign_up_title',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email_title {
    return Intl.message(
      'Email',
      name: 'email_title',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password_title {
    return Intl.message(
      'Password',
      name: 'password_title',
      desc: '',
      args: [],
    );
  }

  /// ` Phone`
  String get phone_title {
    return Intl.message(
      ' Phone',
      name: 'phone_title',
      desc: '',
      args: [],
    );
  }

  /// ` Name`
  String get name_title {
    return Intl.message(
      ' Name',
      name: 'name_title',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get fName_title {
    return Intl.message(
      'First Name',
      name: 'fName_title',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lName_title {
    return Intl.message(
      'Last Name',
      name: 'lName_title',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language_text {
    return Intl.message(
      'Language',
      name: 'language_text',
      desc: '',
      args: [],
    );
  }

  /// `Setting `
  String get setting_text {
    return Intl.message(
      'Setting ',
      name: 'setting_text',
      desc: '',
      args: [],
    );
  }

  /// `History `
  String get history_text {
    return Intl.message(
      'History ',
      name: 'history_text',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account_text {
    return Intl.message(
      'Account',
      name: 'account_text',
      desc: '',
      args: [],
    );
  }

  /// ` Something went wrong , please try again `
  String get update_failure_text {
    return Intl.message(
      ' Something went wrong , please try again ',
      name: 'update_failure_text',
      desc: '',
      args: [],
    );
  }

  /// `Edit Name`
  String get edit_name_text {
    return Intl.message(
      'Edit Name',
      name: 'edit_name_text',
      desc: '',
      args: [],
    );
  }

  /// `Edit Email`
  String get edit_email_text {
    return Intl.message(
      'Edit Email',
      name: 'edit_email_text',
      desc: '',
      args: [],
    );
  }

  /// `Edit Phone`
  String get edit_phone_text {
    return Intl.message(
      'Edit Phone',
      name: 'edit_phone_text',
      desc: '',
      args: [],
    );
  }

  /// `Data Changed Successfully`
  String get data_changed_successfully_text {
    return Intl.message(
      'Data Changed Successfully',
      name: 'data_changed_successfully_text',
      desc: '',
      args: [],
    );
  }

  /// `or continue with`
  String get continue_with_text {
    return Intl.message(
      'or continue with',
      name: 'continue_with_text',
      desc: '',
      args: [],
    );
  }

  /// `Scan the QR code on your trolley to`
  String get scan_qr_title {
    return Intl.message(
      'Scan the QR code on your trolley to',
      name: 'scan_qr_title',
      desc: '',
      args: [],
    );
  }

  /// `Start shopping`
  String get start_shopping_text {
    return Intl.message(
      'Start shopping',
      name: 'start_shopping_text',
      desc: '',
      args: [],
    );
  }

  /// `No Product Go find products and add to cart.`
  String get no_product_text {
    return Intl.message(
      'No Product Go find products and add to cart.',
      name: 'no_product_text',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout_text {
    return Intl.message(
      'Logout',
      name: 'logout_text',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out ?!`
  String get logout_title {
    return Intl.message(
      'Are you sure you want to log out ?!',
      name: 'logout_title',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm_text {
    return Intl.message(
      'Confirm',
      name: 'confirm_text',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel_text {
    return Intl.message(
      'Cancel',
      name: 'cancel_text',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to Cancel your order ?!`
  String get cancel_title {
    return Intl.message(
      'Are you sure you want to Cancel your order ?!',
      name: 'cancel_title',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Order`
  String get cancel_order_text {
    return Intl.message(
      'Cancel Order',
      name: 'cancel_order_text',
      desc: '',
      args: [],
    );
  }

  /// `Finish Order`
  String get finish_order_text {
    return Intl.message(
      'Finish Order',
      name: 'finish_order_text',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to Finish your order ?!`
  String get finish_title {
    return Intl.message(
      'Are you sure you want to Finish your order ?!',
      name: 'finish_title',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back_text {
    return Intl.message(
      'Back',
      name: 'back_text',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to back to your order ?!`
  String get back_title {
    return Intl.message(
      'Are you sure you want to back to your order ?!',
      name: 'back_title',
      desc: '',
      args: [],
    );
  }

  /// `No user found for that email.`
  String get user_not_found_text {
    return Intl.message(
      'No user found for that email.',
      name: 'user_not_found_text',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password provided for that user.`
  String get wrong_password_text {
    return Intl.message(
      'Wrong password provided for that user.',
      name: 'wrong_password_text',
      desc: '',
      args: [],
    );
  }

  /// `User account has been disabled.`
  String get user_disabled_text {
    return Intl.message(
      'User account has been disabled.',
      name: 'user_disabled_text',
      desc: '',
      args: [],
    );
  }

  /// `Email or password is incorrect. Please try again.`
  String get failure_text {
    return Intl.message(
      'Email or password is incorrect. Please try again.',
      name: 'failure_text',
      desc: '',
      args: [],
    );
  }

  /// `Thank you!`
  String get thank_you_text {
    return Intl.message(
      'Thank you!',
      name: 'thank_you_text',
      desc: '',
      args: [],
    );
  }

  /// `Your transaction was successful`
  String get Your_transaction_was_successful_text {
    return Intl.message(
      'Your transaction was successful',
      name: 'Your_transaction_was_successful_text',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date_text {
    return Intl.message(
      'Date',
      name: 'date_text',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time_text {
    return Intl.message(
      'Time',
      name: 'time_text',
      desc: '',
      args: [],
    );
  }

  /// `To `
  String get to_text {
    return Intl.message(
      'To ',
      name: 'to_text',
      desc: '',
      args: [],
    );
  }

  /// `pcs`
  String get pcs_text {
    return Intl.message(
      'pcs',
      name: 'pcs_text',
      desc: '',
      args: [],
    );
  }

  /// `SAVE`
  String get save_text {
    return Intl.message(
      'SAVE',
      name: 'save_text',
      desc: '',
      args: [],
    );
  }

  /// `Order Saved Successfully`
  String get Order_Saved_Successfully_title {
    return Intl.message(
      'Order Saved Successfully',
      name: 'Order_Saved_Successfully_title',
      desc: '',
      args: [],
    );
  }

  /// `Order Not Saved !`
  String get Order_Not_Saved_title {
    return Intl.message(
      'Order Not Saved !',
      name: 'Order_Not_Saved_title',
      desc: '',
      args: [],
    );
  }

  /// ` Total`
  String get total {
    return Intl.message(
      ' Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `You cannot cancel payment now`
  String get cancel_payment {
    return Intl.message(
      'You cannot cancel payment now',
      name: 'cancel_payment',
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
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
