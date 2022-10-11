class API {
  static const nameUrl = 'https://www.apiopen.top/femaleNameApi';
  static const avatarUrl = 'http://www.lorempixel.com/200/200/';
  static const cat = 'https://api.thecatapi.com/v1/images/search';
  static const upImg = "http://111.230.251.115/oldchen/fUser/oneDaySuggestion";
  static const update = 'http://www.flutterj.com/api/update.json';
  static const uploadImg = 'http://www.flutterj.com/upload/avatar';
}

class API2 {
  /// 基础url
  static const baseUrl = "http://im.qicuo.com";

  /// 注册
  static const register = baseUrl + '/passport/register';

  /// 获取短信
  /// ?phone=18826987045
  static const smsGet = baseUrl + '/sms/get/';

  /// 获取自己的信息
  static const userMe = baseUrl + '/users/me';

  /// 登录
  static const login = baseUrl + '/auth/login';

  /// 获取腾讯云签名
  static const timGetSig = baseUrl + '/tim/get-sig';

  /// 搜索用户
  static const searchUser = baseUrl + '/users';

  /// 更新用户资料
  /// http://im.qicuo.com/users/5d7d0430-092a-4d7f-aad9-c494b3bdae62
  static const updateUserInfo = baseUrl + '/users/';

  /// 上传图片
  static const uploadFile = baseUrl + '/files';

  /// 更新图片
  /// http://im.qicuo.com/files/cf68b215-6662-49c3-bab6-c08d6017a915
  static const fileChange = baseUrl + '/files/';
}
