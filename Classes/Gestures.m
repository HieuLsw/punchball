#import "Gestures.h"

#define THRESHOLD 15.0f


typedef enum {
	UP,
	UP_RIGHT,
	RIGHT,
	DOWN_RIGHT,
	DOWN,
	DOWN_LEFT,
	LEFT,
	UP_LEFT
} Direction;

@implementation Gestures

-(id)initWithDelegate:(id<GesturesDelegate>)_delegate {
	self = [super init];
	
	delegate = _delegate;
	
	return self;
}



- (void)dealloc {
	[super dealloc];
}



- (void) touchesBegan:(NSSet *)touches {
	//NSLog(@"gesture touchesBegan");
}



- (void) touchesMoved:(NSSet *)touches {
	//NSLog(@"gesture touchesMoved");
}



- (void) touchesEnded:(NSSet *)touches {
	NSMutableArray *directions = [NSMutableArray arrayWithCapacity:[touches count]];
	//NSLog(@"gesture touchesEnded");
	
	for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];		
		CGPoint prevLocation = [touch previousLocationInView: [touch view]];				
		CGPoint delta = cpvsub(location, prevLocation);

		//NSLog(@"gesture delta=%s", cpvstr(delta));
		
		if (delta.x > THRESHOLD) {
			if (delta.y > THRESHOLD) {
				[directions addObject:[NSNumber numberWithInt:DOWN_RIGHT]];
			} else if (delta.y < -THRESHOLD) {
				[directions addObject:[NSNumber numberWithInt:UP_RIGHT]];
			} else {
				[directions addObject:[NSNumber numberWithInt:RIGHT]];
			}

		} else if (delta.x < -THRESHOLD) {
			if (delta.y > THRESHOLD) {
				[directions addObject:[NSNumber numberWithInt:DOWN_LEFT]];
			} else if (delta.y < -THRESHOLD) {
				[directions addObject:[NSNumber numberWithInt:UP_LEFT]];
			} else {
				[directions addObject:[NSNumber numberWithInt:LEFT]];
			}
			
		} else {
			if (delta.y > THRESHOLD) {
				[directions addObject:[NSNumber numberWithInt:DOWN]];
			} else if (delta.y < -THRESHOLD) {
				[directions addObject:[NSNumber numberWithInt:UP]];
			} 			
		}		
	}	
	
	if ([directions count] == 2) {
		if ([(NSNumber*)[directions objectAtIndex:0] intValue] == DOWN &&
			[(NSNumber*)[directions objectAtIndex:1] intValue] == DOWN) 
		{
			[delegate onGesture:TWO_DOWN];
			
		} else if ([(NSNumber*)[directions objectAtIndex:0] intValue] == LEFT &&
				   [(NSNumber*)[directions objectAtIndex:1] intValue] == LEFT) 
		{
			[delegate onGesture:TWO_LEFT];
		}
	}	
}


@end
