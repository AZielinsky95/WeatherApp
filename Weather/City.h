//
//  City.h
//  Weather
//
//  Created by Alejandro Zielinsky on 2018-04-18.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property (nonatomic) int temperature;

@property (nonatomic) NSString* currentTime;

@property (nonatomic) NSString* name;

@property (nonatomic) float chanceOfPrecipitation;


-(instancetype)initWithName:(NSString*)name andTime:(NSString*)time andTemp:(int)temp andChanceOfPrecipitation:(float)chance;
@end
