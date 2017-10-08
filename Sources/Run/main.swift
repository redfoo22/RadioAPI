import App
import MySQLProvider
let config = try Config()
try config.addProvider(MySQLProvider.Provider.self)
try config.setup()
let drop = try Droplet(config)
try drop.setup()
drop.get("version") {
    request in let db = try drop.mysql()
    let version = try
        db.raw("SELECT version()")
    return JSON(node: version)
}
try drop.run()
