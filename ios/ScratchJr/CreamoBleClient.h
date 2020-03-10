//
//  CreamoBleClient.h
//  ScratchJr
//
//  Created by Yazz on 2020/03/06.
//  Copyright © 2020 Playful Invention Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>



@interface CreamoBleClient : NSObject <CBCentralManagerDelegate, CBPeripheralDelegate, CBCentralManagerDelegate>
{
    
    
}

+(CreamoBleClient *)bleSingletone;
+(void)centralManagerDidUpdateState:(CBCentralManager *)central;

+(void)beginScanningForDevice;
+(void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)aPeripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI;
+(void)centralManager:(CBCentralManager *)central
didConnectPeripheral:(CBPeripheral *)peripheral;


+(void)sendCodeToBTDevice:(NSString *)code
            characteristic:(CBCharacteristic *)characteristic ;
+(void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error;


- (void)centralManagerDidUpdateState:(CBCentralManager *)central;
@property(nonatomic, retain) CBCentralManager *CbCentralManager;
@property(nonatomic, retain) CBPeripheral *discoveredPeripheral;
@property(nonatomic, retain) NSDictionary *data;
@property(nonatomic, retain) NSString *deviceName;
@property(nonatomic, retain) CBCharacteristic *Charater;
@property(nonatomic, retain) NSError *error;
@property(nonatomic, retain) NSString *stringError;





@end
