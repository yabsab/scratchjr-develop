//
//  CreamoBleClient.m
//  ScratchJr
//
//  Created by Yazz on 2020/03/06.
//  Copyright © 2020 Playful Invention Company. All rights reserved.
//

#import "CreamoBleClient.h"
#import <CoreBluetooth/CoreBluetooth.h>
#import <UIKit/UIKit.h>

@implementation CreamoBleClient





-(void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData
{
    
    NSString *peripheralName = [peripheral name];
    NSLog(@"Found: %@", peripheralName);
    
    
}


@end
