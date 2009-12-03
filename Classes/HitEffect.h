#import "cocos2d.h"
#import "chipmunk.h"

@interface HitEffect : PointParticleSystem
{
	ccColor4F color;
}

-(id) initWithPlayerColor: (int) _color;
-(void)activate;

@end
