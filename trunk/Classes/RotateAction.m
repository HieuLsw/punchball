#import "RotateAction.h"

#import "Player.h"
#import "Common.h"

//#define FULL_DURATION 0.4f
//#define FULL_ANGLE 6.0f
//#define ANGLE_VELOCITY_MULT 4.0f


@implementation RotateAction

@synthesize isRunning;

-(id) initWithPlayer: (Player*)_player
{
	player = _player;
	isRunning = false;
	return [super initWithDuration:0];
}



-(void)setAngle: (float) _angle {
	player.gloveAngle = normAngle(_angle);	
	
	float angleDelta = normAngle(player.gloveAngle - normAngle(player.headBody->a));
	if (angleDelta > M_PI) {
		angleDelta = D_PI - angleDelta;
	}		

	//NSLog(@"RotateAction setAngle currentAngle=%f newAngle=%f delta=%f", player.headBody->a, player.gloveAngle, angleDelta);
	duration = angleDelta / ROTATE_SPEED; // how long will rotation take in seconds
}



-(void) start
{
	//NSLog(@"RotateAction START");
	
	isRunning = true;
	
	/*
	NSLog(@"angle=%f", angle);
	NSLog(@"duration=%f", duration);
	NSLog(@"angleDelta=%f", angleDelta);	
	NSLog(@"currentAngle=%f", player.headBody->a);
		
	NSLog(@"angleVelocity=%f", player.headBody->w);
	 */
	
	[super start];
}



-(void) stop
{	
	//NSLog(@"RotateAction STOP angle=%f", player.headBody->a);

	[super stop];
	
	isRunning = false;

	//player.headBody->w = 0;
	//player.gloveAngle = player.headBody->a;
	//player.headBody->v = cpvzero;
	//player.gloveBody->w = 0;
	//player.gloveBody->v = cpvzero;
	
	[player.gloveSprite runAction:player.punchAction];
}


-(void) update: (ccTime) t
{	
	//NSLog(@"PunchAction UPDATE %f", t);
	
	//[self calcAngleDelta];
	//player.headBody->w = angleDelta / duration * ANGLE_VELOCITY_MULT;	
	
	//NSLog(@"UPDATE t=%f a=%f ad=%f dur=%f av=%f", t, player.headBody->a, angleDelta, duration, player.headBody->w);
}

@end
