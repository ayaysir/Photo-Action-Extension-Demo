//
//  NSObject+NSItemProvider_Utils.m
//  Photo Action Extension Demo
//
//  Created by 윤범태 on 5/1/24.
//

#import "NSItemProvider+Utils.h"

@implementation NSItemProvider (Utils)

- (void)loadImageForTypeIdentifier:(NSString *)typeIdentifier options:(NSDictionary *)options completionHandler:(NSItemProviderCompletionHandlerForImage)completionHandler {
    [self loadItemForTypeIdentifier:typeIdentifier
                            options:options
                  completionHandler:completionHandler];
}

@end
