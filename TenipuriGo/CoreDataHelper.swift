//
//  CoreDataHelper.swift
//  TenipuriGo
//
//  Created by Mac on 5/31/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
import CoreData

func addAllTennisBoys() {
    
    createTennisBoy(name: "Momo", imageName: "momo")
    createTennisBoy(name: "Echizen", imageName: "echizen")
     createTennisBoy(name: "Sengoku", imageName: "sengoku")
     createTennisBoy(name: "Atobe", imageName: "atobe")
     createTennisBoy(name: "Davide", imageName: "davide")
    createTennisBoy(name: "Jiroh", imageName: "jiroh")
    createTennisBoy(name: "Kentaro", imageName: "kentaro")
    createTennisBoy(name: "Kamio", imageName: "kamio")
    createTennisBoy(name: "Akutsu", imageName: "akutsu")
    createTennisBoy(name: "Tezuka", imageName: "tezuka")
    
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
}

func createTennisBoy(name :String, imageName: String){
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let tennisBoy = TennisBoy(context: context)
    tennisBoy.name = name
    tennisBoy.imageName = imageName
}

func getAllTennisBoys() -> [TennisBoy] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    do {
    let tennisBoys = try context.fetch(TennisBoy.fetchRequest()) as! [TennisBoy]
        
        if tennisBoys.count == 0 {
            addAllTennisBoys()
            return getAllTennisBoys()
        }
        
        return tennisBoys
    } catch {}
    
    return []
}

func getAllCaughtTennisBoys() -> [TennisBoy] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    let fetchRequest = TennisBoy.fetchRequest() as NSFetchRequest<TennisBoy>
    fetchRequest.predicate = NSPredicate(format: "caught == %@", true as CVarArg)
    
    do{
        let tennisBoys = try context.fetch(fetchRequest) as [TennisBoy]
        return tennisBoys
    } catch {}
    
    
    return []
}

func getAllUncaughtTennisBoys() -> [TennisBoy]{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let fetchRequest = TennisBoy.fetchRequest() as NSFetchRequest<TennisBoy>
    fetchRequest.predicate = NSPredicate(format: "caught == %@", false as CVarArg)
    
    do{
        let tennisBoys = try context.fetch(fetchRequest) as [TennisBoy]
        return tennisBoys
    } catch {}
    
    
    return []
}


