#if swift(>=4.0)
@objcMembers public class AuthUserEvents: AuthUserAPIEvents {
    public override func addAuthUserEventEventListener(eventListener: @escaping ElectrodeBridgeEventListener) -> UUID? {
        let listenerProcessor = EventListenerProcessor(
            eventName: AuthUserAPI.kEventAuthUserEvent,
            eventPayloadClass: AuthUserEventData.self,
            eventListener: eventListener
        )

        return listenerProcessor.execute()
    }

    public override func removeAuthUserEventEventListener(uuid: UUID) -> ElectrodeBridgeEventListener? {
        return ElectrodeBridgeHolder.removeEventListener(uuid)
    }

    public override func emitEventAuthUserEvent(eventData: AuthUserEventData) {
        let eventProcessor = EventProcessor(
            eventName: AuthUserAPI.kEventAuthUserEvent,
            eventPayload: eventData
        )

        eventProcessor.execute()
    }
}

#else

public class AuthUserEvents: AuthUserAPIEvents {
    public override func addAuthUserEventEventListener(eventListener: @escaping ElectrodeBridgeEventListener) -> UUID? {
        let listenerProcessor = EventListenerProcessor(
            eventName: AuthUserAPI.kEventAuthUserEvent,
            eventPayloadClass: AuthUserEventData.self,
            eventListener: eventListener
        )

        return listenerProcessor.execute()
    }

    public override func removeAuthUserEventEventListener(uuid: UUID) -> ElectrodeBridgeEventListener? {
        return ElectrodeBridgeHolder.removeEventListener(uuid)
    }

    public override func emitEventAuthUserEvent(eventData: AuthUserEventData) {
        let eventProcessor = EventProcessor(
            eventName: AuthUserAPI.kEventAuthUserEvent,
            eventPayload: eventData
        )

        eventProcessor.execute()
    }
}
#endif
