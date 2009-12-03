#import "HeadParticle.h"


@implementation HeadParticle

+(id)particleWithSpace:(cpSpace*)_space manager:(AtlasSpriteManager*)_spriteManager index:(int)index {
	return [[[self alloc] initWithSpace:_space manager:_spriteManager index:index] autorelease];
}



-(id) initWithSpace:(cpSpace*)_space manager:(AtlasSpriteManager*)_spriteManager index:(int)_index {
	[super init];
	
	space = _space;
	spriteManager = _spriteManager;
	index = _index;
	
	sprite = [[AtlasSprite alloc] initWithRect:CGRectMake(index * 30, 0, 30, 30) spriteManager:spriteManager];
	
	body = cpBodyNew(1.0f, cpMomentForCircle(1.0f, 12, 12, CGPointZero));
	
	shape = cpCircleShapeNew(body, 12, CGPointZero);
	shape->collision_type = COLLISION_TYPE_HEAD_PARTICLE;
	shape->e = 0.3f; 
	shape->u = 0.3f;
	shape->data = self;
	
	return self;
}


-(void)dealloc {
	cpSpaceRemoveShape(space, shape);
	cpShapeFree(shape);
	
	cpSpaceRemoveBody(space, body);
	cpBodyFree(body);
	
	[spriteManager removeChild:sprite cleanup:YES];
	
	[sprite release];
	
	[super dealloc];
}


-(void)activate: (cpVect) pos v:(cpVect)v {
	[spriteManager addChild: sprite];	
	
	if (index == 0) {
		pos.x -= 10;
		pos.y += 10;
	} else if (index == 1) {
		pos.y += 10;
	} else if (index == 2) {
		pos.x += 10;
		pos.y += 10;
		
	} else if (index == 3) {
		pos.x -= 10;
	} else if (index == 4) {
	} else if (index == 5) {
		pos.x += 10;
		
	} else if (index == 6) {
		pos.x -= 10;
		pos.y -= 10;
	} else if (index == 7) {
		pos.y -= 10;
	} else if (index == 8) {
		pos.x += 10;
		pos.y -= 10;
	}
		
	sprite.position = pos;
	body->p = pos;
	cpSpaceAddBody(space, body);
	cpSpaceAddShape(space, shape);
	cpBodyApplyImpulse(body, v, cpvzero);
}



- (void)updatePosition {
	//body->w = 0; body->t = 0;
	sprite.position = body->p;
	sprite.rotation = (float) CC_RADIANS_TO_DEGREES( -body->a );	
}

@end
