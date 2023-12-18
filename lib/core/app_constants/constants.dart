import 'package:more_2_drive/core/network/local/cache_helper.dart';


String token = CacheHelper.getData(key: 'access_token') ?? '';

String lang = CacheHelper.getData(key: 'lang') ?? '';

String userId = CacheHelper.getData(key: 'user_id') ?? '';