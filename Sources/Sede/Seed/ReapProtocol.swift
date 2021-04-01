//
// Created by 和泉田 領一 on 2021/03/20.
//

import Foundation
import SwiftUI
import Combine

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public protocol ReapProtocol {
    associatedtype Value

    var observing: [EnvironmentalObservableObjectProtocol] { get }

    func initialize(environment: EnvironmentValues) -> Value

    func update(value: Value, environment: EnvironmentValues) -> Value

    func reap(environment: EnvironmentValues) -> AnyReap<Value>
}

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension ReapProtocol {
    var observing: [EnvironmentalObservableObjectProtocol] { [] }
}

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension ReapProtocol {
    func map<NewValue>(_ keyPath: KeyPath<Value, NewValue>) -> MappedReap<Value, NewValue> {
        MappedReap(self, keyPath: keyPath)
    }

    func map<NewValue>(_ f: @escaping (Value, EnvironmentValues) -> NewValue) -> MappedReap<Value, NewValue> {
        MappedReap(self, map: f)
    }
}

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension ReapProtocol {
    func update(value: Value, environment: EnvironmentValues) -> Value {
        initialize(environment: environment)
    }

    func reap(environment: EnvironmentValues) -> AnyReap<Value> {
        AnyReap(self, environment: environment)
    }
}
