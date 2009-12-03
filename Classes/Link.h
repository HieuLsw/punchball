#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>



#define MAX_PACKET_SIZE 1024



typedef enum {
	RoleServer,
	RoleClient
} LinkRole;



#define PACKET_COINTOSS -1				// decide who is going to be the server



@protocol DataReceiver

- (void)receivePacket:(int)packetID objectIndex:(int)objectIndex data:(void*)data;

@end



@protocol LinkDelegate

-(void) linkConnected: (LinkRole) role;
-(void) linkDisconnected;

@end

@interface Link : NSObject<GKPeerPickerControllerDelegate,GKSessionDelegate> {
	id<LinkDelegate> delegate;
	id<DataReceiver> dataReceiver;
	
	NSString	*sessionID;
	NSString	*name;
	GKSession	*session;
	UIAlertView	*connectionAlert;
	NSInteger	state;
	NSInteger	role;
	int			uniqueID;
	int			peerUniqueID;
	int			packetNumber;
	NSString	*peerID;
	NSString	*peerName;
}

@property(nonatomic) NSInteger					state;

@property(nonatomic, copy)	 NSString			*name;
@property(nonatomic) NSInteger					role;
@property(nonatomic) NSInteger					uniqueID;
@property(nonatomic, copy)	 NSString			*sessionID;

@property(nonatomic, retain) GKSession			*session;

// remote peer
@property(nonatomic, copy)	 NSString			*peerID;
@property(nonatomic) NSInteger					peerUniqueID;
@property(nonatomic, copy)	 NSString			*peerName;

@property(nonatomic, retain) UIAlertView		*connectionAlert;
@property(nonatomic, retain) id<DataReceiver>	dataReceiver;

- (id)initWithID:(NSString*)_sessionID name:(NSString*)_name delegate:(id<LinkDelegate>)_delegate;

- (void)startPicker;
- (void)reset;
- (void)resync;
- (void)sendPacket:(int)packetID objectIndex:(int)objectIndex data:(void *)data length:(int)length reliable:(bool)howtosend;

- (void)invalidateSession;

@end
