#import "cocos2d.h"
#import "chipmunk.h"

@interface GameObject : NSObject {	
}

- (void)updatePosition;

-(void) step: (ccTime) delta;

@end

@interface GameObjectWrapper : GameObject {
	GameObject *target;
}

@property (readonly) GameObject *target;

- (id)initWithTarget:(GameObject*)_target;

@end
