#import "cocos2d.h"
#import "chipmunk.h"

@class Player;

@interface RotateAction : IntervalAction {
	Player *player;
	bool isRunning;	
}

@property (readonly) bool isRunning;

-(id) initWithPlayer: (Player*)_player;
-(void)setAngle: (float) angle;

@end
