#include "PSStackedViewDelegate.h"

@interface ProfesorViewController : UIViewController <PSStackedViewDelegate>

@property(nonatomic, strong) IBOutlet UILabel *indexNumberLabel;
@property(nonatomic, assign) NSUInteger indexNumber;
@property(nonatomic, assign) NSUInteger indiceHorario;

@end
