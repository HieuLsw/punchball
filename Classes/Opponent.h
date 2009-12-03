#include "cocos2d.h"
#include "chipmunk.h"
#include "ReplaceLayerAction.h"

@protocol OpponentDelegate

- (void) opponentSelected:(int)opponent;

@end


@interface Opponent : Layer<ReplaceLayerActionDelegate> {
	id<OpponentDelegate> delegate;
}

- (id) init: (id<OpponentDelegate>) _delegate;

@end
