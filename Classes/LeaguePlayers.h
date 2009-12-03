#import "cocos2d.h"
#import "chipmunk.h"
#import "ReplaceLayerAction.h"
#import "TwiztLeague.h"

@protocol LeaguePlayersDelegate

@optional
-(void) onLeagueMenu;
-(void) onLeaguePlayer:(NSString*)playerId;

@end



@interface LeaguePlayers : Layer <ReplaceLayerActionDelegate, UITableViewDelegate, UITableViewDataSource> {
	id<LeaguePlayersDelegate> delegate;
	UIWindow *window;
	UITableView *table;
	NSArray *playerIDs;
	TwiztLeague *league;
}

-(id)init:(id<LeaguePlayersDelegate>)_delegate league:(TwiztLeague*)_league window:(UIWindow*)_window;

@end
