//
//  BlueShiftInAppNotification.m
//  BlueShift-iOS-Extension-SDK
//
//  Created by shahas kp on 10/07/19.
//

#import "BlueShiftInAppNotification.h"
#import "BlueShiftInAppNotificationHelper.h"
#import "BlueShiftInAppNotificationConstant.h"

@implementation BlueShiftInAppNotificationButton

- (instancetype)initFromDictionary: (NSDictionary *) payloadDictionary withType: (BlueShiftInAppType)inAppType {
    if (self = [super init]) {
        
        @try {
            
            switch (inAppType) {
                case BlueShiftInAppTypeHTML:
                case BlueShiftInAppTypeModal:
                case BlueShiftNotificationSlideBanner:
                    if ([payloadDictionary objectForKey: kInAppNotificationModalTextKey]) {
                        self.text = (NSString *)[payloadDictionary objectForKey: kInAppNotificationModalTextKey];
                    }
                    if ([payloadDictionary objectForKey: kInAppNotiificationModalTextColorKey]) {
                        self.textColor = (NSString *)[payloadDictionary objectForKey: kInAppNotiificationModalTextColorKey];
                    }
                    if ([payloadDictionary objectForKey: kInAppNotificationModalBackgroundColorKey]) {
                        self.backgroundColor = (NSString *)[payloadDictionary objectForKey: kInAppNotificationModalBackgroundColorKey];
                    }
                    if ([payloadDictionary objectForKey: kInAppNotificationModalPageKey]) {
                        self.iosLink = (NSString *)[payloadDictionary objectForKey: kInAppNotificationModalPageKey];
                    }
                    if ([payloadDictionary objectForKey: kInAppNotificationModalSharableTextKey]) {
                        self.sharableText = (NSString *)[payloadDictionary objectForKey: kInAppNotificationModalSharableTextKey];
                    }
                    if ([payloadDictionary objectForKey: kInAppNotificationButtonTypeKey]) {
                        self.buttonType = (NSString *) [payloadDictionary objectForKey: kInAppNotificationButtonTypeKey];
                    }
                    if ([payloadDictionary objectForKey: kInAppNotificationModalButtonBackgroundRadiusKey]) {
                        self.backgroundRadius = (NSNumber *)[payloadDictionary objectForKey: kInAppNotificationModalButtonBackgroundRadiusKey];
                    }
                    
                    break;
                    
                default:
                    break;
            }
            
        } @catch (NSException *e) {
            
        }
    }
    return self;
}

- (NSDictionary *)convertObjectToDictionary:(BlueShiftInAppNotificationButton *)buttonDetails {
    NSMutableDictionary *buttonDictionary = [[NSMutableDictionary alloc] init];
    if (buttonDetails) {
        [buttonDictionary setValue: buttonDetails.text  forKey: kInAppNotificationModalTextKey];
        [buttonDictionary setValue: buttonDetails.textColor forKey: kInAppNotiificationModalTextColorKey];
        [buttonDictionary setValue: buttonDetails.backgroundColor forKey: kInAppNotificationModalBackgroundColorKey];
        [buttonDictionary setValue: buttonDetails.iosLink forKey: kInAppNotificationModalPageKey];
        [buttonDictionary setValue: buttonDetails.sharableText forKey: kInAppNotificationModalSharableTextKey];
        [buttonDictionary setValue: buttonDetails.buttonType forKey:kInAppNotificationButtonTypeKey];
    }
    
    return buttonDictionary;
}

@end

@implementation BlueShiftInAppNotificationContent

