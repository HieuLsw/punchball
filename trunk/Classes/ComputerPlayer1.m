#import "ComputerPlayer1.h"


@implementation ComputerPlayer1

-(id) initWithPos:(cpVect)pos 
			 left:(bool)left
			 game:(Game*)_game 
		   headSM:(AtlasSpriteManager*)_headSM 
		  gloveSM:(AtlasSpriteManager*)_gloveSM 
		 springSM:(AtlasSpriteManager*)_springSM 
		  bonusSM:(AtlasSpriteManager*)_bonusSM 
   headParticleSM:(AtlasSpriteManager*)_headParticleSM 
			space:(cpSpace*)_space
	  otherPlayer:(Player*)_otherPlayer{
	[super initWithPos:pos 
				  left:left 
				 color:1
				  game:_game
				headSM:_headSM 
			   gloveSM:_gloveSM 
			  springSM:_springSM
			   bonusSM:_bonusSM
		headParticleSM:_headParticleSM 
				 space:_space
		   otherPlayer:_otherPlayer];

	maxSlideDelay = 3.5f;
	maxPunchDelay = 1.5f;
	slideMax = 10;
	slideSpeed = 150;
	hitPrecision = 100;

	return self;
}

@end
