#import "MainMenu.h"


@implementation MainMenu

- (id) init: (id<MainMenuDelegate>) _delegate {
	[super init];
	
	delegate = _delegate;
	
	Sprite *bg = [Sprite spriteWithFile:@"menu.png"];
	bg.anchorPoint = cpvzero;	
	[self addChild:bg z:0];			

	MenuItemImage *vm = [MenuItemImage itemFromNormalImage:@"b_machine.png" selectedImage:@"b_machine_s.png" target:self selector:@selector(startSingle:)];	
	Menu *vmm = [Menu menuWithItems: vm, nil];
	vmm.position = cpv(335, 185);
	[self addChild:vmm z:1];

	MenuItemImage *vh = [MenuItemImage itemFromNormalImage:@"b_human.png" selectedImage:@"b_human_s.png" target:self selector:@selector(startMulti:)];	
	Menu *vhm = [Menu menuWithItems: vh, nil];
	vhm.position = cpv(141, 137);
	[self addChild:vhm z:1];

	/*
	MenuItemImage *cn = [MenuItemImage itemFromNormalImage:@"controls.png" selectedImage:@"controls_s.png" target:self selector:@selector(controls:)];	
	Menu *cnm = [Menu menuWithItems: cn, nil];
	cnm.position = cpv(330, 55);
	[self addChild:cnm z:1];
	 */
	
	MenuItemImage *lg = [MenuItemImage itemFromNormalImage:@"b_league.png" selectedImage:@"b_league_s.png" target:self selector:@selector(league:)];	
	Menu *lgm = [Menu menuWithItems: lg, nil];
	lgm.position = cpv(343, 71);
	[self addChild:lgm z:1];
	
	return self;
}



- (void)layerReplaced
{
}



-(void) startSingle: (id) sender
{	
	[delegate startSinglePlayer];
}



-(void) startMulti: (id) sender
{	
	[delegate startMultiPlayer];
}



-(void) league: (id) sender
{	
	[delegate league];
}


@end
