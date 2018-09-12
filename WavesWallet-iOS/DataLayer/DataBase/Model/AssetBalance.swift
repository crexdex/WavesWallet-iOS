import Foundation
import Gloss
import Realm
import RealmSwift
import RxDataSources

//TODO: Need remove Gloss.Decodable and IdentifiableType
final class AssetBalance:
    Object,
    IdentifiableType,
    Gloss.Decodable {

    typealias Identity = String

    @available(*, deprecated, message: "need remove")
    @objc dynamic var quantity: Int64 = 0
    @available(*, deprecated, message: "need remove")
    @objc dynamic var reissuable = false
    @available(*, deprecated, message: "need remove")
    @objc dynamic var issueTransaction: IssueTransaction?
    @available(*, deprecated, message: "need remove")
    @objc dynamic var isGeneral = false
    @available(*, deprecated, message: "need remove")
    @objc dynamic var isHidden = false

    @objc dynamic var modified: Date = Date()
    @objc dynamic var assetId = ""
    @objc dynamic var balance: Int64 = 0
    @objc dynamic var leasedBalance: Int64 = 0
    @objc dynamic var inOrderBalance: Int64 = 0
    @objc dynamic var settings: AssetBalanceSettings!
    @objc dynamic var asset: Asset!

    var identity: String {
        return assetId
    }

    override class func primaryKey() -> String? {
        return "assetId"
    }

    required init() {
        super.init()
    }

    @available(*, deprecated, message: "need remove")
    required init?(json: JSON) {
        guard let assetId: String = "assetId" <~~ json else {
            return nil
        }

        self.assetId = assetId
        self.balance = "balance" <~~ json ?? 0
        self.quantity = "quantity" <~~ json ?? 0
        self.reissuable = "reissuable" <~~ json ?? false
        self.issueTransaction = "issueTransaction" <~~ json

        super.init()
    }

    @available(*, deprecated, message: "need remove")
    func getDecimals() -> Int {
        return Int(self.issueTransaction?.decimals ?? 0)
    }

    /**
     WARNING: This is an internal initializer not intended for public use.
     :nodoc:
     */
    public required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }

    public required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
}

@available(*, deprecated, message: "need remove")
// equatable, this is needed to detect changes
func == (lhs: AssetBalance, rhs: AssetBalance) -> Bool {
    return lhs.assetId == rhs.assetId && lhs.balance == rhs.balance && lhs.isHidden == rhs.isHidden
}
