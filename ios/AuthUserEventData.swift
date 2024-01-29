#if swift(>=4.0)
@objcMembers public class AuthUserEventData: ElectrodeObject, Bridgeable {
    private static let tag = String(describing: type(of: self))

    /**
     Token to detect user is authorized
     */
    public let token: String
    public let userInfo: UserInfoData

    public init(token: String, userInfo: UserInfoData) {
        self.token = token
        self.userInfo = userInfo
        super.init()
    }

    public override init() {
        self.token = String()
        self.userInfo = UserInfoData()
        super.init()
    }

    public required init(dictionary: [AnyHashable: Any]) {
        if let token = dictionary["token"] as? String {
            self.token = token
        } else {
            assertionFailure("\(AuthUserEventData.tag) missing one or more required properties [token]")
            self.token = dictionary["token"] as! String
        }
        if let userInfoDict = dictionary["userInfo"] as? [AnyHashable: Any] {
            self.userInfo = UserInfoData(dictionary: userInfoDict)
        } else {
            assertionFailure("\(AuthUserEventData.tag) missing one or more required properties [userInfo]")
            userInfo = dictionary["userInfo"] as! UserInfoData
        }


        super.init(dictionary: dictionary)
    }

    public func toDictionary() -> NSDictionary {
        var dict = [:] as [AnyHashable: Any]

        dict["token"] = self.token
        dict["userInfo"] = self.userInfo.toDictionary()

        return dict as NSDictionary
    }
}

#else

public class AuthUserEventData: ElectrodeObject, Bridgeable {
    private static let tag = String(describing: type(of: self))

    /**
     Token to detect user is authorized
     */
    public let token: String
    public let userInfo: UserInfoData

    public init(token: String, userInfo: UserInfoData) {
        self.token = token
        self.userInfo = userInfo
        super.init()
    }

    public override init() {
        self.token = String()
        self.userInfo = UserInfoData()
        super.init()
    }

    public required init(dictionary: [AnyHashable: Any]) {
        if let token = dictionary["token"] as? String {
            self.token = token
        } else {
            assertionFailure("\(AuthUserEventData.tag) missing one or more required properties [token]")
            self.token = dictionary["token"] as! String
        }
        if let userInfoDict = dictionary["userInfo"] as? [AnyHashable: Any] {
            self.userInfo = UserInfoData(dictionary: userInfoDict)
        } else {
            assertionFailure("\(AuthUserEventData.tag) missing one or more required properties [userInfo]")
            self.userInfo = dictionary["userInfo"] as! UserInfoData
        }


        super.init(dictionary: dictionary)
    }

    public func toDictionary() -> NSDictionary {
        var dict = [:] as [AnyHashable: Any]

        dict["token"] = self.token
        dict["userInfo"] = self.userInfo.toDictionary()

        return dict as NSDictionary
    }
}
#endif
