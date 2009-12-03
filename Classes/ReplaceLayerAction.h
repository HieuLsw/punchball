#import "cocos2d.h"
#import "chipmunk.h"


@protocol ReplaceLayerActionDelegate

- (void)layerReplaced;

@end



@interface ReplaceLayerAction : IntervalAction {
	Scene *scene;
	Layer<ReplaceLayerActionDelegate> *layer;
	Layer *replaceLayer;
	bool reverse;
}

@property (nonatomic) bool reverse;

-(id) initWithScene:(Scene*)_scene layer:(Layer<ReplaceLayerActionDelegate>*)_layer replaceLayer:(Layer*)_replaceLayer;

@end