- (instancetype)initFromDictionary: (NSDictionary *) payloadDictionary withType: (BlueShiftInAppType)inAppType {
    if (self = [super init]) {
        
        @try {
        
            NSDictionary *contentDictionary = [payloadDictionary objectForKey: kInAppNotificationModalContentKey];
            
            switch (inAppType) {
                case BlueShiftInAppTypeHTML:
                    if ([contentDictionary objectForKey: kInAppNotificationModalHTMLKey]) {
                        self.content = (NSString*)[contentDictionary objectForKey: kInAppNotificationModalHTMLKey];
                    }
                    if ([contentDictionary objectForKey: kInAppNotificationModalURLKey]) {
                        self.url = (NSString*)[contentDictionary objectForKey: kInAppNotificationModalURLKey];
                    }
                    break;
                    
                case BlueShiftInAppTypeModal:
                case BlueShiftNotificationSlideBanner:
                    if ([contentDictionary objectForKey: kInAppNotificationModalTitleKey]) {
                        self.title = (NSString*)[contentDictionary objectForKey: kInAppNotificationModalTitleKey];
                    }
                    if ([contentDictionary objectForKey: kInAppNotificationModalSubTitleKey]) {
                        self.subTitle = (NSString*)[contentDictionary objectForKey: kInAppNotificationModalSubTitleKey];
                    }
                    if ([contentDictionary objectForKey: kInAppNotificationModalMessageKey]) {
                        self.message = (NSString*)[contentDictionary objectForKey: kInAppNotificationModalMessageKey];
                    }
                    if ([contentDictionary objectForKey: kInAppNotificationModalIconKey]) {
                        self.icon =(NSString *)[contentDictionary objectForKey: kInAppNotificationModalIconKey];
                    }

                    if ([contentDictionary objectForKey: kInAppNotificationActionButtonKey]) {
                        NSMutableArray<BlueShiftInAppNotificationButton *> *actions = [[NSMutableArray alloc] init];
                        for(NSDictionary* button in [contentDictionary objectForKey: kInAppNotificationActionButtonKey]){
                            [actions addObject:[[BlueShiftInAppNotificationButton alloc] initFromDictionary: button withType: inAppType]];
                        }
                        
                        self.actions = actions;
                    }
                    if ([contentDictionary objectForKey: kInAppNotificationModalBannerKey]) {
                        self.banner = (NSString *)[contentDictionary objectForKey: kInAppNotificationModalBannerKey];
                    }
                    if ([contentDictionary objectForKey: kInAppNotificationModalSecondaryIconKey]) {
                        self.secondarIcon = (NSString *)[contentDictionary objectForKey: kInAppNotificationModalSecondaryIconKey];
                    }

                    break;
                    
                default:
                    break;
            }
            
        } @catch (NSException *e) {
            
        }
    }
    return self;
}

@end

@implementation BlueShiftInAppLayoutMargin

- (instancetype)initFromDictionary: (NSDictionary *)marginDictionary {
    if (self = [super init]) {
        @try {
            if([marginDictionary objectForKey: kInAppNotificationModalLayoutMarginTopKey]){
                self.top = [[marginDictionary objectForKey: kInAppNotificationModalLayoutMarginTopKey] floatValue];
            }
            if ([marginDictionary objectForKey: kInAppNotificationModalLayoutMarginBottomKey]) {
                self.bottom = [[marginDictionary objectForKey: kInAppNotificationModalLayoutMarginBottomKey] floatValue];
            }
            if ([marginDictionary objectForKey: kInAppNotificationModalLayoutMarginLeftKey]) {
                self.left = [[marginDictionary objectForKey: kInAppNotificationModalLayoutMarginLeftKey] floatValue];
            }
            if ([marginDictionary objectForKey: kInAppNotificationModalLayoutMarginRightKey]) {
                self.right = [[marginDictionary objectForKey: kInAppNotificationModalLayoutMarginRightKey] floatValue];
            }
        } @catch (NSException *e) {
            
        }
    }
    
    return self;
}


@end


@implementation BlueShiftInAppNotificationLayout

