/*
 * Derived from RNBlurModal by Daniel Blakemore
 *
 * Created by Ryan Nystrom on 10/2/12.
 * Copyright (c) 2012 Ryan Nystrom. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

#import "UIView+Screenshot.h"

@implementation UIView (Screenshot)

+ (UIImage*)screenshotWholeWindow
{
    NSEnumerator* frontToBackWindows = [[[UIApplication sharedApplication] windows] reverseObjectEnumerator];
    for (UIWindow* window in frontToBackWindows) {
        if ([window windowLevel] == UIWindowLevelNormal) {
            NSLog(@"window frame: %@", NSStringFromCGRect([window bounds]));
            
            UIGraphicsBeginImageContextWithOptions(window.bounds.size, FALSE, 2);
            CGContextRef ctx = UIGraphicsGetCurrentContext();
            if (!ctx) {
                return nil;
            }
            [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:FALSE];
            UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            // This was in here for some reason.  Not sure why, but it was breaking things.  Gone now
//            NSData *imageData = UIImagePNGRepresentation(image);
//            image = [UIImage imageWithData:imageData];
            
            NSLog(@"Image   size: %@", NSStringFromCGSize([image size]));
            return image;
        }
    }
    return nil;
}

- (UIImage*)screenshot {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, FALSE, 2);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    if (!ctx) {
        return nil;
    }
    [self.layer renderInContext:ctx];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // This was in here for some reason.  Not sure why, but it was breaking things.  Gone now
//    NSData *imageData = UIImagePNGRepresentation(image);
//    image = [UIImage imageWithData:imageData];
    
    return image;
}

@end
