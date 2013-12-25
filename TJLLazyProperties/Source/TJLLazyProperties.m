//
//  TJLLazyProperties.m
//  TJLLazyProperties
//
//  Created by Terry Lewis II on 12/24/13.
//  Copyright (c) 2013 Terry Lewis. All rights reserved.
//

#import "TJLLazyProperties.h"
#import <objc/runtime.h>
@implementation TJLLazyProperties
+ (void)load {
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList(self, &count);
    
    for(unsigned int i = 0; i < count; i++) {
        const char *charName = property_getName(properties[i]);
        NSString *stringName = [NSString stringWithUTF8String:charName];
        NSString *type = getPropertyType(properties[i]);
        
        char *underscore = "_";
        char *concat = malloc(strlen(charName) + strlen(underscore) + 1);
        strcpy(concat, underscore);
        strcat(concat, charName);

        SEL sel = NSSelectorFromString(stringName);
        Ivar ivar = class_getInstanceVariable(self, concat);
        free(concat);
        
        IMP imp = imp_implementationWithBlock(^id(id self) {
            id object = object_getIvar(self, ivar);
            if(!object) {
                Class class = NSClassFromString(type);
                object = [[class alloc]init];
            }
            return object;
        });
        
        Method method = class_getInstanceMethod(self, sel);
        method_setImplementation(method, imp);
    }
    
    free(properties);
}

static NSString *getPropertyType(objc_property_t property) {
    const char *attributes = property_getAttributes(property);
    
    char buffer[1 + strlen(attributes)];
    strcpy(buffer, attributes);
    char *state = buffer, *attribute;
    while ((attribute = strsep(&state, ",")) != NULL) {
        if (attribute[0] == 'T' && attribute[1] != '@') {
            // it's a C primitive type:
            /*
             if you want a list of what will be returned for these primitives, search online for
             "objective-c" "Property Attribute Description Examples"
             apple docs list plenty of examples of what you get for int "i", long "l", unsigned "I", struct, etc.
             */
            NSString *name = [[NSString alloc] initWithBytes:attribute + 1 length:strlen(attribute) - 1 encoding:NSASCIIStringEncoding];
            return name;
        }
        else if (attribute[0] == 'T' && attribute[1] == '@' && strlen(attribute) == 2) {
            // it's an ObjC id type:
            return @"id";
        }
        else if (attribute[0] == 'T' && attribute[1] == '@') {
            // it's another ObjC object type:
            NSString *name = [[NSString alloc] initWithBytes:attribute + 3 length:strlen(attribute) - 4 encoding:NSASCIIStringEncoding];
            return name;
        }
    }
    return @"";
}

@end
