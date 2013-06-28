#include "PSStackedViewDelegate.h"

@interface WelcomeViewController : UIViewController <PSStackedViewDelegate>

@property(nonatomic, strong) IBOutlet UILabel *indexNumberLabel;
@property(nonatomic, assign) NSUInteger indexNumber;

@end
