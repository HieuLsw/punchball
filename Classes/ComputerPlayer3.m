#import "ComputerPlayer3.h"


@implementation ComputerPlayer3

-(id) initWithPos:(cpVect)pos 
			 left:(bool)left
			 game:(Game*)_game 
		   headSM:(AtlasSpriteManager*)_headSM 
		  gloveSM:(AtlasSpriteManager*)_gloveSM 
		 springSM:(AtlasSpriteManager*)_springSM 
		  bonusSM:(AtlasSpriteManager*)_bonusSM 
   headParticleSM:(AtlasSpriteManager*)_headParticleSM 
			space:(cpSpace*)_space
	  otherPlayer:(Player*)_otherPlayer
{
	[super initWithPos:pos 
				  left:left 
				 color:3
				  game:_game
				headSM:_headSM 
			   gloveSM:_gloveSM 
			  springSM:_springSM
			   bonusSM:_bonusSM
		headParticleSM:_headParticleSM 
				 space:_space
		   otherPlayer:_otherPlayer];
	
	maxSlideDelay = 2.5f;
	maxPunchDelay = 1.0f;
	slideMax = 105;
	slideSpeed = 475;
	hitPrecision = 60;
	
	return self;
}

@end
