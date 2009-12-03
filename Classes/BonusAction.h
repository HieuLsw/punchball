#import "cocos2d.h"
#import "chipmunk.h"

@interface BonusAction : IntervalAction {
	cpVect startPosition;
	cpVect delta;
	AtlasSpriteManager *sm;
	AtlasSprite *sprite;
}

+(id) actionWithType:(int)type pos:(cpVect)pos sm:(AtlasSpriteManager*)_sm;

-(id) initWithType:(int)type pos:(cpVect)pos sm:(AtlasSpriteManager*)_sm;

@end
