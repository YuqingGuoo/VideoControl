//
//  AdLightModel.m
//  AdLight
//
//  Created by kiwi on 10/26/13.
//  Copyright (c) 2013 kiwi. All rights reserved.
//

#import "AdLightModel.h"


@implementation AdLightModel

- (void) startLight:(int) num{
    //4盏灯顺次点亮_逆序熄灭_闪烁3次
    
    [self turnOnNum:1];
    
    [self playVideo: num];

    [self turnOffNum:1];
 
    
}

-(void)playVideo:(int) num{
    NSString *url = [NSString stringWithFormat:@"http://192.168.1.55:8080/PADControl/play/vedio%d",num];
    [self doIt:url timeInterval:15];
}

-(void)turnOnNum:(int) num{
    NSString *url = [NSString stringWithFormat:@"http://192.168.1.25/api?ac=123456&action=246&bank=1&relay=%d",num];
    [self doIt:url timeInterval:0];
 
}


-(void)turnOffNum:(int) num{
    NSString *url = [NSString stringWithFormat:@"http://192.168.1.25/api?ac=123456&action=245&bank=1&relay=%d",num];
    [self doIt:url timeInterval:0];
    
}

-(void)lightSet:(int) set{
    NSString *url = [NSString stringWithFormat:@"http://192.168.1.25/api?ac=123456&action=241&value=%d",set];
    [self doIt:url timeInterval:0];
   
}

-(void)doIt:(NSString*) urlString timeInterval:(NSTimeInterval) time{ //go to the url
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse *response;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    [NSThread sleepForTimeInterval:time];
}
- (void)delayMethod
{
    NSLog(@"execute");
}

@end
