class ApiSettings {
  static const String _basedUrl="https://smart-store.mr-dev.tech/api/";
  static const String users='${_basedUrl}users';
  static const String login='${_basedUrl}auth/login';
  static const String activate='${_basedUrl}auth/activate';
  static const String changepassword='${_basedUrl}auth/change-password';
  static const String forgetpassword='${_basedUrl}auth/forget-password';
  static const String resetpassword='${_basedUrl}auth/reset-password';
  static const String register='${_basedUrl}auth/register';
  static const String updateprofile='${_basedUrl}auth/update-profile';
  static const String logout='${_basedUrl}auth/logout';
  static const String cities='${_basedUrl}cities';
  static const String home='${_basedUrl}home';
  static const String categories='${_basedUrl}categories';
  static const String products='${_basedUrl}sub-categories';
  static const String detailsproducts='${_basedUrl}products';
  static const String order='${_basedUrl}orders';
  static const String addresses='${_basedUrl}addresses';
  static const String contact='${_basedUrl}contact-requests';
  static const String favoriteproducts='${_basedUrl}favorite-products';
  static const String rateproduct='${_basedUrl}products/rate';
  static const String paymentcards='${_basedUrl}payment-cards';
}