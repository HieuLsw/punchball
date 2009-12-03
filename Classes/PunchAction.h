#import "cocos2d.h"
#import "chipmunk.h"

@class Player;

@interface PunchAction : Action {
	Player *player;
	cpSpace* space;
	cpVect dir;
	bool isRetreating;
	bool isHit;
	float elapsed;
	float duration;
	float power;
	float punchTime;
}

@property (readwrite) cpVect dir;
@property (readwrite) bool isHit;
@property (readwrite) float power;

- (id) initWithPlayer:(Player*)_player space:(cpSpace*)_space;
- (void) reset;
- (void) retreat;

@end
