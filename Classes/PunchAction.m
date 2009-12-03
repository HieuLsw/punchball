#import "PunchAction.h"
#import "Player.h"

@implementation PunchAction

@synthesize dir, isHit, power;

-(id) initWithPlayer:(Player*)_player space:(cpSpace*)_space
{
	[super init];
	
	player = _player;
	space = _space;

	isRetreating = false;
	elapsed = 0;
	duration = 0;

	return self;
}



- (void) reset {
	isRetreating = false;	
	isHit = false;
	elapsed = 0;
	punchTime = MAX_PUNCH_TIME - (MAX_PUNCH_TIME - MIN_PUNCH_TIME) * power;
	//NSLog(@"punchTIme = %f", punchTime);
	duration = punchTime * 2;
}



-(void) start
{
	//NSLog(@"PunchAction START");
	
	[self reset];
	
	cpSpaceRemoveJoint(space, player.headGloveJoint1);
	cpSpaceRemoveJoint(space, player.headGloveJoint2);
	cpSpaceRemoveJoint(space, player.headGloveJoint3);
	
	cpBodyResetForces(player.gloveBody);
	//player.gloveBody->v = cpvzero;
	cpVect normDir = cpvnormalize(dir);
	cpVect relAim = cpvmult(normDir, GLOVE_DIST_MAX);
	cpVect aim = cpvadd(player.headBody->p, relAim);
	cpBodySlew(player.gloveBody, aim, punchTime);
	
	[super start];
}



-(BOOL) isDone {
	return elapsed >= duration;
}



-(void) stop
{
	//NSLog(@"PunchAction STOP %f", elapsed);
	
	[super stop];
	
	elapsed = duration;
	
	cpBodyResetForces(player.headBody);
	cpBodyResetForces(player.gloveBody);
	
	player.gloveBody->v = cpvzero;

	cpSpaceAddJoint(space, player.headGloveJoint1);
	cpSpaceAddJoint(space, player.headGloveJoint2);
	cpSpaceAddJoint(space, player.headGloveJoint3);	
}



-(void) step: (ccTime) dt {
	//NSLog(@"PunchAction STEP %f", dt);
	
	elapsed += dt;
	if (!isRetreating && elapsed >= punchTime) {
		[self retreat];
	}
}



-(void)retreat
{
	[player updatePosition];
	
	//NSLog(@"PUNCH RETREAT: %f", elapsed);
	isRetreating = true;		
	
	//cpBodyResetForces(player.gloveBody);
	//player.gloveBody->v = cpvzero;
	
	duration = elapsed * 2;
	//NSLog(@"PuncAction retreat elapsed=%f", elapsed);
	
	cpVect returnTo = cpvadd(player.headBody->p, cpvmult(cpvnormalize(cpvsub(player.gloveBody->p, player.headBody->p)), GLOVE_DIST_MIN));
	
	cpBodySlew(player.gloveBody, returnTo, elapsed);
}

@end