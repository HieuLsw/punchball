#import "cocos2d.h"
#import "chipmunk.h"
#import "ReplaceLayerAction.h"
#import "TwiztLeague.h"

@protocol LeagueLeaderboardDelegate

@optional
-(void) onLeagueBack;

@end



@interface LeagueLeaderboard : Layer <ReplaceLayerActionDelegate, UITableViewDelegate, UITableViewDataSource, TwiztLeagueDelegate> {
	id<LeagueLeaderboardDelegate> delegate;
	UIWindow *window;
	UITableView *table;
	NSString *opponentName;
	NSMutableDictionary *opponentGames;
	NSArray *leaderboard;
	TwiztLeague *league;
	bool isError;
}

-(id)init:(id<LeagueLeaderboardDelegate>)_delegate league:(TwiztLeague*)_league window:(UIWindow*)_window playerID:(NSString*)_playerID;

@end
