//
//  utilities.swift
//  FoodJournal
//
//  Created by Ontiretse Motlagale on 2022/11/29.
//

import Foundation
import SwiftUI
import UIKit


struct JournalItem: Identifiable{
    var id: UUID = UUID()
    
    let decription:String
    let date:Date
    let imageName:UIImage
}


public class Utilities{
    static var journalEntries:[JournalItem] = []
    static var popCount:Int = 0
    
    
    /*
    static func getSavedLocalData(){
         //UserDefaults.standard.bool(forKey: "Key")
         //UserDefaults.standard.integer(forKey: "Key")
        /*
        guard UserDefaults.standard.object(forKey: "Key") as? [JournalItem] == nil else{
            
            adjustJournalEntries(UserDefaults.standard.object(forKey: "Key") as! [JournalItem])
            return
        }*/
        
        
        // Retrieve from UserDefaults
        if let data = UserDefaults.standard.object(forKey: "Key") as? [JournalItem],
           let category = try? JSONDecoder().decode(JournalItem.self, from: data) {
            journalEntries = category
        }
        
        var userDefaults = UserDefaults.standard
        let decoded  = userDefaults.data(forKey: "teams")
        let decodedTeams = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! [JournalItem]
    }
    
    
    static func setSavedLocalData(){
        //UserDefaults.standard.set(true, forKey: "Key") //Bool
        //UserDefaults.standard.set(1, forKey: "Key")  //Integer
        //UserDefaults.standard.set(journalEntries, forKey: "Key") //setObject
        
        // To store in UserDefaults
        if let encoded = try? JSONEncoder().encode(journalEntries) {
            UserDefaults.standard.set(encoded, forKey: "Key")
        }
        
        var userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: journalEntries)
        userDefaults.set(encodedData, forKey: "teams")
    }
    */
    
    
    static func adjustJournalEntries(_ entry:[JournalItem]){
        journalEntries = entry
    }
    
    
    func addEntry(_ entry: JournalItem) {
        Utilities.journalEntries.append(entry)
    }
    
    
    func popDemoEntries(_ amount:Int) {
        
        if Utilities.popCount > 0 {
            return
        }
        
        Utilities.popCount += 1
        
        var _newEntryList:[JournalItem] = []
        
        for i in 0...amount{
            let entry = JournalItem.init(decription: "Food description eodjeojfoeofjeofoejfojefoejfoejfojejfooejfooejfojeofejofjoejfjfeofjeof eodjeodjoedoejoejdoedjoejdoeekdokeodoek", date: .now + TimeInterval(i), imageName: UIImage(named: "placeholder_Image")!)
            
            _newEntryList.append(entry)
        }
        
        Utilities.adjustJournalEntries(_newEntryList)
        
        print("\(Utilities.journalEntries.count)")
    }
}
