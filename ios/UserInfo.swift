#if swift(>=4.0)
@objcMembers public class UserInfo: ElectrodeObject, Bridgeable {
    private static let tag = String(describing: type(of: self))

    /**
     Name of User
     */
    public let username: String
    /**
     Number phone of user
     */
    public let phone: String

    public init(username: String, phone: String) {
        self.username = username
        self.phone = phone
        super.init()
    }

    public override init() {
        self.username = String()
        self.phone = String()
        super.init()
    }

    public required init(dictionary: [AnyHashable: Any]) {
        if let username = dictionary["username"] as? String {
            self.username = username
        } else {
            assertionFailure("\(UserInfo.tag) missing one or more required properties [username]")
            self.username = dictionary["username"] as! String
        }
        if let phone = dictionary["phone"] as? String {
            self.phone = phone
        } else {
            assertionFailure("\(UserInfo.tag) missing one or more required properties [phone]")
            self.phone = dictionary["phone"] as! String
        }


        super.init(dictionary: dictionary)
    }

    public func toDictionary() -> NSDictionary {
        var dict = [:] as [AnyHashable: Any]

        dict["username"] = self.username
        dict["phone"] = self.phone

        return dict as NSDictionary
    }
}

#else

public class UserInfo: ElectrodeObject, Bridgeable {
    private static let tag = String(describing: type(of: self))

    /**
     Name of User
     */
    public let username: String
    /**
     Number phone of user
     */
    public let phone: String

    public init(username: String, phone: String) {
        self.username = username
        self.phone = phone
        super.init()
    }

    public override init() {
        self.username = String()
        self.phone = String()
        super.init()
    }

    public required init(dictionary: [AnyHashable: Any]) {
        if let username = dictionary["username"] as? String {
            self.username = username
        } else {
            assertionFailure("\(UserInfo.tag) missing one or more required properties [username]")
            self.username = dictionary["username"] as! String
        }
        if let phone = dictionary["phone"] as? String {
            self.phone = phone
        } else {
            assertionFailure("\(UserInfo.tag) missing one or more required properties [phone]")
            self.phone = dictionary["phone"] as! String
        }


        super.init(dictionary: dictionary)
    }

    public func toDictionary() -> NSDictionary {
        var dict = [:] as [AnyHashable: Any]

        dict["username"] = self.username
        dict["phone"] = self.phone

        return dict as NSDictionary
    }
}
#endif
