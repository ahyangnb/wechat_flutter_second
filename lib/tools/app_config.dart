import 'package:wechat_flutter/tools/wechat_flutter.dart';

class AppConfig {
  /// 应用名字
  static String appName = "微信";

  /// 模拟封面
  static String mockCover = defIcon;

  static String logoImg = "images/main/home_logo.webp";

  /// 【IM】是否允许添加自己为好友
  static bool isArrowAddSelf = false;

  /// 腾讯云IM AppId
  static int IMSdkAppID = 20001116;

  // 注册是否需要邀请码
  static bool needInviteCode = true;

  /// 未注册用户的状态代码
  static int noRegisterCode = 411;

  /// 微信登录授权登录码过期
  static int wxLoginCodeOverdue = 420;

  /// 倒计时秒
  static int countdownSecond = 60;

  /// 会话列表[conversation]一页获取数量
  static var cvsPageCount = 30;

  /// 微信团队用户id
  static String wxTeamUserId = "166";
}
