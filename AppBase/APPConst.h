//
//  APPConst.h
//  AppTemplate_iOS
//
//  Created by hexuan on 2017/5/7.
//  Copyright © 2017年 hexuan. All rights reserved.
//

#ifndef APPConst_h
#define APPConst_h

#define kAppDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]
#define kAppCachePath NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0]
#define kAppTmpPath NSTemporaryDirectory()

#define kAppStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

#endif /* APPConst_h */
