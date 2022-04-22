import UIKit

var greeting = "Hello, playground"

enum EngineCondition: String {
    case launched = "Двигатель заведен"
    case switchedOff = "Двигатель выключен"
    case broken = "Двигатель сломан"
}

enum WindowsCondition: String {
    case opened = "Окна открыты"
    case closed = "Окна закрыты"
}

class Car {
    let defaultTrunkVolume: Int
    let carModel: String
    let productionYear: Int
    var windowsCondition: WindowsCondition
    var engineCondition: EngineCondition
    var filledTrunkVolume: Int
    var carMileage: Int

    init(carModel: String, productionYear: Int, defaultTrunkVolume: Int, filledTrunkVolume: Int, carMileage: Int, windowsCondition: WindowsCondition, engineCondition: EngineCondition) {
        self.windowsCondition = windowsCondition
        self.engineCondition = engineCondition
        self.defaultTrunkVolume = defaultTrunkVolume
        self.filledTrunkVolume = filledTrunkVolume
        self.productionYear = productionYear
        self.carModel = carModel
        self.carMileage = carMileage
    }
    
    func openWindows() {
        self.windowsCondition = .opened
        print(windowsCondition.rawValue)
    }

    func closeWindows() {
        self.windowsCondition = .closed
        print(windowsCondition.rawValue)
    }

    func launchEngine() {
        self.engineCondition = .launched
        print(engineCondition.rawValue)
    }

    func switchOffEngine() {
        self.engineCondition = .switchedOff
        print(engineCondition.rawValue)
    }

    func loadIntoTrunk(volumeOfLoadingCargo: Int) {
        var freeTrunkVolume = defaultTrunkVolume - filledTrunkVolume
        if freeTrunkVolume >= volumeOfLoadingCargo {
            self.filledTrunkVolume = filledTrunkVolume + volumeOfLoadingCargo
            print("Готово, теперь в багажнике \(filledTrunkVolume) литра")
        } else {
            var needVolume = filledTrunkVolume + volumeOfLoadingCargo - defaultTrunkVolume
            print("В багажнике недостаточно места для этого груза! Чтобы уместилось все, освободи \(needVolume) литра")
        }
    }

    func unloadFromTrunk(volumeOfUnloadingCargo: Int) {
        if filledTrunkVolume >= volumeOfUnloadingCargo {
            self.filledTrunkVolume = filledTrunkVolume - volumeOfUnloadingCargo
            print("Готово, теперь в багажнике \(filledTrunkVolume) литра")
        } else {
           print("В багажнике не так много груза... Ты сможешь выгрузить не более \(filledTrunkVolume) литра")
        }
    }

}

enum Design: String {
    case redWithGreen = "Красно-зеленый дизайн"
    case blackWithWhite = "Черно-белый дизайн"
    case orangeWithStars = "Оранжевый дизайн со зведочками"
    case blueWithDots = "Синий дизайн в горошек"
}

class SportCar: Car {
    var racesCount: Int
    var designType: Design
    
    init(carModel: String, productionYear: Int, defaultTrunkVolume: Int, filledTrunkVolume: Int, carMileage: Int, windowsCondition: WindowsCondition, engineCondition: EngineCondition, racesCount: Int, designType: Design) {
        self.racesCount = racesCount
        self.designType = designType
        super.init(carModel: carModel, productionYear: productionYear, defaultTrunkVolume: defaultTrunkVolume, filledTrunkVolume: filledTrunkVolume, carMileage: carMileage, windowsCondition: windowsCondition, engineCondition: engineCondition)
    }
    
    func goStreetRacing(duratationInMinutes: Int) {
        if duratationInMinutes > 30 || carMileage > 10000 {
            self.engineCondition = .broken
            print("О нет, двигатель сломался!")
        } else {
            self.carMileage += 1000
            self.racesCount += 1
            print("Отличная гонка! Будь внимателен: пробег равен уже \(carMileage) километров")
        }
    }
    
    override func launchEngine() {
        switch engineCondition {
        case .launched, .switchedOff:
            self.engineCondition = .launched
            print(engineCondition.rawValue)
        case .broken:
            print("Не получится: двигатель сломан!")
        }
    }
    
    func randomCarDesign() {
        var randomNumber = Int.random(in: 0..<4)
        switch randomNumber {
        case 0:
            self.designType = .blackWithWhite
        case 1:
            self.designType = .blueWithDots
        case 2:
            self.designType = .orangeWithStars
        case 3:
            self.designType = .redWithGreen
        default:
            print("Что-то пошло не так!")
        }
        print("Сменили дизайн твоей машины на: \(self.designType.rawValue)")
    }
}

enum CargoType: String {
    case rawMaterial = "Сырье"
    case food = "Продукты питания"
    case furniture = "Мебель"
}

class TrunkCar: Car {
    var passengersCount: Int
    var cargoType: CargoType
    
    init(carModel: String, productionYear: Int, defaultTrunkVolume: Int, filledTrunkVolume: Int, carMileage: Int, windowsCondition: WindowsCondition, engineCondition: EngineCondition, passengersCount: Int, cargoType: CargoType) {
        self.passengersCount = passengersCount
        self.cargoType = cargoType
        super.init(carModel: carModel, productionYear: productionYear, defaultTrunkVolume: defaultTrunkVolume, filledTrunkVolume: filledTrunkVolume, carMileage: carMileage, windowsCondition: windowsCondition, engineCondition: engineCondition)
    }
    
    func technicalInspection() {
        if self.engineCondition == .broken {
            self.engineCondition = .switchedOff
            print("Двигатель был сломан, но его починили. Будьте аккуратнее!")
        } else {
            print("Машина в отличном состоянии!")
        }
    }
    
   override func openWindows() {
       switch cargoType {
       case .food:
           print("Из-за большого перепада температуры еда может испортиться! Нельзя открывать окна!")
       case .furniture, .rawMaterial:
           self.windowsCondition = .opened
           print(windowsCondition.rawValue)
       }
   }
}

var bmw = SportCar(carModel: "BMW", productionYear: 1992, defaultTrunkVolume: 40, filledTrunkVolume: 30, carMileage: 233, windowsCondition: .closed, engineCondition: .switchedOff, racesCount: 3, designType: .blackWithWhite)

bmw.randomCarDesign()
bmw.goStreetRacing(duratationInMinutes: 90)
bmw.launchEngine()

var volvo = TrunkCar(carModel: "VOLVO", productionYear: 2012, defaultTrunkVolume: 400, filledTrunkVolume: 4, carMileage: 2000, windowsCondition: .closed, engineCondition: .switchedOff, passengersCount: 3, cargoType: .food)

volvo.openWindows()
volvo.technicalInspection()
volvo.switchOffEngine()
