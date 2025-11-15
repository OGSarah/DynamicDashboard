//
//  HealthManager.swift
//  DynamicDashboard
//
//  Created by Sarah Clark on 11/14/25.
//

import Combine
import HealthKit

@Observable
class HealthManager {
    private let healthStore = HKHealthStore()
    var steps: Int = 0
    var calories: Double = 0

    init() {
        requestAuthorization()
    }

    func requestAuthorization() {
        guard let stepsType = HKObjectType.quantityType(forIdentifier: .stepCount) else { return }

        healthStore.requestAuthorization(toShare: [], read: [stepsType]) { success, _ in
            if success { self.fetchTodaySteps() }
        }
    }

    func fetchTodaySteps() {
        guard let stepsType = HKObjectType.quantityType(forIdentifier: .stepCount) else { return }

        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now)

        let query = HKStatisticsQuery(quantityType: stepsType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, _ in
            guard let result = result, let sum = result.sumQuantity() else { return }
            DispatchQueue.main.async {
                self.steps = Int(sum.doubleValue(for: HKUnit.count()))
            }
        }
        healthStore.execute(query)
    }

}
