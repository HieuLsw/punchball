#import "Splash.h"


@implementation Splash

-(id)init
{
	[super init];

	Sprite *bg = [Sprite spriteWithFile:@"twizt.png"];
	bg.anchorPoint = cpvzero;	
	
	[self addChild:bg z:0];		
	
	return self;
}

- (void)layerReplaced
{
}

@end
