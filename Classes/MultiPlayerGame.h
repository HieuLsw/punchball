#import "Game.h"
#import "Link.h"
#import <GameKit/GameKit.h>




typedef enum {	
	NETWORK_UPDATE_DIR, 
	NETWORK_PUNCH,		
	NETWORK_SLIDE,		
	NETWORK_TURN,		
	NETWORK_POS,
	NETWORK_PAUSE,
	NETWORK_RESUME
} PacketCodes;


typedef struct {
	cpVect slideTo;
	bool finalSlide;
} SlideInfo;


@interface MultiPlayerGame : Game<DataReceiver> {
	Link *link;
	int gamePacketNumber;
	Player *remotePlayer;
	float nextSlideTime;
}

@property (nonatomic, retain) Link *link;

-(id) initWithDelegate: (id<GameDelegate>)_delegate link:(Link*)_link left:(bool)left;

- (void)receivePacket:(int)packetID objectIndex:(int)objectIndex data:(void*)data;

- (void)syncState;

@end
