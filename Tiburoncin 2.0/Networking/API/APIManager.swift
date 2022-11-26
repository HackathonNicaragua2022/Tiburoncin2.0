//
//  APIManager.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/22/22.
//

import UIKit
import SwiftSDK

final class APIManager {
    
    // MARK: - Stored Properties
    static let shared = APIManager()
    let backendless = Backendless.shared
    private let serverUrl = "https://api.backendless.com"
    private let appId = "RDVGQTI4RUQtOEMzNS0xOTE1LUZGOTktODlDNDJCOEFGRTAw"
    private let apiKey = "ODA5MjFFOTItN0I2OS00MEEwLTlDNUMtMzlFQTUxQzcxOTA4"
    
    // MARK: - Initializers
    private init() {
        backendless.hostUrl = serverUrl
        backendless.initApp(applicationId: appId.decode() ?? "", apiKey: apiKey.decode() ?? "")
    }
}

// MARK: - Public Methods
extension APIManager {
    func isValidUserToken(isValid: @escaping BoolClosure,
                          fault: @escaping FaultClosure) {
        backendless.userService.isValidUserToken(responseHandler: isValid,
                                                 errorHandler: fault)
    }
    
    func registerUser(user: BackendlessUser,
                      success: @escaping UserClosure,
                      fault: @escaping FaultClosure) {
        backendless.userService.registerUser(user: user,
                                             responseHandler: success,
                                             errorHandler: fault)
    }
    
    func login(email: String,
               password: String,
               success: @escaping UserClosure,
               fault: @escaping FaultClosure) {
        backendless.userService.stayLoggedIn = true
        backendless.userService.login(identity: email,
                                      password: password,
                                      responseHandler: success,
                                      errorHandler: fault)
    }
    
    func logoutUser(success: @escaping SimpleClosure,
                    fault: @escaping FaultClosure) {
        backendless.userService.logout(responseHandler: success,
                                       errorHandler: fault)
    }
    
    func getInfluentialClasses(success: @escaping InfluentialCollectionClosure,
                               fault: @escaping FaultClosure) {
        let response = { (values: [Dictionary]) -> Void in
            do {
                let influentials: [Influential] = try Builder(dictionary: values)
                success(influentials)
            } catch {
                fault(Fault(message: "Failed to obtain influential classes"))
            }
        }
        
        let dataStore = backendless.data.ofTable("Influential")
        let queryBuilder = DataQueryBuilder()
        queryBuilder.relationsDepth = 5
        queryBuilder.pageSize = 100
        queryBuilder.relationsPageSize = 100
        
        dataStore.find(queryBuilder: queryBuilder,
                       responseHandler: response,
                       errorHandler: fault)
    }
    
    func getAllClasses(success: @escaping ClassCollectionClosure,
                       fault: @escaping FaultClosure) {
        let response = { (values: [Dictionary]) -> Void in
            do {
                let classes: [Class] = try Builder(dictionary: values)
                success(classes)
            } catch {
                fault(Fault(message: "Failed to obtain all classes"))
            }
        }
        
        let dataStore = backendless.data.ofTable("Class")
        let queryBuilder = DataQueryBuilder()
        queryBuilder.relationsDepth = 5
        queryBuilder.pageSize = 100
        queryBuilder.relationsPageSize = 100
        queryBuilder.whereClause = "isInfluential != TRUE"
        
        dataStore.find(queryBuilder: queryBuilder,
                       responseHandler: response,
                       errorHandler: fault)
    }
    
    func findAllClasses(with name: String,
                        success: @escaping ClassCollectionClosure,
                        fault: @escaping FaultClosure) {
        let response = { (values: [Dictionary]) -> Void in
            do {
                let classes: [Class] = try Builder(dictionary: values)
                success(classes)
            } catch {
                fault(Fault(message: "Failed to obtain all classes with name: \(name)"))
            }
        }
        
        let dataStore = backendless.data.ofTable("Class")
        let queryBuilder = DataQueryBuilder()
        queryBuilder.relationsDepth = 5
        queryBuilder.pageSize = 100
        queryBuilder.relationsPageSize = 100
        queryBuilder.whereClause = !name.isEmpty ? "className like '\(name)%'" : "className = ''"
        
        dataStore.find(queryBuilder: queryBuilder,
                       responseHandler: response,
                       errorHandler: fault)
    }
    
