#import "GameOver.h"
#import "MainMenu.h"
#import "Game.h"
#import "Link.h"
#import "State.h"
#import "Opponent.h"
#import "EnterName.h"
#import "TwiztLeague.h"
#import "LeaguePlayers.h"
#import "LeagueLeaderboard.h"

@interface AppController : NSObject 
	<
	UIApplicationDelegate, 
	GameDelegate, 
	GameOverDelegate, 
	MainMenuDelegate, 
	LinkDelegate,
	OpponentDelegate,
	EnterNameDelegate,
	LeaguePlayersDelegate,
	LeagueLeaderboardDelegate
	> 
{
	UIWindow	*window;
	Scene		*scene;
	Layer		*currentLayer;
	Link		*link;
	State		*state;
	TwiztLeague *league;
	int			gameState;
	int			opponent;
	
	bool youWin;
	int score;
	NSString *opponentName;
	NSString *opponentID;	
}

- (void) mainMenu;
- (void) enterName;

@end

