#if swift(>=4.0)
@objcMembers public class AuthUserAPI: NSObject {
    static let kEventAuthUserEvent = "com.auth.ern.api.event.authUserEvent"

    public lazy var events: AuthUserAPIEvents = {
        AuthUserEvents()
    }()

    public lazy var requests: AuthUserAPIRequests = {
        AuthUserRequests()
    }()
}

@objcMembers public class AuthUserAPIEvents: NSObject {
    public func addAuthUserEventEventListener(eventListener _: @escaping ElectrodeBridgeEventListener) -> UUID? {
        assertionFailure("should override")
        return UUID()
    }

    public func removeAuthUserEventEventListener(uuid _: UUID) -> ElectrodeBridgeEventListener? {
        assertionFailure("should override")
        return nil
    }

    public func emitEventAuthUserEvent(eventData _: AuthUserEventData) {
        assertionFailure("should override")
    }
}

@objcMembers public class AuthUserAPIRequests: NSObject {
}

#else

public class AuthUserAPI: NSObject {
    static let kEventAuthUserEvent = "com.auth.ern.api.event.authUserEvent"

    public lazy var events: AuthUserAPIEvents = {
        AuthUserEvents()
    }()

    public lazy var requests: AuthUserAPIRequests = {
        AuthUserRequests()
    }()
}

public class AuthUserAPIEvents: NSObject {
    public func addAuthUserEventEventListener(eventListener _: @escaping ElectrodeBridgeEventListener) -> UUID? {
        assertionFailure("should override")
        return UUID()
    }

    public func removeAuthUserEventEventListener(uuid _: UUID) -> ElectrodeBridgeEventListener? {
        assertionFailure("should override")
        return nil
    }

    public func emitEventAuthUserEvent(eventData _: AuthUserEventData) {
        assertionFailure("should override")
    }
}

public class AuthUserAPIRequests: NSObject {
}
#endif
