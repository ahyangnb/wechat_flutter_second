import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wechat_flutter/provider/global_model.dart';
import 'package:wechat_flutter/tools/wechat_flutter.dart';

/// 注册
void register(
  BuildContext context, {
  @required String phone,
  @required String password,
  @required String code,
  @required String token,
}) async {
  Map<String, dynamic> params = {
    "phone": phone,
    "password": password,
    "code": code,
    "token": token,
    "privacy": true,
  };

  Req.getInstance().post(
    API2.register,
    (v) async {},
    params: params,
    errorCallBack: (String msg, int code) {
      showToast(context, "出现错误:$code");
    },
  );
}

/// 获取验证码
void smsGet(
  BuildContext context, {
  @required String phone,
}) async {
  Map<String, dynamic> params = {};

  Req.getInstance().get(
    API2.smsGet + phone,
    (v) async {},
    params: params,
    errorCallBack: (String msg, int code) {
      showToast(context, "出现错误:$code");
    },
  );
}

/// 获取自己的信息
void userMe(BuildContext context) async {
  Map<String, dynamic> params = {};

  Req.getInstance().get(
    API2.userMe,
    (v) async {},
    params: params,
    errorCallBack: (String msg, int code) {
      showToast(context, "出现错误:$code");
    },
  );
}

/// 登录
void login(BuildContext context) async {
  Map<String, dynamic> params = {};

  Req.getInstance().post(
    API2.login,
    (v) async {},
    params: params,
    errorCallBack: (String msg, int code) {
      showToast(context, "出现错误:$code");
    },
  );
}

/// 获取腾讯云签名
void timGetSig(BuildContext context) async {
  Map<String, dynamic> params = {};

  Req.getInstance().get(
    API2.timGetSig,
    (v) async {},
    params: params,
    errorCallBack: (String msg, int code) {
      showToast(context, "出现错误:$code");
    },
  );
}

/// 搜索用户
void searchUser(BuildContext context, String mobile) async {
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
      showToast(context, "出现错误:$code");
    },
  );
}

/// 更新用户资料
void updateUserInfo(BuildContext context, String id) async {
  Map<String, dynamic> params = {};

  Req.getInstance().patch(
    API2.updateUserInfo + id,
    (v) async {},
    params: params,
    errorCallBack: (String msg, int code) {
      showToast(context, "出现错误:$code");
    },
  );
}

/// 上传图片
void uploadFile(BuildContext context, String title, File file) async {
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
      showToast(context, "出现错误:$code");
    },
  );
}

/// 更新图片
void fileChange(
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
      showToast(context, "出现错误:$code");
    },
  );
}
