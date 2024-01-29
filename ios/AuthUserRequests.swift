#if swift(>=4.0)
@objcMembers public class AuthUserRequests: AuthUserAPIRequests {
    public override func registerAuthUserRequestHandler(handler: @escaping ElectrodeBridgeRequestCompletionHandler) -> UUID? {
        let requestHandlerProcessor = ElectrodeRequestHandlerProcessor(requestName: AuthUserAPI.kRequestAuthUser,
                                                                       reqClass: AuthUser.self,
                                                                       respClass: None.self,
                                                                       requestCompletionHandler: handler)
        return requestHandlerProcessor.execute()
    }

    public override func unregisterAuthUserRequestHandler(uuid: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
        return ElectrodeBridgeHolder.unregisterRequestHandler(with: uuid)
    }

    public override func authUser(AuthInfo: AuthUser, responseCompletionHandler: @escaping (None?, ElectrodeFailureMessage?) -> Void) {
        let requestProcessor = ElectrodeRequestProcessor<AuthUser, None, Any>(
            requestName: AuthUserAPI.kRequestAuthUser,
            requestPayload: AuthInfo,
            respClass: None.self,
            responseItemType: nil,
            responseCompletionHandler: { data, errorMessage in responseCompletionHandler(data as? None, errorMessage) }
        )

        requestProcessor.execute()
    }
}

#else

public class AuthUserRequests: AuthUserAPIRequests {
    public override func registerAuthUserRequestHandler(handler: @escaping ElectrodeBridgeRequestCompletionHandler) -> UUID? {
        let requestHandlerProcessor = ElectrodeRequestHandlerProcessor(requestName: AuthUserAPI.kRequestAuthUser,
                                                                       reqClass: AuthUser.self,
                                                                       respClass: None.self,
                                                                       requestCompletionHandler: handler)
        return requestHandlerProcessor.execute()
    }

    public override func unregisterAuthUserRequestHandler(uuid: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
        return ElectrodeBridgeHolder.unregisterRequestHandler(with: uuid)
    }

    public override func authUser(AuthInfo: AuthUser, responseCompletionHandler: @escaping (None?, ElectrodeFailureMessage?) -> Void) {
        let requestProcessor = ElectrodeRequestProcessor<AuthUser, None, Any>(
            requestName: AuthUserAPI.kRequestAuthUser,
            requestPayload: AuthInfo,
            respClass: None.self,
            responseItemType: nil,
            responseCompletionHandler: { data, errorMessage in responseCompletionHandler(data as? None, errorMessage) }
        )

        requestProcessor.execute()
    }
}
#endif
