//
//  DetailViewDSFromFile.m
//  PhotoScroller
//
//  Created by 王李 on 11-11-02.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewDSFromFile.h"

#define DETAIL_VIEW_DS_FROM_RES_OR_FILE 0 // 0 = data from resource, 1 = data from files in sandbox.

@implementation DetailViewDSFromFile

+ (NSString *)dataRootDirWithId:(NSString *)theId {
	NSString * rootDir = nil;

#if DETAIL_VIEW_DS_FROM_RES_OR_FILE
	NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	rootDir = [NSString stringWithFormat:@"%@/%@_detail", [paths objectAtIndex:0], theId];
#else
	rootDir = [NSString stringWithFormat:@"%@/content/%@_detail", [[NSBundle mainBundle] resourcePath], theId];
#endif
	
	return rootDir;
}

+ (BOOL)hasDataWithId:(NSString *)theId {
	NSString * rootDir = [DetailViewDSFromFile dataRootDirWithId:theId];
	return [[NSFileManager defaultManager] fileExistsAtPath:rootDir];
}

- (id)initWithId:(NSString *)theId {
	if (self = [super init]) {
		_rootDir = [[DetailViewDSFromFile dataRootDirWithId:theId] retain];

        NSString *path = [NSString stringWithFormat:@"%@/config.plist", _rootDir];
        NSData *plistData = [NSData dataWithContentsOfFile:path];
        NSString *error; NSPropertyListFormat format;
        _data = [[NSPropertyListSerialization propertyListFromData:plistData
												  mutabilityOption:NSPropertyListImmutable
															format:&format
												  errorDescription:&error]
				 retain];
        if (!_data) {
            NSLog(@"Failed to read plist. Error: %@", error);
            [error release];
        }

		if ([_data count] > 0) {
			_root = [[_data allValues] objectAtIndex:0];
			_subItems = [_root objectForKey:@"SubList"];
			_infoItems = [_root objectForKey:@"InfoPages"];
		}
	}
	
	return self;
}

- (void)dealloc {
	[_rootDir release];
	[_data release];
	[super dealloc];
}

- (NSString *)title {
	NSString * value = nil;
	value = [_root objectForKey:@"Title"];
	return value;
}

- (NSString *)guideMapTitle {
	NSString * value = nil;
	value = [_root objectForKey:@"GuideMapTitle"];
	return value;
}

- (UIImage *)guideImage {
    NSString * path = nil;
	path = [NSString stringWithFormat:@"%@/guide/guide.jpg", _rootDir];
	UIImage * image = [UIImage imageWithContentsOfFile:path];
    return image;
}

- (NSString *)subListTitle {
	return [_root objectForKey:@"SubListTitle"];
}

- (NSUInteger)subCount {
    return [_subItems count];
}

- (NSString *)subTitleAtIndex:(NSUInteger)index {
    NSString *value = nil;
    if (index < [self subCount]) {
        NSDictionary *data = [_subItems objectAtIndex:index];
        value = [data valueForKey:@"Title"];
    }
    return value;
}

- (NSString *)subHtmlPathAtIndex:(NSUInteger)index {
    NSString * path = nil;
	path = [NSString stringWithFormat:@"%@/subList/%d.html", _rootDir, index + 1];
    return path;
}

- (NSUInteger)infoCount {
    return [_infoItems count];
}

- (NSString *)infoTitleAtIndex:(NSUInteger)index {
    NSString *value = nil;
    if (index < [self infoCount]) {
        NSDictionary *data = [_infoItems objectAtIndex:index];
        value = [data valueForKey:@"Title"];
    }
    return value;
}

- (NSString *)infoHtmlPathAtIndex:(NSUInteger)index {
    NSString * path = nil;
    if (index < [self infoCount]) {
        NSDictionary *data = [_infoItems objectAtIndex:index];
        NSString * fileName = [data valueForKey:@"Content"];
		path = [NSString stringWithFormat:@"%@/info/%@", _rootDir, fileName];
    }
    return path;
}

@end
