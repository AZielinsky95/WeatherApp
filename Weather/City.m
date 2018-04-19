//
//  City.m
//  Weather
//
//  Created by Alejandro Zielinsky on 2018-04-18.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "City.h"

@implementation City

-(instancetype)initWithName:(NSString*)name andTime:(NSString*)time andTemp:(int)temp andChanceOfPrecipitation:(float)chance
{
    self = [super init];
    if (self)
    {
        self.name = name;
        self.currentTime = time;
        self.temperature = temp;
        self.chanceOfPrecipitation = chance;
    }
    return self;
}
@end

