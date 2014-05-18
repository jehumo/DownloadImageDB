#import "_Photo.h"

@interface Photo : _Photo {}

+(instancetype) photoWithName:(NSString *) aName
                      imageData:(NSData *) anImageData
                     context:(NSManagedObjectContext *) aContext;

@end
