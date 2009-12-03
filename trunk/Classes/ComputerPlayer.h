#import "Player.h"

@interface ComputerPlayer : Player {
	Player *otherPlayer;	
	
	float maxSlideDelay; // max delay between slides in seconds
	float maxPunchDelay; // max delay between punches in seconds
	float maxSweep;
	
	int slideMax; 
	int hitPrecision; // closer to 0 is better
	
	float turnTime;
	float punchTime;
	float slideTime;
	
	bool firstCycle;
}


-(id) initWithPos:(cpVect)pos 
			 left:(bool)left
			color:(int)_color
			 game:(Game*)game 
		   headSM:(AtlasSpriteManager*)_headSM 
		  gloveSM:(AtlasSpriteManager*)_gloveSM 
		 springSM:(AtlasSpriteManager*)_springSM
		  bonusSM:(AtlasSpriteManager*)_bonusSM
   headParticleSM:(AtlasSpriteManager*)_headParticleSM 
			space:(cpSpace*)_space
	  otherPlayer:(Player*)_otherPlayer;


@end
