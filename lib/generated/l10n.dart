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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Online Shop`
  String get appTitle {
    return Intl.message(
      'Online Shop',
      name: 'appTitle',
      desc: 'The title of the application',
      args: [],
    );
  }

  /// `Hello!...`
  String get hello {
    return Intl.message('Hello!...', name: 'hello', desc: '', args: []);
  }

  /// `Sign In`
  String get signin {
    return Intl.message('Sign In', name: 'signin', desc: '', args: []);
  }

  /// `Sign Up`
  String get signup {
    return Intl.message('Sign Up', name: 'signup', desc: '', args: []);
  }

  /// `User Name`
  String get name {
    return Intl.message('User Name', name: 'name', desc: '', args: []);
  }

  /// `Enter Your User Name`
  String get enter_name {
    return Intl.message(
      'Enter Your User Name',
      name: 'enter_name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Enter Your Email`
  String get enter_email {
    return Intl.message(
      'Enter Your Email',
      name: 'enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `Enter Your Phone`
  String get enter_phone {
    return Intl.message(
      'Enter Your Phone',
      name: 'enter_phone',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Enter Your Address`
  String get enter_address {
    return Intl.message(
      'Enter Your Address',
      name: 'enter_address',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message('Country', name: 'country', desc: '', args: []);
  }

  /// `Select Your Country`
  String get select_country {
    return Intl.message(
      'Select Your Country',
      name: 'select_country',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Select Your City`
  String get select_city {
    return Intl.message(
      'Select Your City',
      name: 'select_city',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Your Country First`
  String get select_country_first {
    return Intl.message(
      'Please Select Your Country First',
      name: 'select_country_first',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Your Password`
  String get your_password {
    return Intl.message(
      'Your Password',
      name: 'your_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password`
  String get enter_your_password {
    return Intl.message(
      'Enter Your Password',
      name: 'enter_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get enter {
    return Intl.message('Enter', name: 'enter', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter Confirm Your Password`
  String get enter_confirm_your_password {
    return Intl.message(
      'Enter Confirm Your Password',
      name: 'enter_confirm_your_password',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'current' key

  /// `New `
  String get new_ {
    return Intl.message('New ', name: 'new_', desc: '', args: []);
  }

  /// `Confirm New `
  String get confirm_new {
    return Intl.message(
      'Confirm New ',
      name: 'confirm_new',
      desc: '',
      args: [],
    );
  }

  /// `By signing up, you agree to `
  String get terms_and_condition1 {
    return Intl.message(
      'By signing up, you agree to ',
      name: 'terms_and_condition1',
      desc: '',
      args: [],
    );
  }

  /// `our Terms of Service and Privacy Policy.`
  String get terms_and_condition2 {
    return Intl.message(
      'our Terms of Service and Privacy Policy.',
      name: 'terms_and_condition2',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get already_have_an_account {
    return Intl.message(
      'Already have an account?',
      name: 'already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forget_password {
    return Intl.message(
      'Forget Password?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account?`
  String get do_not_have_an_account {
    return Intl.message(
      'Don’t have an account?',
      name: 'do_not_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get sign_with_google {
    return Intl.message(
      'Sign in with Google',
      name: 'sign_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Facebook`
  String get sign_with_facebook {
    return Intl.message(
      'Sign in with Facebook',
      name: 'sign_with_facebook',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back!...`
  String get welcome_back {
    return Intl.message(
      'Welcome back!...',
      name: 'welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `   OR SIGN IN WITH   `
  String get or {
    return Intl.message(
      '   OR SIGN IN WITH   ',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Please accept terms and conditions`
  String get please_accept_terms_and_conditions {
    return Intl.message(
      'Please accept terms and conditions',
      name: 'please_accept_terms_and_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Password and confirm password not match`
  String get password_and_confirm_password_not_match {
    return Intl.message(
      'Password and confirm password not match',
      name: 'password_and_confirm_password_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message('Sign Up', name: 'sign_up', desc: '', args: []);
  }

  /// `Successfully created account`
  String get successfully_created_account {
    return Intl.message(
      'Successfully created account',
      name: 'successfully_created_account',
      desc: '',
      args: [],
    );
  }

  /// `Please Verify Your Email`
  String get please_verify_your_email {
    return Intl.message(
      'Please Verify Your Email',
      name: 'please_verify_your_email',
      desc: '',
      args: [],
    );
  }

  /// `or continue with`
  String get or_continue_with {
    return Intl.message(
      'or continue with',
      name: 'or_continue_with',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Login to continue`
  String get login_to_continue {
    return Intl.message(
      'Login to continue',
      name: 'login_to_continue',
      desc: '',
      args: [],
    );
  }

  /// `Create Account to continue`
  String get create_account_to_continue {
    return Intl.message(
      'Create Account to continue',
      name: 'create_account_to_continue',
      desc: '',
      args: [],
    );
  }

  /// `Create Account to continue and enjoy our services`
  String get create_account_to_continue_description {
    return Intl.message(
      'Create Account to continue and enjoy our services',
      name: 'create_account_to_continue_description',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Shopping Cart`
  String get shopping_cart {
    return Intl.message(
      'Shopping Cart',
      name: 'shopping_cart',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message('Orders', name: 'orders', desc: '', args: []);
  }

  /// `Orders`
  String get gg {
    return Intl.message('Orders', name: 'gg', desc: '', args: []);
  }

  /// `Change Theme`
  String get change_theme {
    return Intl.message(
      'Change Theme',
      name: 'change_theme',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get change_language {
    return Intl.message(
      'Change Language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Change Email`
  String get change_email {
    return Intl.message(
      'Change Email',
      name: 'change_email',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to change your email?`
  String get edit_email_message {
    return Intl.message(
      'Are you sure you want to change your email?',
      name: 'edit_email_message',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Become a Seller`
  String get become_seller {
    return Intl.message(
      'Become a Seller',
      name: 'become_seller',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message('Dark Mode', name: 'dark_mode', desc: '', args: []);
  }

  /// `Light Mode`
  String get light_mode {
    return Intl.message('Light Mode', name: 'light_mode', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `See All`
  String get see_all {
    return Intl.message('See All', name: 'see_all', desc: '', args: []);
  }

  /// `Best Selling`
  String get best_selling {
    return Intl.message(
      'Best Selling',
      name: 'best_selling',
      desc: '',
      args: [],
    );
  }

  /// `LE`
  String get le {
    return Intl.message('LE', name: 'le', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Search For Products`
  String get search_for_products {
    return Intl.message(
      'Search For Products',
      name: 'search_for_products',
      desc: '',
      args: [],
    );
  }

  /// `Shop Now`
  String get shop_now {
    return Intl.message('Shop Now', name: 'shop_now', desc: '', args: []);
  }

  /// `Check Your Email`
  String get check_your_email {
    return Intl.message(
      'Check Your Email',
      name: 'check_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Email Addresss To Recieve A Verification Code`
  String get please_enter_your_email {
    return Intl.message(
      'Please Enter Your Email Addresss To Recieve A Verification Code',
      name: 'please_enter_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code`
  String get verification_code {
    return Intl.message(
      'Verification Code',
      name: 'verification_code',
      desc: '',
      args: [],
    );
  }

  /// `Check Code`
  String get check_code {
    return Intl.message('Check Code', name: 'check_code', desc: '', args: []);
  }

  /// `Please Enter Your Digit Code Sent To  `
  String get please_enter_your_verification_code {
    return Intl.message(
      'Please Enter Your Digit Code Sent To  ',
      name: 'please_enter_your_verification_code',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code`
  String get verify_code {
    return Intl.message('Verify Code', name: 'verify_code', desc: '', args: []);
  }

  /// `Didn’t Receive Code?`
  String get didnot_receive_code {
    return Intl.message(
      'Didn’t Receive Code?',
      name: 'didnot_receive_code',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resend_code {
    return Intl.message('Resend Code', name: 'resend_code', desc: '', args: []);
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Create New Password`
  String get create_new_password {
    return Intl.message(
      'Create New Password',
      name: 'create_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Your new password must be different from previous used passwords.`
  String get your_new_password {
    return Intl.message(
      'Your new password must be different from previous used passwords.',
      name: 'your_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations!`
  String get congratulations {
    return Intl.message(
      'Congratulations!',
      name: 'congratulations',
      desc: '',
      args: [],
    );
  }

  /// `Your Password Has Been Changed Successfully`
  String get your_password_has_been_changed {
    return Intl.message(
      'Your Password Has Been Changed Successfully',
      name: 'your_password_has_been_changed',
      desc: '',
      args: [],
    );
  }

  /// `Go To Sign In`
  String get go_to_login {
    return Intl.message(
      'Go To Sign In',
      name: 'go_to_login',
      desc: '',
      args: [],
    );
  }

  /// `Not Valid Email`
  String get not_valid_email {
    return Intl.message(
      'Not Valid Email',
      name: 'not_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Not Valid Phone`
  String get not_valid_phone {
    return Intl.message(
      'Not Valid Phone',
      name: 'not_valid_phone',
      desc: '',
      args: [],
    );
  }

  /// `Not Valid Name`
  String get not_valid_name {
    return Intl.message(
      'Not Valid Name',
      name: 'not_valid_name',
      desc: '',
      args: [],
    );
  }

  /// `Cant Be Empty`
  String get cant_be_empty {
    return Intl.message(
      'Cant Be Empty',
      name: 'cant_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Not Valid Price`
  String get not_valid_price {
    return Intl.message(
      'Not Valid Price',
      name: 'not_valid_price',
      desc: '',
      args: [],
    );
  }

  /// `Not Valid Address`
  String get not_valid_address {
    return Intl.message(
      'Not Valid Address',
      name: 'not_valid_address',
      desc: '',
      args: [],
    );
  }

  /// `Cant Be Large Than`
  String get cant_be_large_than {
    return Intl.message(
      'Cant Be Large Than',
      name: 'cant_be_large_than',
      desc: '',
      args: [],
    );
  }

  /// `Cant Be Less Than`
  String get cant_be_less_than {
    return Intl.message(
      'Cant Be Less Than',
      name: 'cant_be_less_than',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message('Dashboard', name: 'dashboard', desc: '', args: []);
  }

  /// `Add Categery`
  String get add_category {
    return Intl.message(
      'Add Categery',
      name: 'add_category',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get category {
    return Intl.message('Categories', name: 'category', desc: '', args: []);
  }

  /// `Add Product`
  String get add_product {
    return Intl.message('Add Product', name: 'add_product', desc: '', args: []);
  }

  /// `Product Name Arabic`
  String get product_name_ar {
    return Intl.message(
      'Product Name Arabic',
      name: 'product_name_ar',
      desc: '',
      args: [],
    );
  }

  /// `Enter Product Name Arabic`
  String get enter_product_name_ar {
    return Intl.message(
      'Enter Product Name Arabic',
      name: 'enter_product_name_ar',
      desc: '',
      args: [],
    );
  }

  /// `Product Name English`
  String get product_name_en {
    return Intl.message(
      'Product Name English',
      name: 'product_name_en',
      desc: '',
      args: [],
    );
  }

  /// `Enter Product Name English`
  String get enter_product_name_en {
    return Intl.message(
      'Enter Product Name English',
      name: 'enter_product_name_en',
      desc: '',
      args: [],
    );
  }

  /// `Product Description Arabic`
  String get product_description_ar {
    return Intl.message(
      'Product Description Arabic',
      name: 'product_description_ar',
      desc: '',
      args: [],
    );
  }

  /// `Enter Product Description Arabic`
  String get enter_product_description_ar {
    return Intl.message(
      'Enter Product Description Arabic',
      name: 'enter_product_description_ar',
      desc: '',
      args: [],
    );
  }

  /// `Product Description English`
  String get product_description_en {
    return Intl.message(
      'Product Description English',
      name: 'product_description_en',
      desc: '',
      args: [],
    );
  }

  /// `Enter Product Description English`
  String get enter_product_description_en {
    return Intl.message(
      'Enter Product Description English',
      name: 'enter_product_description_en',
      desc: '',
      args: [],
    );
  }

  /// `Product Price`
  String get product_price {
    return Intl.message(
      'Product Price',
      name: 'product_price',
      desc: '',
      args: [],
    );
  }

  /// `Enter Product Price`
  String get enter_product_price {
    return Intl.message(
      'Enter Product Price',
      name: 'enter_product_price',
      desc: '',
      args: [],
    );
  }

  /// `Product Code`
  String get product_code {
    return Intl.message(
      'Product Code',
      name: 'product_code',
      desc: '',
      args: [],
    );
  }

  /// `Enter Product Code`
  String get enter_product_code {
    return Intl.message(
      'Enter Product Code',
      name: 'enter_product_code',
      desc: '',
      args: [],
    );
  }

  /// `Product Category Arabic`
  String get product_category_ar {
    return Intl.message(
      'Product Category Arabic',
      name: 'product_category_ar',
      desc: '',
      args: [],
    );
  }

  /// `Enter Product Category Arabic`
  String get enter_product_category_ar {
    return Intl.message(
      'Enter Product Category Arabic',
      name: 'enter_product_category_ar',
      desc: '',
      args: [],
    );
  }

  /// `Product Category English`
  String get product_category_en {
    return Intl.message(
      'Product Category English',
      name: 'product_category_en',
      desc: '',
      args: [],
    );
  }

  /// `Enter Product Category English`
  String get enter_product_category_en {
    return Intl.message(
      'Enter Product Category English',
      name: 'enter_product_category_en',
      desc: '',
      args: [],
    );
  }

  /// `Product Image`
  String get product_image {
    return Intl.message(
      'Product Image',
      name: 'product_image',
      desc: '',
      args: [],
    );
  }

  /// `Is Featured Item`
  String get is_featured_item {
    return Intl.message(
      'Is Featured Item',
      name: 'is_featured_item',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Delete Category`
  String get delete_category {
    return Intl.message(
      'Delete Category',
      name: 'delete_category',
      desc: '',
      args: [],
    );
  }

  /// `Delete Product`
  String get delete_product {
    return Intl.message(
      'Delete Product',
      name: 'delete_product',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Edit Category`
  String get edit_category {
    return Intl.message(
      'Edit Category',
      name: 'edit_category',
      desc: '',
      args: [],
    );
  }

  /// `Edit Product`
  String get edit_product {
    return Intl.message(
      'Edit Product',
      name: 'edit_product',
      desc: '',
      args: [],
    );
  }

  /// `No Products Found`
  String get no_products_found {
    return Intl.message(
      'No Products Found',
      name: 'no_products_found',
      desc: '',
      args: [],
    );
  }

  /// `No Categories Found`
  String get no_categories_found {
    return Intl.message(
      'No Categories Found',
      name: 'no_categories_found',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Please Select An Image`
  String get please_select_image {
    return Intl.message(
      'Please Select An Image',
      name: 'please_select_image',
      desc: '',
      args: [],
    );
  }

  /// `Are You Sure You Want To Delete This Product?`
  String get confirm_delete_message_product {
    return Intl.message(
      'Are You Sure You Want To Delete This Product?',
      name: 'confirm_delete_message_product',
      desc: '',
      args: [],
    );
  }

  /// `Are You Sure You Want To Delete This Category?`
  String get confirm_delete_message_category {
    return Intl.message(
      'Are You Sure You Want To Delete This Category?',
      name: 'confirm_delete_message_category',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Delete`
  String get confirm_delete_title {
    return Intl.message(
      'Confirm Delete',
      name: 'confirm_delete_title',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get no_data {
    return Intl.message('No Data', name: 'no_data', desc: '', args: []);
  }

  /// `This Category Already Exists`
  String get categoryExists {
    return Intl.message(
      'This Category Already Exists',
      name: 'categoryExists',
      desc: '',
      args: [],
    );
  }

  /// `Product Edited Successfully`
  String get product_edited_successfully {
    return Intl.message(
      'Product Edited Successfully',
      name: 'product_edited_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Product Added Successfully`
  String get product_added_successfully {
    return Intl.message(
      'Product Added Successfully',
      name: 'product_added_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Category Edited Successfully`
  String get category_edited_successfully {
    return Intl.message(
      'Category Edited Successfully',
      name: 'category_edited_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Category Added Successfully`
  String get category_added_successfully {
    return Intl.message(
      'Category Added Successfully',
      name: 'category_added_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Category Deleted Successfully`
  String get category_deleted_successfully {
    return Intl.message(
      'Category Deleted Successfully',
      name: 'category_deleted_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Product Deleted Successfully`
  String get product_deleted_successfully {
    return Intl.message(
      'Product Deleted Successfully',
      name: 'product_deleted_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Active Categories`
  String get active_categories {
    return Intl.message(
      'Active Categories',
      name: 'active_categories',
      desc: '',
      args: [],
    );
  }

  /// `Inactive Categories`
  String get inactive_categories {
    return Intl.message(
      'Inactive Categories',
      name: 'inactive_categories',
      desc: '',
      args: [],
    );
  }

  /// `Search categories...`
  String get search_categories {
    return Intl.message(
      'Search categories...',
      name: 'search_categories',
      desc: '',
      args: [],
    );
  }

  /// `All Categories`
  String get all_categories {
    return Intl.message(
      'All Categories',
      name: 'all_categories',
      desc: '',
      args: [],
    );
  }

  /// `No search results`
  String get empty_search_results {
    return Intl.message(
      'No search results',
      name: 'empty_search_results',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Refresh`
  String get refresh {
    return Intl.message('Refresh', name: 'refresh', desc: '', args: []);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Ok`
  String get ok {
    return Intl.message('Ok', name: 'ok', desc: '', args: []);
  }

  /// `Pull down to refresh`
  String get pull_to_refresh {
    return Intl.message(
      'Pull down to refresh',
      name: 'pull_to_refresh',
      desc: '',
      args: [],
    );
  }

  /// `All Products`
  String get all_products {
    return Intl.message(
      'All Products',
      name: 'all_products',
      desc: '',
      args: [],
    );
  }

  /// `Active Products`
  String get active_products {
    return Intl.message(
      'Active Products',
      name: 'active_products',
      desc: '',
      args: [],
    );
  }

  /// `Inactive Products`
  String get inactive_products {
    return Intl.message(
      'Inactive Products',
      name: 'inactive_products',
      desc: '',
      args: [],
    );
  }

  /// `Profile updated successfully`
  String get profile_updated_successfully {
    return Intl.message(
      'Profile updated successfully',
      name: 'profile_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Image updated successfully`
  String get image_updated_successfully {
    return Intl.message(
      'Image updated successfully',
      name: 'image_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid username`
  String get invalid_username {
    return Intl.message(
      'Please enter a valid username',
      name: 'invalid_username',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get invalid_email {
    return Intl.message(
      'Please enter a valid email address',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get invalid_phone {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'invalid_phone',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Save`
  String get confirm_save {
    return Intl.message(
      'Confirm Save',
      name: 'confirm_save',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to save these changes?`
  String get save_changes_message {
    return Intl.message(
      'Are you sure you want to save these changes?',
      name: 'save_changes_message',
      desc: '',
      args: [],
    );
  }

  /// `Inactive`
  String get inactive {
    return Intl.message('Inactive', name: 'inactive', desc: '', args: []);
  }

  /// `Active`
  String get active {
    return Intl.message('Active', name: 'active', desc: '', args: []);
  }

  /// `Products`
  String get product {
    return Intl.message('Products', name: 'product', desc: '', args: []);
  }

  /// `Profile edited successfully`
  String get profile_edited_successfully {
    return Intl.message(
      'Profile edited successfully',
      name: 'profile_edited_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get current_password {
    return Intl.message(
      'Current Password',
      name: 'current_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter Current Password`
  String get enter_current_password {
    return Intl.message(
      'Enter Current Password',
      name: 'enter_current_password',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter New Password`
  String get enter_new_password {
    return Intl.message(
      'Enter New Password',
      name: 'enter_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirm_new_password {
    return Intl.message(
      'Confirm New Password',
      name: 'confirm_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter Confirm New Password`
  String get enter_confirm_new_password {
    return Intl.message(
      'Enter Confirm New Password',
      name: 'enter_confirm_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Password updated failed`
  String get password_updated_failed {
    return Intl.message(
      'Password updated failed',
      name: 'password_updated_failed',
      desc: '',
      args: [],
    );
  }

  /// `Invalid current password`
  String get invalid_current_password {
    return Intl.message(
      'Invalid current password',
      name: 'invalid_current_password',
      desc: '',
      args: [],
    );
  }

  /// `New password and confirm password does not match`
  String get new_password_and_confirm_password_does_not_match {
    return Intl.message(
      'New password and confirm password does not match',
      name: 'new_password_and_confirm_password_does_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Password updated successfully`
  String get password_updated_successfully {
    return Intl.message(
      'Password updated successfully',
      name: 'password_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get logout_message {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'logout_message',
      desc: '',
      args: [],
    );
  }

  /// `Name Vendor in English`
  String get name_vendor_en {
    return Intl.message(
      'Name Vendor in English',
      name: 'name_vendor_en',
      desc: '',
      args: [],
    );
  }

  /// `Name Vendor in Arabic`
  String get name_vendor_ar {
    return Intl.message(
      'Name Vendor in Arabic',
      name: 'name_vendor_ar',
      desc: '',
      args: [],
    );
  }

  /// `Enter the name of the vendor in English`
  String get enter_name_vendor_en {
    return Intl.message(
      'Enter the name of the vendor in English',
      name: 'enter_name_vendor_en',
      desc: '',
      args: [],
    );
  }

  /// `Enter the name of the vendor in Arabic`
  String get enter_name_vendor_ar {
    return Intl.message(
      'Enter the name of the vendor in Arabic',
      name: 'enter_name_vendor_ar',
      desc: '',
      args: [],
    );
  }

  /// `Phone Vendor`
  String get phone_vendor {
    return Intl.message(
      'Phone Vendor',
      name: 'phone_vendor',
      desc: '',
      args: [],
    );
  }

  /// `Vendor Address`
  String get vendor_address {
    return Intl.message(
      'Vendor Address',
      name: 'vendor_address',
      desc: '',
      args: [],
    );
  }

  /// `Enter the address of the vendor`
  String get enter_vendor_address {
    return Intl.message(
      'Enter the address of the vendor',
      name: 'enter_vendor_address',
      desc: '',
      args: [],
    );
  }

  /// `Enter the phone number of the vendor`
  String get enter_phone_vendor {
    return Intl.message(
      'Enter the phone number of the vendor',
      name: 'enter_phone_vendor',
      desc: '',
      args: [],
    );
  }

  /// `To become a seller, you need to fill out the form below. We will review your request and get back to you as soon as possible.`
  String get vendor_message {
    return Intl.message(
      'To become a seller, you need to fill out the form below. We will review your request and get back to you as soon as possible.',
      name: 'vendor_message',
      desc: '',
      args: [],
    );
  }

  /// `Please fill out the form below to become a seller. We will review your request and get back to you as soon as possible.`
  String get vendor_message2 {
    return Intl.message(
      'Please fill out the form below to become a seller. We will review your request and get back to you as soon as possible.',
      name: 'vendor_message2',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message('Full Name', name: 'full_name', desc: '', args: []);
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Business Description`
  String get business_description {
    return Intl.message(
      'Business Description',
      name: 'business_description',
      desc: '',
      args: [],
    );
  }

  /// `Submit Request`
  String get submit_request {
    return Intl.message(
      'Submit Request',
      name: 'submit_request',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your full name`
  String get please_enter_full_name {
    return Intl.message(
      'Please enter your full name',
      name: 'please_enter_full_name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get please_enter_email {
    return Intl.message(
      'Please enter your email',
      name: 'please_enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get please_enter_phone {
    return Intl.message(
      'Please enter your phone number',
      name: 'please_enter_phone',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your business description`
  String get please_enter_business_description {
    return Intl.message(
      'Please enter your business description',
      name: 'please_enter_business_description',
      desc: '',
      args: [],
    );
  }

  /// `You have already submitted a request`
  String get already_submitted_request {
    return Intl.message(
      'You have already submitted a request',
      name: 'already_submitted_request',
      desc: '',
      args: [],
    );
  }

  /// `Your request has been submitted successfully. It will be reviewed soon`
  String get request_submitted_successfully {
    return Intl.message(
      'Your request has been submitted successfully. It will be reviewed soon',
      name: 'request_submitted_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Error submitting request`
  String get error_submitting_request {
    return Intl.message(
      'Error submitting request',
      name: 'error_submitting_request',
      desc: '',
      args: [],
    );
  }

  /// `You have already submitted a request. Please wait for review`
  String get request_under_review {
    return Intl.message(
      'You have already submitted a request. Please wait for review',
      name: 'request_under_review',
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
