
#import "MapHotScrollView.h"
#import "TilingView.h"
#import "dtCloudDelegate.h"

@implementation MapHotScrollView
@synthesize index;

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.bouncesZoom = YES;
        self.decelerationRate = UIScrollViewDecelerationRateFast;
        self.delegate = self;        
    }
    return self;
}

// 用来支持从NIB加载的情况
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.bouncesZoom = YES;
        self.decelerationRate = UIScrollViewDecelerationRateFast;
        self.delegate = self;        
    }
    return self;
}

- (void)dealloc
{
    [imageView release];
    [super dealloc];
}

#pragma mark -
#pragma mark Override layoutSubviews to center content

- (void)layoutSubviews 
{
    [super layoutSubviews];
    
    // center the image as it becomes smaller than the size of the screen
    
    CGSize boundsSize = self.bounds.size;
    CGRect frameToCenter = imageView.frame;
    
    // center horizontally
    if (frameToCenter.size.width < boundsSize.width)
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2;
    else
        frameToCenter.origin.x = 0;
    
    // center vertically
    if (frameToCenter.size.height < boundsSize.height)
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2;
    else
        frameToCenter.origin.y = 0;
    
    imageView.frame = frameToCenter;
    
        //---求得imageView的frame的放大倍数，有针对性的进行放大缩小。
   //    CGRect btnRect;
    //btnRect.origin.x = btnRect.origin.x /self.zoomScale;
    //btnRect.origin.y = btnRect.origin.y /self.zoomScale;    
    //[Btn setFrame:btnRect];
    NSLog(@"%f,%f,%f,%f",frameToCenter.origin.x,frameToCenter.origin.y,frameToCenter.size.width,frameToCenter.size.height);
    if ([imageView isKindOfClass:[TilingView class]]) {
        // to handle the interaction between CATiledLayer and high resolution screens, we need to manually set the
        // tiling view's contentScaleFactor to 1.0. (If we omitted this, it would be 2.0 on high resolution screens,
        // which would cause the CATiledLayer to ask us for tiles of the wrong scales.)
        imageView.contentScaleFactor = 1.0;
    }
}

#pragma mark -
#pragma mark UIScrollView delegate methods

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return imageView;
}

#pragma mark -
#pragma mark Configure scrollView to display new image (tiled or not)

- (void)displayImage:(UIImage *)image
{
    // clear the previous imageView
    [imageView removeFromSuperview];
    [imageView release];
    imageView = nil;
    
    // reset our zoomScale to 1.0 before doing any further calculations
    self.zoomScale = 1.0;
    
    // make a new UIImageView for the new image
    imageView = [[UIImageView alloc] initWithImage:image];
    [self addSubview:imageView];
    
    self.contentSize = [image size];
    
    [self setMaxMinZoomScalesForCurrentBounds];
    self.zoomScale = self.minimumZoomScale;
    Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [Btn setImage:[UIImage imageNamed:@"Video.png"] forState:UIControlStateNormal];
    Btn.tag = 1;
    CGRect btnframe;
    btnframe.size.width = 57*2 ;
    btnframe.size.height = 57*2 ;
    btnframe.origin.x = (1) *(57*2 +110) +25*2; //这里要根据按钮的位置计算
    btnframe.origin.y = floor(1) *(57*2 +110) +25*2;//这里要根据按钮的位置计算
    
    
    
    [Btn setBackgroundColor:[UIColor clearColor]];
    [Btn setFrame:btnframe];
    
    [Btn addTarget:self action:@selector(bntClicker:) forControlEvents:UIControlEventTouchUpInside];//设置点击触发事件
    [imageView setUserInteractionEnabled:YES];
    [imageView addSubview:Btn];

   
}
-(void) BtnClicker:(id)sender
{
    //按钮点击，根据sender的tag判断点击了哪个按钮。
    
    //根据按钮的orgin的x，y的值，判断除需要探出view的origin的x，y 
    
    
}
- (void)displayTiledImageWithDataSource:(id<TilingViewDataSource>)dataSource
{
    // clear the previous imageView
    [imageView removeFromSuperview];
    [imageView release];
    imageView = nil;
    
    // reset our zoomScale to 1.0 before doing any further calculations
    self.zoomScale = 1.0;
    
    // make a new TilingView for the new image
    imageView = [[TilingView alloc] initWithDataSource:dataSource];
    //[(TilingView *)imageView setAnnotates:YES]; // ** remove this line to remove the white tile grid **
    [self addSubview:imageView];
    
    self.contentSize = [dataSource fullImageSize];
    [self setMaxMinZoomScalesForCurrentBounds];
    self.zoomScale = self.minimumZoomScale;
}

