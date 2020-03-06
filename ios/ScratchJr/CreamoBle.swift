//
//  CreamoBle.swift
//  ScratchJr
//
//  Created by Yazz on 2020/03/04.
//  Copyright © 2020 Playful Invention Company. All rights reserved.
//

import Foundation
import CoreBluetooth



@objc class CreamoBle : NSObject, CBCentralManagerDelegate
    {


    
    var centralManager: CBCentralManager!
    var peripheral: CBPeripheral?
    var dataCharacteristic: CBCharacteristic?

    override init() {
    super.init()
    centralManager = CBCentralManager(delegate: self, queue: nil)
      }
    
    @objc func test()
    {
        
        print("te")
        
    }
    
    
    /*
     
     블루투스 스캔
     개발 : 안재용
     e-mail : sk8yabsab@gmail.com
     날짜 : 2020년03월06일
     */
    
    
    @objc func ble()
    {
        print("-----------------scan started-----------------")
       centralManager = CBCentralManager(delegate: self, queue: .main)
         
        
    }

    
    
    func centralManagerDidUpdateState(_ central: CBCentralManager)
    {
         
    }
}
