//
//  IAPManager.swift
//  Arduino Pocket Guide
//
//  Created by Henry on 8/11/20.
//  Copyright © 2020 buildandteach.com. All rights reserved.
//

import Foundation
import StoreKit
import SwiftUI
class IAPManager: NSObject, ObservableObject  {
  static let shared = IAPManager()
   @Published var hasFailed = false
   @Published var isPurchased = false
   @Published var isRestored = false
//  @Published var hasFailed = false
    var products = [SKProduct]()
    let paymentQueue = SKPaymentQueue.default()
   
    func getProduct() //gets the product from server and puts on list
   {
    
    let products:Set = ["com.tavo.videoslcd"]
    
    let request = SKProductsRequest(productIdentifiers: products)
    request.delegate = self
    request.start()
    paymentQueue.add(self)
    }
    
    func purchase(product:String) //adds product to product queue (GETPRODUCT() REQUIRED)
    {
        guard let productToPurchase = products.filter({ $0.productIdentifier == product}).first
            else {return  print("nobody")}
        let payment = SKPayment(product: productToPurchase)
        
        paymentQueue.add(payment)
        print("here")
        
        
    }

    func restorePurchase(){
        print("restored purchases")
        paymentQueue.restoreCompletedTransactions()

    }
}

extension IAPManager: SKProductsRequestDelegate
{
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        self.products = response.products
        for products in response.products
        {
            print(products.localizedTitle)//prints title of inapp
            
            
        }
    }
}
extension IAPManager:SKPaymentTransactionObserver
{
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {//called everytime somethings added to transaction queue
       
        for transaction in transactions {
            print(transaction.transactionState.status(), transaction.payment.productIdentifier) //prints status and name(com.build....)
            
           
            switch transaction.transactionState {
            case .purchasing:break
            case.purchased:do {
               isPurchased = true
               UserDefaults.standard.set(true, forKey: "contentunlocked")
                queue.finishTransaction(transaction)
                }
            case .restored:do
            {
                UserDefaults.standard.set(true, forKey: "contentunlocked")
                isRestored = true
                queue.finishTransaction(transaction)
                }
            case .failed: do
            {
                hasFailed = true

                queue.finishTransaction(transaction)
            }
            default: queue.finishTransaction(transaction)
            }
            
        }
    }
}
extension SKPaymentTransactionState {//expanded version of transaction state(normally would print out "sktransactionstate" which is not helpfull)
    func status() -> String {
        switch self {
             case .deferred: return "deferred"
             case .failed:return"failed"
             case .purchased:return"purchased"
             case .purchasing:return"purchasing"
             case .restored:return"restored"
        @unknown default:
            fatalError()
        }
     
    }
}