    func findTeacher(with name: String,
                     success: @escaping TeacherClosure,
                     fault: @escaping FaultClosure) {
        let response = { (value: Dictionary) -> Void in
            do {
                let teacher: [Teacher] = try Builder(dictionary: [value])
                guard let firstItem = teacher.first else { return }
                success(firstItem)
            } catch {
                fault(Fault(message: "Error trying to parse teacher data"))
            }
        }
        
        let dataStore = backendless.data.ofTable("Teacher")
        let queryBuilder = DataQueryBuilder()
        queryBuilder.relationsDepth = 5
        queryBuilder.pageSize = 100
        queryBuilder.relationsPageSize = 100
        queryBuilder.whereClause = "name = '\(name)'"
        
        dataStore.findFirst(queryBuilder: queryBuilder,
                            responseHandler: response,
                            errorHandler: fault)
    }
    
    func createNewClass(with videoId: String,
                        and className: String,
                        success: @escaping AnyClosure,
                        fault: @escaping FaultClosure) {
        findTeacher(with: backendless.userService.currentUser?.name ?? "", success: { teacher in
            let classImage = "https://img.youtube.com/vi/\(videoId)/0.jpg"
            let classModel = Class()
            classModel.className = className
            classModel.classImage = classImage
            classModel.videoId = videoId
            
            let dataStore = self.backendless.data.of(Class.self)
            dataStore.save(entity: classModel,
                           responseHandler: { response in
                guard let parsedResponse = response as? Dictionary else { return }
                let classModel = Class()
                classModel.objectId = parsedResponse["objectId"] as? String
                self.update(classModel: classModel,
                            with: teacher)
                self.update(teacher: teacher,
                            with: classModel)
                success(response)
            },
                           errorHandler: fault)
        }, fault: { fault in
            print(fault.message ?? "")
        })
        
    }
    
    func update(classModel: Class,
                with teacher: Teacher) {
        let dataStore = backendless.data.of(Class.self)
        dataStore.setRelation(columnName: "teacher",
                              parentObjectId: classModel.objectId ?? "",
                              childrenObjectIds: [teacher.objectId ?? ""],
                              responseHandler: { _ in
            print("Class successfully updated")
        }, errorHandler: { fault in
            print("Failed - \(fault.message ?? "")")
        })
    }
    
    func update(teacher: Teacher,
                with classModel: Class) {
        let dataStore = backendless.data.of(Teacher.self)
        dataStore.addRelation(columnName: "classes",
                              parentObjectId: teacher.objectId ?? "",
                              childrenObjectIds: [classModel.objectId ?? ""],
                              responseHandler: { _ in
            print("Teacher successfully updated")
        }, errorHandler: { fault in
            print("Failed - \(fault.message ?? "")")
        })
    }
    
    func getChats(success: @escaping UserCollectionClosure,
                  fault: @escaping FaultClosure) {
        let response = { (values: [Dictionary]) -> Void in
            do {
                let users: [BackendlessUser] = try Builder(dictionary: values)
                success(users)
            } catch {
                fault(Fault(message: "Error trying to parse data"))
            }
        }
        
        let queryBuilder = DataQueryBuilder()
        queryBuilder.relationsDepth = 5
        queryBuilder.relationsPageSize = 100
        queryBuilder.pageSize = 100
        queryBuilder.whereClause = "userIcon != NULL && name != '\(backendless.userService.currentUser?.name ?? "")'"
        
        let dataStore = backendless.data.ofTable("Users")
        dataStore.find(queryBuilder: queryBuilder,
                       responseHandler: response,
                       errorHandler: fault)
    }
}
