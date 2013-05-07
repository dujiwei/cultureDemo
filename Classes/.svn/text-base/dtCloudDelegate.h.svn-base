/*
 *  dtCloudDelegate.h
 *  cultureDemo
 *
 *  Created by dujw on 11-10-20.
 *  Copyright 2011 __MyCompanyName__. All rights reserved.
 *
 */
#define ISPAD() ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)?YES:NO)
@protocol DTCloudPassValueDelegate

- (void)DTCloudPassValue:(NSDictionary *)value;

@end

#define MAINIMAGE_TAG 1
#define MAINLABEL_TAG 2
#define SECONDLABEL_TAG 3
#define DETAIL_TAG 4
#define SLIDER_TAG 5
#define SECONDIMAGE_TAG 6
#define THIRDIMAGE_TAG 7
#define THIRDLABEL_TAG 8
#define FORTHLABEL_TAG 9
#define FIFTHLABEL_TAG 10

#define MENUNAME @"云   北   京";
#define kSubCodeKey @"subCode"
#define kMainTitleKey  @"subTitle"
#define kMainImageNameKey @"imageName"
#define kScoreKey  @"shareGrade"//评分
#define kThirdImageKey  @"isDownload"
//static NSString * kSubTitleKey = @"subTitle";//分类title，暂时无
#define kSubImageKey  @"isMyPack"
#define kGradeCountKey  @"gradeCount" //评分人数，目前demo暂时不传递
//---下面的用于传递到开始读取数据库时候使用，在substyle中使用
static NSString * SHOWIMAGENAME = @"slider_ball.png";
static NSString * kSubCodeKey_main = @"subcode";
static NSString * kSubTitleKey_main = @"subtitle";
static NSString * kSubDescriptionKey_main = @"description";

// only for 演出剧目
#define kDuration @"duration"
#define kDirector @"director"
#define kArtist @"artist"
#define kDescription @"description"
#define kTheatreId @"theatreId"
#define kTheatreName @"theatreName"

//static NSString * kDistanceKey = @"distance";///距离显示，暂时无
//上面的6个变量用于字典数据的传输key,注意：mainstyle,substyle就不需要传递了。
/*
[rowDict setObject:[NSString stringWithUTF8String:(char *) sqlite3_column_text(statement, 0)] forKey:@"subCode"];
[rowDict setObject:[NSString stringWithUTF8String:(char *) sqlite3_column_text(statement, 1)] forKey:@"subTitle"];
[rowDict setObject:[NSString stringWithUTF8String:(char *) sqlite3_column_text(statement, 2)] forKey:@"SubStyle"];
[rowDict setObject:[NSString stringWithUTF8String:(char *) sqlite3_column_text(statement, 3)] forKey:@"mainStyle"];
[rowDict setObject:[NSString stringWithUTF8String:(char *) sqlite3_column_text(statement, 4)] forKey:@"imageName"];
[rowDict setObject:[NSString stringWithUTF8String:(char *) sqlite3_column_text(statement, 5)] forKey:@"shareGrade"];
[rowDict setObject:[NSString stringWithUTF8String:(char *) sqlite3_column_text(statement, 6)] forKey:@"gradeCount"];
[rowDict setObject:[NSString stringWithUTF8String:(char *) sqlite3_column_text(statement, 7)] forKey:@"isMyPack"];
[rowDict setObject:[NSString stringWithUTF8String:(char *) sqlite3_column_text(statement, 8)] forKey:@"isDownload"];
*/