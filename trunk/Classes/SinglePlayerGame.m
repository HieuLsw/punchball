#import "SinglePlayerGame.h"

#import "ComputerPlayer1.h"
#import "ComputerPlayer2.h"
#import "ComputerPlayer3.h"
#import "ComputerPlayer4.h"
#import "ComputerPlayer5.h"



@implementation SinglePlayerGame

-(id) initWithDelegate: (id)_delegate opponent:(int)opponent
{
	[super initWithDelegate:_delegate];

	leftPlayer.isLocal = true;
	localPlayer = leftPlayer;
	
	switch (opponent) {
		case 1:			
			rightPlayer = [[[ComputerPlayer1 alloc] initWithPos:cpv(360, 160)  
														   left:false
														   game:self 
														 headSM:headSM 
														gloveSM:gloveSM 
													   springSM:springSM 
														bonusSM:bonusSM							
												 headParticleSM:headParticleSM 
														  space:space
													otherPlayer:localPlayer] autorelease];
			opponentName = @"Bazo";
			
			break;

		case 2:			
			rightPlayer = [[[ComputerPlayer2 alloc] initWithPos:cpv(360, 160)  
														   left:false
														   game:self 
														 headSM:headSM 
														gloveSM:gloveSM 
													   springSM:springSM 
														bonusSM:bonusSM
												 headParticleSM:headParticleSM 
														  space:space
													otherPlayer:localPlayer] autorelease];

			opponentName = @"Pugo";
			
			break;

		case 3:			
			rightPlayer = [[[ComputerPlayer3 alloc] initWithPos:cpv(360, 160)  
														   left:false
														   game:self 
														 headSM:headSM 
														gloveSM:gloveSM 
													   springSM:springSM
														bonusSM:bonusSM							
												 headParticleSM:headParticleSM 
														  space:space
													otherPlayer:localPlayer] autorelease];
			
			opponentName = @"Gepo";
			
			break;

		case 4:			
			rightPlayer = [[[ComputerPlayer4 alloc] initWithPos:cpv(360, 160)  
														   left:false
														   game:self 
														 headSM:headSM 
														gloveSM:gloveSM 
													   springSM:springSM 
														bonusSM:bonusSM							
												 headParticleSM:headParticleSM 
														  space:space
													otherPlayer:localPlayer] autorelease];
			
			opponentName = @"Miko";
			
			break;

		case 5:			
			rightPlayer = [[[ComputerPlayer5 alloc] initWithPos:cpv(360, 160)  
														   left:false
														   game:self 
														 headSM:headSM 
														gloveSM:gloveSM 
													   springSM:springSM 
														bonusSM:bonusSM						
												 headParticleSM:headParticleSM 
														  space:space
													otherPlayer:localPlayer] autorelease];

			opponentName = @"Roco";

			break;
			
		default:
			NSLog(@"invalid computer opponent: %d", opponent);
			break;
	}
	
	[gameObjects addObject:rightPlayer];	
	
	[rightLabel setString:opponentName];
	[leftLabel setString:@"You"];

	[self updateScores];	
	
	return self;
}

@end
