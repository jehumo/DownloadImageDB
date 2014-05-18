#import "Photo.h"


@interface Photo ()

// Private interface goes here.

@end


@implementation Photo

+(instancetype) photoWithName:(NSString *) aName
                    imageData:(NSData *) anImageData
                      context:(NSManagedObjectContext *) aContext {
    
    Photo * newPhoto = [NSEntityDescription insertNewObjectForEntityForName:[Photo entityName]
                                                              inManagedObjectContext:aContext];
    
    
    newPhoto.name = aName;
    newPhoto.creationDate = [NSDate date];
    newPhoto.imageData = anImageData;
    return newPhoto;
}

@end
