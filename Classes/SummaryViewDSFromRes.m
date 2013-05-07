//
//  SummaryViewDSFromRes.m
//  PhotoScroller
//
//  Created by 王李 on 11-10-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SummaryViewDSFromRes.h"


@implementation SummaryViewDSFromRes

- (id)initWithId:(NSString *)theId {
	if (self = [super init]) {
        // read the datas out of a plist in the app bundle
		_rootDir = [[NSString alloc] initWithFormat:@"%@/content/%@_summary", [[NSBundle mainBundle] resourcePath], theId];
		NSLog(@"%@",_rootDir);  //dujw
		NSString * path = [NSString stringWithFormat:@"%@/%@_summary.plist", _rootDir, theId];
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
		_subItems = [_data objectForKey:@"subItems"];
	}
	
	return self;
}

- (void)dealloc {
	[_rootDir release];
	[_data release];
	[super dealloc];
}

- (NSString *)imageNameAtIndex:(NSUInteger)index {
    NSString *name = nil;
    if (index < [self imageCount]) {
        NSDictionary *data = [_subItems objectAtIndex:index];
        name = [data valueForKey:@"imageName"];
    }
    return name;
}

- (NSUInteger)imageCount {
    return [_subItems count];
}

- (UIImage *)imageAtIndex:(NSUInteger)index {
    // use "imageWithContentsOfFile:" instead of "imageNamed:" here to avoid caching our images
    NSString *imageName = [self imageNameAtIndex:index];
    NSString *path = [NSString stringWithFormat:@"%@/images/%@", _rootDir, imageName];
    return [UIImage imageWithContentsOfFile:path];
//	return [UIImage imageNamed:imageName];
}

- (NSString *)mainTitle {
	NSString * value = [_data objectForKey:@"mainTitle"];
	return value;
}

- (NSString *)mainDescription {
	NSString * value = [_data objectForKey:@"mainDescription"];
	return value;
}

- (NSString *)subTitleAtIndex:(NSUInteger)index {
    NSString *value = nil;
    if (index < [self imageCount]) {
        NSDictionary *data = [_subItems objectAtIndex:index];
        value = [data valueForKey:@"subTitle"];
    }
    return value;
}

- (NSString *)subDescriptionAtIndex:(NSUInteger)index {
    NSString *value = nil;
    if (index < [self imageCount]) {
        NSDictionary *data = [_subItems objectAtIndex:index];
        value = [data valueForKey:@"subDescription"];
    }
    return value;
}

- (NSString *)videoFile {
    NSString *path = [NSString stringWithFormat:@"%@/videos/video.mp4", _rootDir];
	return path;
}

@end
