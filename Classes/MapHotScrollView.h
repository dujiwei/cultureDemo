
#import <UIKit/UIKit.h>
#import "TilingView.h"

@interface MapHotScrollView : UIScrollView <UIScrollViewDelegate> {
    UIView        *imageView;
    NSUInteger     index;
    UIButton* Btn;
}
@property (assign) NSUInteger index;

- (void)displayImage:(UIImage *)image;
- (void)displayTiledImageWithDataSource:(id<TilingViewDataSource>)dataSource;
- (void)setMaxMinZoomScalesForCurrentBounds;

- (CGPoint)pointToCenterAfterRotation;
- (CGFloat)scaleToRestoreAfterRotation;
- (void)restoreCenterPoint:(CGPoint)oldCenter scale:(CGFloat)oldScale;
-(void) BtnClicker:(id)sender;
@end
