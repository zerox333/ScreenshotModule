#import "ScreenshotModule.h"

#import <ControlCenterUI/ControlCenterUI-Structs.h>

@interface SBControlCenterController : NSObject

+ (instancetype)sharedInstance;
- (void)dismissAnimated:(BOOL)animated;

@end

@interface SBScreenshotManager : NSObject

- (instancetype)initWithDataSource:(id)dataSource;
- (void)saveScreenshots;

@end

@interface SpringBoard : UIApplication

- (void)takeScreenshotAndEdit:(BOOL)edit;

@end

@implementation ScreenshotModule

/*
- (CCUILayoutSize)moduleSizeForOrientation:(int)orientation
{
	CCUILayoutSize size;
	NSNumber *width, *height;

	if(orientation == 0)
	{
		width = [[[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.zerox.screenshotmoduleprefs"] objectForKey:@"PortraitWidth"];
		height = [[[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.zerox.screenshotmoduleprefs"] objectForKey:@"PortraitHeight"];
	}
	else
	{
		width = [[[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.zerox.screenshotmoduleprefs"] objectForKey:@"LandscapeWidth"];
		height = [[[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.zerox.screenshotmoduleprefs"] objectForKey:@"LandscapeHeight"];
	}

	if(height)
	{
		size.height = [height unsignedLongLongValue];
	}
	else
	{
		//Default value
		size.height = 1;
	}

	if(width)
	{
		size.width = [width unsignedLongLongValue];
	}
	else
	{
		//Default value
		size.width = 1;
	}

	return size;
}
*/

//Return the icon of your module here
- (UIImage *)iconGlyph
{
	return [UIImage imageNamed:@"Icon" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
}

/*
- (UIImage *)selectedIconGlyph
{
	return [UIImage imageNamed:@"Screenshot-Happy" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
}

//Return the color selection color of your module here
- (UIColor *)selectedColor
{
	return [UIColor redColor];
}

- (BOOL)isSelected
{
	return _selected;
}
*/

- (void)setSelected:(BOOL)selected
{
	/*
	_selected = selected;

	[super refreshState];
	*/
	[[NSClassFromString(@"SBControlCenterController") sharedInstance] dismissAnimated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // [[[NSClassFromString(@"SBScreenshotManager") alloc] initWithDataSource:[NSClassFromString(@"SBScreenshotManagerDataSource") new]] saveScreenshots];
        [(SpringBoard *)[NSClassFromString(@"SpringBoard") sharedApplication] takeScreenshotAndEdit:NO];
    });
}

@end
