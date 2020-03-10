//
//  CreamoBleClient.m
//  ScratchJr
//
//  Created by Yazz on 2020/03/06.
//  Copyright © 2020 Playful Invention Company. All rights reserved.
//

#import "CreamoBleClient.h"
#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <UIKit/UIKit.h>




CBCentralManager *CbCentralManager;
NSString *deviceName;
CBPeripheral *discoveredPeripheral;
CBCharacteristic *Charater;

@implementation CreamoBleClient

//@synthesize CbCentralManager;


/*
  SingleTone,
  블루투스 스캔
  개발 : 안재용
  e-mail : sk8yabsab@gmail.com
  날짜 : 2020년03월06일
  */
 
//sharedinstance 
+(CreamoBleClient *) bleSingletone
{
    static CreamoBleClient *CreamoBle = nil;
    
    @synchronized (self)
    {
       if(CreamoBle == nil)
         
           CreamoBle = [[self alloc]init];
        
        NSLog(@"singletone test");
 
    }
  
    return CreamoBle;
}


- (id)init {
  if (self = [super init])
  
  {
      
  
  }
  return self;
}

- (void)dealloc
{
  // Should never be called, but just here for clarity really.
}

+(void)centralManagerDidUpdateState:(CBCentralManager *)central

{ //휴대폰의 블루투스가 켜져있을 경우.
    if(central.state == CBManagerStatePoweredOn)
    {
      //UUID
        [CbCentralManager scanForPeripheralsWithServices:nil options:nil];
        }
    else
        {
            NSLog(@"블루투스 스캔 OFF 상태");
        }
    }

//블루투스 connect

+(void)centralManager:(CBCentralManager *)central
didConnectPeripheral:(CBPeripheral *)peripheral
{
    NSLog(@"=======================================");
    NSLog(@"연결된 기기");
    deviceName = peripheral.name;
    NSLog(@"%@",deviceName);
}


- (void)sendCodeToBTDevice:(NSString *)code
            characteristic:(CBCharacteristic *)characteristic
{
    if(code != nil) {
        NSData *data = [code dataUsingEncoding:NSUTF8StringEncoding];
        [self.discoveredPeripheral writeValue:data forCharacteristic:characteristic type:CBCharacteristicWriteWithResponse];
    }
}


//블루투스 탐색 및 정보 가져오기
+(void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)aPeripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI 
{

      
    NSLog(@"Discovered %@ %@", aPeripheral, advertisementData);
    
    
    
    deviceName = aPeripheral.name;
    if([deviceName isEqualToString:@"HMSoft"])
    
    {
        NSLog(@"HMSoft");
        
    discoveredPeripheral = aPeripheral ;
    [CbCentralManager stopScan];
    [CbCentralManager connectPeripheral:discoveredPeripheral options:nil];

    }
}

//블루투스 탐색 시작
+(void)beginScanningForDevice
{
 // Create a Core Bluetooth Central Manager object
 
     [CbCentralManager scanForPeripheralsWithServices:nil options:nil];
        CbCentralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil options:nil];


}


//데이터 받기
+(void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error
{
    if (error)
    {
        NSLog(@"Error reading characteristics: %@", [error localizedDescription]); return;
    }
    
    if(characteristic.value !=nil)
    {
        
        
   NSLog(@"characteristic.value : %@" ,characteristic.value); //0x01(일반), 0x02(침수상태) 날라온다.
        NSLog(@"characteristic.value.description : %@" ,characteristic.value.description); NSString *peripheralSendSign = characteristic.value.description; if([peripheralSendSign containsString:@"0x02"]){ NSLog(@"침수상황 sos!!"); //긴급신고 화면 호출
           //주변기기가 던저 주는 데이터 종료 시키기 -
            
        }else if([peripheralSendSign containsString:@"0x01"]){ NSLog(@"연결상황");
            
        }
        
    }
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
      
    NSLog(@"centralManagerDidUpdateState");
}

@end





