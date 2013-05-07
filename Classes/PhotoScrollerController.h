
/*
 王李改造：
 2011-10-25
 1、支持非全屏。
 2、分离数据源。
 3、支持设置为全图方式或缩放方式中的一种。
 */

#import <UIKit/UIKit.h>
#import "TilingView.h"

// 照片滚动器的显示方式
enum PhotoScrollerStyle {
	PhotoScrollerStyleFullImages, // 全图方式
	PhotoScrollerStyleTiledImages // 缩放方式（分割图拼接）
};

// 照片滚动器的数据源
@protocol PhotoScrollerDataSource <NSObject>
@optional

// 全图方式
- (NSUInteger)imageCount;
- (UIImage *)imageAtIndex:(NSUInteger)index;

// 缩放方式（分割图拼接）
- (id<TilingViewDataSource>)tilingViewDataSourceAtIndex:(NSUInteger)index;

@end

// 照片滚动器的代理

@class PhotoScrollerController;

@protocol PhotoScrollerDelegate <NSObject>
@optional

- (void)photoScrollerIndexDidChange:(PhotoScrollerController *)photoScroller index:(NSUInteger)index;

@end

// 照片滚动器的视图控制器

@class ImageScrollView;

@interface PhotoScrollerController : UIViewController <UIScrollViewDelegate> {
    UIScrollView *pagingScrollView;

    NSMutableSet *recycledPages;
    NSMutableSet *visiblePages;

    // these values are stored off before we start rotation so we adjust our content offset appropriately during rotation
    int           firstVisiblePageIndexBeforeRotation;
    CGFloat       percentScrolledIntoFirstVisiblePage;
	
	CGRect	_initFrame;
	enum PhotoScrollerStyle _style;
	id<PhotoScrollerDataSource> _dataSource;
	id<PhotoScrollerDelegate> _delegate;
	NSUInteger _index;
}

@property(nonatomic, assign) enum PhotoScrollerStyle style;
@property(nonatomic, retain) id<PhotoScrollerDataSource> dataSource;
@property(nonatomic, retain) id<PhotoScrollerDelegate> delegate;

- (id)initWithFrame:(CGRect)frame;

- (void)configurePage:(ImageScrollView *)page forIndex:(NSUInteger)index;
- (BOOL)isDisplayingPageForIndex:(NSUInteger)index;

- (CGRect)frameForPagingScrollView;
- (CGRect)frameForPageAtIndex:(NSUInteger)index;
- (CGSize)contentSizeForPagingScrollView;

- (void)tilePages;
- (ImageScrollView *)dequeueRecycledPage;

@end

