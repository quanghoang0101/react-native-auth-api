#if swift(>=4.0)
@objcMembers public class AuthUserAPI: NSObject {
    static let kRequestAuthUser = "com.auth.ern.api.request.authUser"

    public lazy var requests: AuthUserAPIRequests = {
        AuthUserRequests()
    }()
}


@objcMembers public class AuthUserAPIRequests: NSObject {
    public func registerAuthUserRequestHandler(handler _: @escaping ElectrodeBridgeRequestCompletionHandler) -> UUID? {
        assertionFailure("should override")
        return UUID()
    }

    public func unregisterAuthUserRequestHandler(uuid _: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
        assertionFailure("should override")
        return nil
    }

    public func authUser(AuthInfo _: AuthUser, responseCompletionHandler _: @escaping (None?, ElectrodeFailureMessage?) -> Void) {
        assertionFailure("should override")
    }
}

#else

public class AuthUserAPI: NSObject {
    static let kRequestAuthUser = "com.auth.ern.api.request.authUser"

    public lazy var requests: AuthUserAPIRequests = {
        AuthUserRequests()
    }()
}


public class AuthUserAPIRequests: NSObject {
    public func registerAuthUserRequestHandler(handler _: @escaping ElectrodeBridgeRequestCompletionHandler) -> UUID? {
        assertionFailure("should override")
        return UUID()
    }

    public func unregisterAuthUserRequestHandler(uuid _: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
        assertionFailure("should override")
        return nil
    }

    public func authUser(AuthInfo _: AuthUser, responseCompletionHandler _: @escaping ElectrodeBridgeResponseCompletionHandler) {
        assertionFailure("should override")
    }
}
#endif
