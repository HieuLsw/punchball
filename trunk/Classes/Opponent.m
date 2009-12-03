#import "Opponent.h"


@implementation Opponent

- (id) init: (id<OpponentDelegate>) _delegate {
	[super init];
	
	delegate = _delegate;
	
	Sprite *bg = [Sprite spriteWithFile:@"opponent.png"];
	bg.anchorPoint = cpvzero;	
	[self addChild:bg z:0];			

	Menu *o1 = [Menu menuWithItems: [MenuItemImage itemFromNormalImage:@"b_go.png" selectedImage:@"b_go_s.png" target:self selector:@selector(opponent1:)], nil];
	o1.position = cpv(240, 255);
	[self addChild:o1 z:1];

	Menu *o2 = [Menu menuWithItems: [MenuItemImage itemFromNormalImage:@"b_go.png" selectedImage:@"b_go_s.png" target:self selector:@selector(opponent2:)], nil];
	o2.position = cpv(240, 200);
	[self addChild:o2 z:1];

	Menu *o3 = [Menu menuWithItems: [MenuItemImage itemFromNormalImage:@"b_go.png" selectedImage:@"b_go_s.png" target:self selector:@selector(opponent3:)], nil];
	o3.position = cpv(240, 145);
	[self addChild:o3 z:1];

	Menu *o4 = [Menu menuWithItems: [MenuItemImage itemFromNormalImage:@"b_go.png" selectedImage:@"b_go_s.png" target:self selector:@selector(opponent4:)], nil];
	o4.position = cpv(240, 90);
	[self addChild:o4 z:1];
	
	Menu *o5 = [Menu menuWithItems: [MenuItemImage itemFromNormalImage:@"b_go.png" selectedImage:@"b_go_s.png" target:self selector:@selector(opponent5:)], nil];
	o5.position = cpv(240, 35);
	[self addChild:o5 z:1];
	
	[self visit];
	
	return self;
}



- (void)layerReplaced
{
}



-(void) opponent1: (id) sender
{	
	[delegate opponentSelected:1];
}



-(void) opponent2: (id) sender
{	
	[delegate opponentSelected:2];
}



-(void) opponent3: (id) sender
{	
	[delegate opponentSelected:3];
}


-(void) opponent4: (id) sender
{	
	[delegate opponentSelected:4];
}


-(void) opponent5: (id) sender
{	
	[delegate opponentSelected:5];
}


@end
