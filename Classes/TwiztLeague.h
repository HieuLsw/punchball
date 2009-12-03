#import <Foundation/Foundation.h>
#import "JSONLoader.h"

@protocol TwiztLeagueDelegate

@optional
- (void)onAddGameSuccess:(int)rank;
- (void)onLoadLeaderboardSuccess:(NSArray*)leaderboard;

- (void)onLeagueNetworkFail;

@end



@interface TwiztLeague : NSObject <JSONLoaderDelegate> {
	id<TwiztLeagueDelegate> delegate;
	NSString *appID;
	int points;
	int rank;
	NSString *playerName;
	NSString *playerID;
	JSONLoader *jsonLoader;
	NSMutableDictionary *state;
	NSString *secret;
}



@property(nonatomic,retain) id<TwiztLeagueDelegate> delegate;
@property(nonatomic,retain) NSMutableDictionary *state;
@property(nonatomic,copy) NSString *playerName;
@property(nonatomic,copy) NSString *playerID;

- (id) initWithAppID: (NSString*)_appID secret:(NSString*)_secret;;

- (void) setPlayerName:(NSString*)_name;

- (int) addGame:(NSString*)opponentID opponentName:(NSString*)opponentName score:(int)score submitBoth:(bool)submitBoth;

- (int) getRank:(NSString*)opponentID;
- (int) getBestScore:(NSString*)opponentID;

- (void) loadLeaderboard:(NSString*)opponentID;

- (NSString *) getStatePath;

- (NSMutableDictionary*) getGames;

- (NSMutableDictionary*) getPlayerGames: (NSString*)_playerID playerName:(NSString*)playerName;

- (void) writeState;

- (int) getTotalGames;

- (NSString *)makeSignature:(NSString *)salt data:(NSData*) data;

@end
