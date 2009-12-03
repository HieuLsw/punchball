#import "GameObject.h"


@implementation GameObject

- (void)updatePosition {
}



-(void) step: (ccTime) delta {
}

@end



@implementation GameObjectWrapper

@synthesize target;

- (id)initWithTarget:(GameObject*)_target
{
	target = _target;
	return [super init];
}


@end