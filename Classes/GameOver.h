#import "cocos2d.h"
#import "chipmunk.h"
#import "ReplaceLayerAction.h"
#import "TwiztLeague.h"

@protocol GameOverDelegate

-(void) onGameOverReplay;
-(void) onGameOverMenu;
-(void) leaderboard;

@end


@interface GameOver : Layer <ReplaceLayerActionDelegate,TwiztLeagueDelegate> {
	id<GameOverDelegate> delegate;
	bool isActive;
	int score;
	int bonus;

	Label *scoreLabel;
	
	Label *opponentLabel;
	Label *bestScoreLabel;
	Label *rankLabel;
	
	TwiztLeague *league;
}

-(id) initWithDelegate: (id<GameOverDelegate>)_delegate youWin:(bool)youWin score:(int)_score opponentName:(NSString*)opponentName;

-(void) setBestScore:(int)bestScore;
-(void) setRank:(int)rank;

@end
