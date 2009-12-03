#import "GameObject.h"

#define COLLISION_TYPE_HEAD_PARTICLE 3


@interface HeadParticle : GameObject {
	AtlasSprite *sprite;
	AtlasSpriteManager *spriteManager;
	cpSpace *space;
	cpBody *body;
	cpShape *shape;
	int index;
}

+(id)particleWithSpace:(cpSpace*)_space manager:(AtlasSpriteManager*)_spriteManager index:(int)index;
-(id)initWithSpace:(cpSpace*)_space manager:(AtlasSpriteManager*)_spriteManager index:(int)index;
-(void)activate: (cpVect) pos v:(cpVect)v;

@end
