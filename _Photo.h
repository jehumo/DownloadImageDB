// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Photo.h instead.

#import <CoreData/CoreData.h>


extern const struct PhotoAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *imageData;
	__unsafe_unretained NSString *name;
} PhotoAttributes;

extern const struct PhotoRelationships {
} PhotoRelationships;

extern const struct PhotoFetchedProperties {
} PhotoFetchedProperties;






@interface PhotoID : NSManagedObjectID {}
@end

@interface _Photo : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PhotoID*)objectID;





@property (nonatomic, strong) NSDate* creationDate;



//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* imageData;



//- (BOOL)validateImageData:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;






@end

@interface _Photo (CoreDataGeneratedAccessors)

@end

@interface _Photo (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;




- (NSData*)primitiveImageData;
- (void)setPrimitiveImageData:(NSData*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




@end
