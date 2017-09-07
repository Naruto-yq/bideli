//
//  PathMacros.h
//  app
//
//  Created by 余钦 on 16/4/22.
//
//

#ifndef PathMacros_h
#define PathMacros_h

#define isFirstLaunchAppKey @"isFirstLaunchApp"
//1-非第一次启动 0－第一次启动
#define isFirstLaunchAppState [[NSUserDefaults standardUserDefaults]boolForKey:isFirstLaunchAppKey]

#define aPathTemp                   NSTemporaryDirectory()

#define aPathDocument               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define aPathUserInfo                [aPathDocument stringByAppendingPathComponent:@"user.dat"]

#define aPathFMDBFile               [aPathDocument stringByAppendingPathComponent:@"fmdb.sqlite"]

#define aPathLatestPhoneNo                [aPathDocument stringByAppendingPathComponent:@"latestPhone.dat"]

#define aPathLatestTraceId               [aPathDocument stringByAppendingPathComponent:@"TraceId.dat"]

#define aPathTouchIdData               [aPathDocument stringByAppendingPathComponent:@"touchid.dat"]

#define aPathAdInfoData               [aPathDocument stringByAppendingPathComponent:@"adinfo.dat"]

#define aPathCache                  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define isExistsFile(aPath) [[NSFileManager defaultManager] fileExistsAtPath:aPath]

#define SaveLatestPhone(phoneNo)     [[phoneNo dataUsingEncoding:NSUTF8StringEncoding] writeToFile:aPathLatestPhoneNo atomically:YES];
#define GetLatestPhone()             [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:aPathLatestPhoneNo] encoding:NSUTF8StringEncoding]

#define SaveTouchIDData(touchIDData)     [touchIDData writeToFile:aPathTouchIdData atomically:YES];
#define GetTouchIDData()                 [NSData dataWithContentsOfFile:aPathTouchIdData]

#define SaveTraceId(traceId)     [[traceId dataUsingEncoding:NSUTF8StringEncoding] writeToFile:aPathLatestTraceId atomically:YES];
#define GetTraceId()             [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:aPathLatestTraceId] encoding:NSUTF8StringEncoding]

#define SaveAdInfoData(data)     [data writeToFile:aPathAdInfoData atomically:YES];
#define GetAdInfoData()          [NSData dataWithContentsOfFile:aPathAdInfoData]

#define ArchiveUserInfo(userInfo)     [NSKeyedArchiver archiveRootObject:userInfo toFile:aPathUserInfo]
#define UnarchiveUserInfo()           [NSKeyedUnarchiver unarchiveObjectWithFile:aPathUserInfo]

#define aPathLoginInfo                [aPathDocument stringByAppendingPathComponent:@"loginInfo.dat"]
#define ArchiveLoginInfo(loginInfo)     [NSKeyedArchiver archiveRootObject:loginInfo toFile:aPathLoginInfo]
#define UnarchiveLoginInfo()           [NSKeyedUnarchiver unarchiveObjectWithFile:aPathLoginInfo]
#endif /* PathMacros_h */
