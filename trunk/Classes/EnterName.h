#import "ReplaceLayerAction.h"

@protocol EnterNameDelegate

- (void) nameEntered: (NSString*)name;

@end

@interface EnterNameView : UIView<UITextFieldDelegate>{
	UITextField *nameField;
	id<EnterNameDelegate> delegate;
}

- (id) initWithDelegate: (id<EnterNameDelegate>)_delegate;

@end

@interface EnterName : Layer<ReplaceLayerActionDelegate, EnterNameDelegate> {
	id<EnterNameDelegate> delegate;
	UIWindow *window;
	EnterNameView *view;
}

- (id) initWithDelegate: (id<EnterNameDelegate>)_delegate window:(UIWindow*)_window;

@end


