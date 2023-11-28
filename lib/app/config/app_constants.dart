class Constants {
  // static const String onboard = '/onboard';
  // static const String login = '/login';
  // static const String register = '/register';
  // static const String forgotPassword = '/forgotPassword';
  // static const String resetPassword = '/resetPassword';
  // static const String changePassword = '/changePassword';
  // static const String cityList = '/cityList';
  // static const String verification = '/verification';
  // static const String userTermsCondition = '/userTermsCondition';
  // static const String home = '/home';
  // static const String chatMessageScreen = '/chatMessageScreen';
  // static const String companyDetail = '/companyDetail';

  // static const String bottomNavBar = '/bottomNavBar';

  // static const String profileCreate = '/profileCreate';
  // static const String showProfile = '/showProfile';
  // static const String jobDetail = '/jobDetail';
  // static const String viewAllJobs = '/viewAllJobs';
  // static const String editUserProfile = '/editUserProfile';
  // static const String dotRequirements = '/dotRequirements';
  // static const String addDocument = '/addDocument';
  // static const String addExperience = '/addExperience';
  // static const String addCertification = '/addCertification';
  // static const String addEndorsement = '/addEndorsement';

  // static const String notifications = '/notifications';
  // static const String search = '/search';
  // static const String searchScreen = '/searchScreen';
  // static const String searchResults = '/searchResults';

  // static const String aboutApp = '/aboutApp';
  // static const String changePasswordSetting = '/changePasswordSetting';
  // static const String customerSupport = '/customerSupport';
  // static const String privacyPolicy = '/privacyPolicy';
  // static const String termsCondition = '/termsCondition';

  // static const String premiumDomains = '/premiumDomains';
  // static const String ecosystem = '/ecosystem';
  // static const String editProfile = '/editProfile';
  // static const String myDomains = '/myDomains';
  // static const String wallet = '/wallet';
  // static const String support = '/support';
  // static const String settings = '/settings';
  // static const String faq = '/faq';
  // static const String privacy = '/privacy';
  // static const String terms = '/terms';
  // static const String subscriptions = '/subscriptions';
  // static const String blog = '/blog';
  // static const String blogDetail = '/blogDetail';

  //String
  static const String fieldRequiredMsg = 'Field required';
  static const String fullnameEmptyMsg = 'Full name cannot be empty';
  static const String enterAlphabetsMsg = 'Enter alphabets';
  static const String usernameEmptyMsg = 'Username cannot be empty';
  static const String enterValidUsernameMsg = 'Enter valid username';
  static const String emailEmptyMsg = 'Email cannot be empty';
  static const String otpEmptyMsg = 'OTP cannot be empty';
  static const String invalidEmailAddressMsg = 'Invalid email address';
  static const String invalidOtpAddressMsg = 'Invalid OTP';
  static const String phoneNumberEmptyMsg = 'Phone number cannot be empty';
  static const String enterValidPhoneNoHintMsg = 'Please enter valid number';
  static const String enterValidPhoneNoMsg = 'Please enter a valid phone number';
  static const String enterValidPhoneNoPlus = 'Please enter valid number Ex:+18884628462';
  static const String passwordEmptyMsg = 'Password cannot be empty';
  static const String passwordGreaterThanMsg = 'Password must be greater than 6 characters';
  static const String enterValidPasswordHintMsg = 'Password should be Uppercase, Lowercase, Numeric\nand Special character ';
  static const String confirmPasswordEmptyMsg = 'Confirm password cannot be empty';
  static const String confirmPasswordGreaterThanMsg = 'Confirm password must be greater than 6 characters';
  static const String confirmPasswordNotMatch = 'Confirm password not match';
  static const String onboardDes1 = 'Lorem ipsum dolor sit amet consectetur. Libero viverra a eget non. Risus quis laoreet aenean augue. Condimentum sed et id quis.';
  static const String onboardDes2 = 'Lorem ipsum dolor sit amet consectetur. Libero viverra a eget non. Risus quis laoreet aenean augue. Condimentum sed et id quis.';
  static const String blogTitle = "Coinbase Reports Increased Earnings in First Quarter, While Making the Call for “Crypto Specific Rules”";
  static const String thankyouText = "Thank you for submitting your feedback";
  static const String passwordChangeText = "Your password has been updated successfully";

  //Storage keys
  static const String bearerToken = 'bearerToken';
  static const String fcmToken = 'fcmToken';
  static const String user = 'user';

  //RegExp
  static const String regExpFullName = r'^[a-z A-Z]+$';
  static const String regExpUserName = r'^[a-zA-Z0-9_\-=@,\.;]+$';
  static const String regExpEmail = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const String regExpPhoneNumber = r'(^(?:[+]9)?:[-]?[0-9]{10,12}$)';
  static const String regExpPassword = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~+^_%:£()/;?]).{6,}$';
  static const regexpRemoveSpecialChars = '[^A-Za-z0-9]';
}
