#import "State.h"


@implementation State

- (id) init {
	[super init];
	settings = [[NSUserDefaults standardUserDefaults] retain];;
	return self;
}



- (void) dealloc {
	[settings release];
	[super dealloc];
}



- (NSString*) name {
	return [settings stringForKey: @"name"];
}

- (void) setName: (NSString*)name {
	[settings setObject:name forKey:@"name"];
	[settings synchronize];	
}

@end
