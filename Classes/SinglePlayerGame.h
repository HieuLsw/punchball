#import "Game.h"


@interface SinglePlayerGame : Game {
}

-(id) initWithDelegate: (id)_delegate opponent:(int)opponent;

@end
