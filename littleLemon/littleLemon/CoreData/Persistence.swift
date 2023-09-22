import CoreData
import Foundation

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "ExampleDatabase")
//        container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        container.loadPersistentStores(completionHandler: {_,_ in })
//        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
//    func clear() {
//        // Delete all dishes from the store
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "DishEntity")
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//        let _ = try? container.persistentStoreCoordinator.execute(deleteRequest, with: container.viewContext)
//        try? container.viewContext.save()
//    }
    
    func clear(offsets: IndexSet, context: NSManagedObjectContext) {
        
    }
}
