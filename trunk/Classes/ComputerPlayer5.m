#import "ComputerPlayer5.h"


@implementation ComputerPlayer5

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
				 color:5
				  game:_game
				headSM:_headSM 
			   gloveSM:_gloveSM 
			  springSM:_springSM
			   bonusSM:_bonusSM
		headParticleSM:_headParticleSM 
				 space:_space
		   otherPlayer:_otherPlayer];
	
	maxSlideDelay = 1.50f;
	maxPunchDelay = 0.50f;
	slideMax = 200;
	slideSpeed = 800;
	hitPrecision = 40;
	
	return self;
}

@end
