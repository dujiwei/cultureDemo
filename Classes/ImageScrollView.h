
#import <UIKit/UIKit.h>
#import "TilingView.h"

@interface ImageScrollView : UIScrollView <UIScrollViewDelegate> {
    UIView        *imageView;
    NSUInteger     index;
    
}
@property (assign) NSUInteger index;

- (void)displayImage:(UIImage *)image;
- (void)displayTiledImageWithDataSource:(id<TilingViewDataSource>)dataSource;
- (void)setMaxMinZoomScalesForCurrentBounds;

- (CGPoint)pointToCenterAfterRotation;
- (CGFloat)scaleToRestoreAfterRotation;
- (void)restoreCenterPoint:(CGPoint)oldCenter scale:(CGFloat)oldScale;

@end
