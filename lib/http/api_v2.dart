import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wechat_flutter/entity/api_entity.dart';
import 'package:wechat_flutter/tools/wechat_flutter.dart';

class ApiV2 {
  /// 注册
  static Future<bool> register(
    BuildContext context, {
    @required String phone,
    @required String password,
    @required String code,
    @required String token,
  }) async {
    if (!strNoEmpty(token)) {
      showToast(context, '请先获取验证码');
      return false;
    }
    if (!strNoEmpty(phone)) {
      showToast(context, "请输入手机号");
      return false;
    }
    if (!strNoEmpty(password)) {
      showToast(context, "请输入密码");
      return false;
    }
    if (!strNoEmpty(code)) {
      showToast(context, "请输入验证码");
      return false;
    }

    Map<String, dynamic> params = {
      "phone": phone,
      "password": password,
      "code": code,
      "token": token,
      "privacy": true,
    };

    Completer<bool> completer = Completer<bool>();

    Req.getInstance().post(
      API2.register,
      (v) async {
        completer.complete(true);
      },
      params: params,
      errorCallBack: (String msg, int code) {
        showToast(context, msg);
        completer.complete(false);
      },
    );
    return completer.future;
  }

  /// 获取验证码
  static Future<CodeRspEntity> smsGet(
    BuildContext context, {
    @required String phone,
  }) async {
    if (!strNoEmpty(phone)) {
      showToast(context, '请输入手机号');
      return null;
    }

    Completer<CodeRspEntity> completer = Completer<CodeRspEntity>();

    Map<String, dynamic> params = {"phone": phone};

    Req.getInstance().get(
      API2.smsGet,
      (v) async {
        CodeRspEntity codeRspEntity = CodeRspEntity.fromJson(v);
        completer.complete(codeRspEntity);
      },
      params: params,
      errorCallBack: (String msg, int code) {
        showToast(context, msg);
        completer.complete(null);
      },
    );
    return completer.future;
  }

  /// 获取自己的信息
  static Future<UserInfoRspEntity> userMe(BuildContext context) async {
    Map<String, dynamic> params = {};

    Completer<UserInfoRspEntity> completer = Completer<UserInfoRspEntity>();
    Req.getInstance().get(
      API2.userMe,
      (v) async {
        UserInfoRspEntity userInfoRspEntity =
            UserInfoRspEntity.fromJson(v['data']);
        completer.complete(userInfoRspEntity);
      },
      params: params,
      errorCallBack: (String msg, int code) {
        showToast(context, msg);
        completer.complete(null);
      },
    );
    return completer.future;
  }

  /// 登录
  static Future<LoginRspEntity> login(
      BuildContext context, String phone, String password) async {
    if (!strNoEmpty(phone)) {
      showToast(context, '请输入手机号');
      return null;
    }
    if (!strNoEmpty(password)) {
      showToast(context, '请输入密码');
      return null;
    }

    Map<String, dynamic> params = {
      "email": '$phone@$phone.com',
      "password": password,
    };

    Completer<LoginRspEntity> completer = Completer<LoginRspEntity>();
    Req.getInstance().post(
      API2.login,
      (v) async {
        LoginRspEntity rspEntity = LoginRspEntity.fromJson(v['data']);
        completer.complete(rspEntity);
      },
      params: params,
      errorCallBack: (String msg, int code) {
        showToast(context, msg);
      },
    );
    return completer.future;
  }

  /// 获取腾讯云签名
  static Future<String> timGetSig(BuildContext context) async {
    Map<String, dynamic> params = {};

    Completer<String> completer = Completer<String>();
    Req.getInstance().get(
      API2.timGetSig,
      (v) async {
        completer.complete(v["sig"]);
      },
      params: params,
      errorCallBack: (String msg, int code) {
        showToast(context, msg);
        completer.complete(null);
      },
    );
    return completer.future;
  }

  /// 搜索用户
  static void searchUser(BuildContext context, String mobile) async {
    Map<String, dynamic> params = {
      /// 需要服务端返回的字段，不传则返回所有的字段。
      "fields": ["kid", "mobile", "id"],
      "filter": {
        "_or": [
          {
            "mobile": {"_eq": mobile}
          },
          {
            "kid": {"_eq": "1234"}
          }
        ]
      },
    };

    Req.getInstance().get(
      API2.searchUser,
      (v) async {},
      params: params,
      errorCallBack: (String msg, int code) {
        showToast(context, msg);
      },
    );
  }

  /// 更新用户资料
  static void updateUserInfo(BuildContext context, String id) async {
    Map<String, dynamic> params = {};

    Req.getInstance().patch(
      API2.updateUserInfo + id,
      (v) async {},
      params: params,
      errorCallBack: (String msg, int code) {
        showToast(context, msg);
      },
    );
  }

  /// 上传图片
  static void uploadFile(BuildContext context, String title, File file) async {
    FormData params = FormData.fromMap({
      "title": title,
      "file": MultipartFile.fromFile(file.path),
    });

    Req.getInstance().postUpload(
      API2.uploadFile,
      (v) async {},
      (int count, int total) {},
      formData: params,
      errorCallBack: (String msg, int code) {
        showToast(context, msg);
      },
    );
  }

  /// 更新图片
  static void fileChange(
      BuildContext context, String avatarId, String title, File file) async {
    FormData params = FormData.fromMap({
      "title": title,
      "file": MultipartFile.fromFile(file.path),
    });

    Req.getInstance().patchUpload(
      API2.fileChange + avatarId,
      (v) async {},
      (int count, int total) {},
      formData: params,
      errorCallBack: (String msg, int code) {
        showToast(context, msg);
      },
    );
  }
}
