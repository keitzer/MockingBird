public protocol Mockable {
    var mb: MockingBird { get set }

    func stub(function: String, whenCalledWith parameters: Any..., return value: Any?)
    func value<T>(forFunction function: String, whenCalledWith parameters: Any...) -> T?
    func invocations(forFunction function: String, with parameters: Any...) -> Int
    func invoked(function: String, with parameters: Any...) -> Bool
    func record(function: String, wasCalledWith parameters: Any...)
    func interactions(withFunction function: String) -> String
}

public extension Mockable {

    /// Sets a return value for a stubbed function call.
    ///
    /// - parameter function:       The name of the stubbed function.
    /// - parameter whenCalledWith: Zero or more parameters of the stubbed function call.
    /// - parameter return:         The value to return when the stubbed function is called.  The default is `nil`.
    func stub(function: String, whenCalledWith parameters: Any..., return value: Any? = nil) {
        mb.stub(function: function, whenCalledWith: parameters, return: value)
    }

    /// The value that has been specified for the stubbed function.
    ///
    /// - parameter forFunction:            The name of the stubbed function.
    /// - parameter whenCalledWith: Zero or more parameters of the stubbed function call.
    ///
    /// - returns: The previously specified value (via `stub`) for the function call or `nil` if none was specified.
    func value<T>(forFunction function: String, whenCalledWith parameters: Any...) -> T? {
        return mb.value(forFunction: function, whenCalledWith: parameters)
    }

    /// The number of invocations for the function with the parameters specified.
    ///
    /// - parameter forFunction: The name of the invoked function.
    /// - parameter with:        Zero or more parameters of the invoked function.
    ///
    /// - returns: The number of invocations of the function with the parameters specified.
    func invocations(forFunction function: String, with parameters: Any...) -> Int {
        return mb.invocations(forFunction: function, with: parameters)
    }

    /// Was the function was invoked with the given parameters?
    ///
    /// - parameter function: The name of the invoked function.
    /// - parameter with:     Zero or more parameters of the invoked function.
    ///
    /// - returns: `true` if the number of invocations is one or more.
    func invoked(function: String, with parameters: Any...) -> Bool {
        return mb.invoked(function: function, with: parameters)
    }

    /// Records that a function was invoked with the given parameters.
    ///
    /// - parameter function:      The name of the invoked function.
    /// - parameter wasCalledWith: Zero or more parameters of the invoked function.
    func record(function: String, wasCalledWith parameters: Any...) {
        mb.record(function: function, wasCalledWith: parameters)
    }

    /// A description of interactions with the mocked function.
    ///
    /// - parameter withFunction: The name of the mocked function.
    ///
    /// - returns: A description of interactions.
    func interactions(withFunction function: String) -> String {
        return mb.interactions(withFunction: function)
    }
}