- (instancetype)initFromDictionary: (NSDictionary *) payloadDictionary withType: (BlueShiftInAppType)inAppType {
    if (self = [super init]) {
        
        @try {
            
            NSDictionary *templateStyleDictionary = [payloadDictionary objectForKey: kInAppNotificationModalTemplateStyleKey];
            
            switch (inAppType) {
                case BlueShiftInAppTypeHTML:
                case BlueShiftInAppTypeModal:
                case BlueShiftNotificationSlideBanner:
                    if ([templateStyleDictionary objectForKey: kInAppNotificationModalBackgroundColorKey]) {
                        self.backgroundColor = (NSString *)[templateStyleDictionary objectForKey: kInAppNotificationModalBackgroundColorKey];
                    }
                    if ([templateStyleDictionary objectForKey: kInAppNotificationModalPositionKey]) {
                        self.position = (NSString *)[templateStyleDictionary objectForKey: kInAppNotificationModalPositionKey];
                    }
                    if ([templateStyleDictionary objectForKey: kInAppNotificationModalWidthKey]) {
                        self.width = [[templateStyleDictionary objectForKey: kInAppNotificationModalWidthKey]
                                     floatValue];
                    }
                    if ([templateStyleDictionary objectForKey: kInAppNotificationModalHeightKey]) {
                        self.height = [[templateStyleDictionary objectForKey: kInAppNotificationModalHeightKey] floatValue];
                    }
                    if ([templateStyleDictionary objectForKey: kInAppNotificationModalBackgroundActionKey]) {
                        self.enableBackgroundAction = [[templateStyleDictionary objectForKey: kInAppNotificationModalBackgroundActionKey] boolValue];
                    }
                    if ([templateStyleDictionary objectForKey: kInAppNotificationModalLayoutMarginKey]) {
                        NSDictionary *marginDictionary = [templateStyleDictionary objectForKey: kInAppNotificationModalLayoutMarginKey];
                        self.margin = [[BlueShiftInAppLayoutMargin alloc] initFromDictionary :marginDictionary];
                    }
                    
                    break;
                    
                default:
                    break;
            }
            
        } @catch (NSException *e) {
            
        }
    }
    return self;
}

@end

@implementation BlueShiftInAppNotificationContentStyle

- (instancetype)initFromDictionary: (NSDictionary *) payloadDictionary withType: (BlueShiftInAppType)inAppType {
    if (self = [super init]) {
        
        @try {
            
            NSDictionary *contenStyletDictionary = [payloadDictionary objectForKey: kInAppNotificationModalContentStyleKey];
    
            switch (inAppType) {
                case BlueShiftInAppTypeHTML:
                case BlueShiftInAppTypeModal:
                case BlueShiftNotificationSlideBanner:
                    if ([contenStyletDictionary objectForKey: kInAppNotificationModalTitleColorKey]) {
                        self.titleColor = (NSString *)[contenStyletDictionary objectForKey: kInAppNotificationModalTitleColorKey];
                    }
                    if ([contenStyletDictionary objectForKey: kInAppNotificationModalTitleBackgroundColorKey]) {
                         self.titleBackgroundColor = (NSString *)[contenStyletDictionary objectForKey: kInAppNotificationModalTitleBackgroundColorKey];
                    }
                    if ([contenStyletDictionary objectForKey: kInAppNotificationModalTitleGravityKey]) {
                        self.titleGravity = (NSString *)[contenStyletDictionary objectForKey: kInAppNotificationModalTitleGravityKey];
                    }
                    if ([contenStyletDictionary objectForKey: kInAppNotificationModalTitleSizeKey]) {
                        self.titleSize = (NSNumber *)[contenStyletDictionary objectForKey: kInAppNotificationModalTitleSizeKey];
                    }
                    if ([contenStyletDictionary objectForKey: kInAppNotificationModalMessageColorKey]) {
                        self.messageColor = (NSString *)[contenStyletDictionary objectForKey: kInAppNotificationModalMessageColorKey];
                    }
                    if ([contenStyletDictionary objectForKey: kInAppNotificationModalMessageAlignKey]) {
                        self.messageAlign = (NSString *)[contenStyletDictionary objectForKey: kInAppNotificationModalMessageAlignKey];
                    }
                    if ([contenStyletDictionary objectForKey: kInAppNotificationModalMessageBackgroundColorKey]) {
                        self.messageBackgroundColor = (NSString *)[contenStyletDictionary objectForKey: kInAppNotificationModalMessageBackgroundColorKey];
                    }
                    if ([contenStyletDictionary objectForKey: kInAppNotificationModalMessageGravityKey]) {
                        self.messageGravity = (NSString *)[contenStyletDictionary objectForKey: kInAppNotificationModalMessageGravityKey];
                    }
                    if ([contenStyletDictionary objectForKey: kInAppNotificationModalMessageSizeKey]) {
                        self.messageSize = (NSNumber *)[contenStyletDictionary objectForKey: kInAppNotificationModalMessageSizeKey];
                    }
                    if ([contenStyletDictionary objectForKey:kInAppNotificationModalIconSizeKey]) {
                        self.iconSize = (NSNumber *)[contenStyletDictionary objectForKey: kInAppNotificationModalIconSizeKey];
                    }
                    if ([contenStyletDictionary objectForKey: kInAppNotificationModalIconColorKey]) {
                        self.iconColor = (NSString *)[contenStyletDictionary objectForKey: kInAppNotificationModalIconColorKey];
                    }
                    if ([contenStyletDictionary objectForKey: kInAppNotificationModalIconBackgroundColorKey]) {
                        self.iconBackgroundColor = (NSString *)[contenStyletDictionary objectForKey: kInAppNotificationModalIconBackgroundColorKey];
                    }
                    if ([contenStyletDictionary objectForKey: kInAppNotificationModalIconBackgroundRadiusKey]){
                        self.iconBackgroundRadius = (NSNumber *)[contenStyletDictionary objectForKey: kInAppNotificationModalIconBackgroundRadiusKey];
                    }
                    if ([contenStyletDictionary objectForKey: kInAppNotificationModalActionsOrientationKey]) {
                        self.actionsOrientation =(NSNumber *)[contenStyletDictionary objectForKey: kInAppNotificationModalActionsOrientationKey];
                    }
                    if ([contenStyletDictionary objectForKey:kInAppNotificationModalSecondaryIconSizeKey]) {
                        self.secondaryIconSize = (NSNumber *)[contenStyletDictionary objectForKey: kInAppNotificationModalSecondaryIconSizeKey];
                    }
                    if ([contenStyletDictionary objectForKey: kInAppNotificationModalSecondaryIconColorKey]) {
                        self.secondaryIconColor = (NSString *)[contenStyletDictionary objectForKey: kInAppNotificationModalSecondaryIconColorKey];
                    }
                    if ([contenStyletDictionary objectForKey:kInAppNotificationModalSecondaryIconBackgroundColorKey]) {
                        self.secondaryIconBackgroundColor = (NSString *)[contenStyletDictionary objectForKey:kInAppNotificationModalSecondaryIconBackgroundColorKey];
                    }
                    if ([contenStyletDictionary objectForKey: kInAppNotificationModalSecondaryIconRadiusKey]) {
                        self.secondaryIconBackgroundRadius = (NSNumber *)[contenStyletDictionary objectForKey:kInAppNotificationModalSecondaryIconRadiusKey];
                    }
                    if ([contenStyletDictionary objectForKey: kInAppNotificationModalActionsPaddingKey]) {
                        NSDictionary *marginDictionary = [contenStyletDictionary objectForKey: kInAppNotificationModalActionsPaddingKey];
                        self.actionsPadding = [[BlueShiftInAppLayoutMargin alloc] initFromDictionary :marginDictionary];
                    }
                    
                    break;
                    
                default:
                    break;
            }
            
        } @catch (NSException *e) {
            
        }
    }
    return self;
}

