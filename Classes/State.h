#import <Foundation/Foundation.h>


@interface State : NSObject {
	NSUserDefaults *settings;
}

- (NSString*) name;
- (void) setName: (NSString*)name;

@end
