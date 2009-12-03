#import <Foundation/Foundation.h>

@protocol JSONLoaderDelegate

- (void) jsonLoaded:(NSString*)key dict:(NSDictionary*)dict;
- (void) jsonError:(NSString*)key error:(NSString*)error;

@end


@interface JSONLoader : NSObject {
	id<JSONLoaderDelegate> delegate;
	NSMutableDictionary *getData;
	NSMutableDictionary *getKeys;		
}

-(id) initWithDelegate:(id<JSONLoaderDelegate>) _delegate;
- (NSString *)urlencode:(NSString *)str;
- (void) loadAsync: (NSString*)key url:(NSString*) url;

@end