@end

@implementation BlueShiftInAppNotification

- (instancetype)initFromEntity: (InAppNotificationEntity *) appEntity {
    
    if (self = [super init]) {
        @try {
            self.inAppType = [BlueShiftInAppNotificationHelper inAppTypeFromString: appEntity.type];
            
            self.objectID = appEntity.objectID;
            
            NSDictionary *dictionary = [NSKeyedUnarchiver unarchiveObjectWithData:appEntity.payload];
            if ([dictionary objectForKey: kInAppNotificationDataKey]) {
                self.notificationPayload = dictionary;
                NSDictionary *inAppDictionary = [dictionary objectForKey: kInAppNotificationDataKey];
    
                if ([inAppDictionary objectForKey: kInAppNotificationKey]) {
                    NSDictionary *payloadDictionary = [[NSDictionary alloc] init];
                    payloadDictionary = [inAppDictionary objectForKey:@"inapp"];
                
                    self.notificationContent = [[BlueShiftInAppNotificationContent alloc] initFromDictionary: payloadDictionary withType: self.inAppType];
                
                    self.contentStyle = [[BlueShiftInAppNotificationContentStyle alloc] initFromDictionary: payloadDictionary withType: self.inAppType];
                
                    self.templateStyle = [[BlueShiftInAppNotificationLayout alloc] initFromDictionary:payloadDictionary withType: self.inAppType];
                    
                    self.showCloseButton = YES;
                    self.position = kInAppNotificationModalPositionCenterKey;
                    self.dimensionType = kInAppNotificationModalResolutionPercntageKey;
                    self.width = 100;
                    self.height = 100;
                
                }
            }
        } @catch (NSException *e) {
            
        }
    }
    return self;
}

@end