- (void)setMaxMinZoomScalesForCurrentBounds
{
    CGSize boundsSize = self.bounds.size;
    CGSize imageSize = imageView.bounds.size;
    
    // calculate min/max zoomscale
    CGFloat xScale = boundsSize.width / imageSize.width;    // the scale needed to perfectly fit the image width-wise
    CGFloat yScale = boundsSize.height / imageSize.height;  // the scale needed to perfectly fit the image height-wise
    CGFloat minScale = MIN(xScale, yScale);                 // use minimum of these to allow the image to become fully visible
    
    // on high resolution screens we have double the pixel density, so we will be seeing every pixel if we limit the
    // maximum zoom scale to 0.5.
    CGFloat maxScale = 1.0 / [[UIScreen mainScreen] scale];
	maxScale *= 2; 
    
    // don't let minScale exceed maxScale. (If the image is smaller than the screen, we don't want to force it to be zoomed.) 
    if (minScale > maxScale) {
        minScale = maxScale;
    }
    
    self.maximumZoomScale = maxScale;
    self.minimumZoomScale = minScale;
}

#pragma mark -
#pragma mark Methods called during rotation to preserve the zoomScale and the visible portion of the image

// returns the center point, in image coordinate space, to try to restore after rotation. 
- (CGPoint)pointToCenterAfterRotation
{
    CGPoint boundsCenter = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    return [self convertPoint:boundsCenter toView:imageView];
}

// returns the zoom scale to attempt to restore after rotation. 
- (CGFloat)scaleToRestoreAfterRotation
{
    CGFloat contentScale = self.zoomScale;
    
    // If we're at the minimum zoom scale, preserve that by returning 0, which will be converted to the minimum
    // allowable scale when the scale is restored.
    if (contentScale <= self.minimumZoomScale + FLT_EPSILON)
        contentScale = 0;
    
    return contentScale;
}

- (CGPoint)maximumContentOffset
{
    CGSize contentSize = self.contentSize;
    CGSize boundsSize = self.bounds.size;
    return CGPointMake(contentSize.width - boundsSize.width, contentSize.height - boundsSize.height);
}

- (CGPoint)minimumContentOffset
{
    return CGPointZero;
}

// Adjusts content offset and scale to try to preserve the old zoomscale and center.
- (void)restoreCenterPoint:(CGPoint)oldCenter scale:(CGFloat)oldScale
{    
    // Step 1: restore zoom scale, first making sure it is within the allowable range.
    self.zoomScale = MIN(self.maximumZoomScale, MAX(self.minimumZoomScale, oldScale));
    
    
    // Step 2: restore center point, first making sure it is within the allowable range.
    
    // 2a: convert our desired center point back to our own coordinate space
    CGPoint boundsCenter = [self convertPoint:oldCenter fromView:imageView];
    // 2b: calculate the content offset that would yield that center point
    CGPoint offset = CGPointMake(boundsCenter.x - self.bounds.size.width / 2.0, 
                                 boundsCenter.y - self.bounds.size.height / 2.0);
    // 2c: restore offset, adjusted to be within the allowable range
    CGPoint maxOffset = [self maximumContentOffset];
    CGPoint minOffset = [self minimumContentOffset];
    offset.x = MAX(minOffset.x, MIN(maxOffset.x, offset.x));
    offset.y = MAX(minOffset.y, MIN(maxOffset.y, offset.y));
    self.contentOffset = offset;
}

- (void)setFrame:(CGRect)newFrame {
	CGSize oldSize = self.frame.size;
	[super setFrame:newFrame];

	// 视图size发生变化时，重置图片缩放率
    if (!CGSizeEqualToSize(oldSize, newFrame.size)) {
		self.zoomScale = 1.0; // reset our zoomScale to 1.0 before doing any further calculations
		[self setMaxMinZoomScalesForCurrentBounds];
		self.zoomScale = self.minimumZoomScale;
	}
}

@end
