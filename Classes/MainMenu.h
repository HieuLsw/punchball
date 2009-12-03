#include "cocos2d.h"
#include "chipmunk.h"
#include "ReplaceLayerAction.h"

@protocol MainMenuDelegate

- (void) startSinglePlayer;
- (void) startMultiPlayer;
- (void) league;

@end


@interface MainMenu : Layer<ReplaceLayerActionDelegate> {
	id<MainMenuDelegate> delegate;
}

- (id) init: (id<MainMenuDelegate>) _delegate;

@end
