//
//  NSObject+NSItemProvider_Utils.h
//  Photo Action Extension Demo
//
//  Created by 윤범태 on 5/1/24.
//

@import UIKit;

@interface NSItemProvider (Utils)

typedef void (^NSItemProviderCompletionHandlerForImage)(UIImage *image, NSError *error);


- (void)loadImageForTypeIdentifier:(NSString *)typeIdentifier
                         options:(NSDictionary *)options
               completionHandler:(NSItemProviderCompletionHandlerForImage)completionHandler;

@end
