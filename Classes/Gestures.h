#import "cocos2d.h"
#import "chipmunk.h"



typedef enum {
	TWO_DOWN,
	TWO_LEFT
} GestureType;



@protocol GesturesDelegate

-(void) onGesture: (GestureType)gestureType;

@end



@interface Gestures : NSObject {
	id<GesturesDelegate> delegate;
}

-(id)initWithDelegate:(id<GesturesDelegate>)_delegate;

- (void) touchesBegan:(NSSet *)touches;
- (void) touchesMoved:(NSSet *)touches;
- (void) touchesEnded:(NSSet *)touches;

@end
