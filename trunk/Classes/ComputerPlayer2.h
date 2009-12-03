#import "ComputerPlayer.h"

@interface ComputerPlayer2 : ComputerPlayer {
	
}

-(id) initWithPos:(cpVect)pos 
			 left:(bool)left
			 game:(Game*)game 
		   headSM:(AtlasSpriteManager*)_headSM 
		  gloveSM:(AtlasSpriteManager*)_gloveSM 
		 springSM:(AtlasSpriteManager*)_springSM
		  bonusSM:(AtlasSpriteManager*)_bonusSM
   headParticleSM:(AtlasSpriteManager*)_headParticleSM 
			space:(cpSpace*)_space
	  otherPlayer:(Player*)_otherPlayer;


@end
