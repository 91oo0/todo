import SwiftyUserDefaults

extension DefaultsKeys {
    var isFirstLaunch: DefaultsKey<Bool> { .init("HogeTest", defaultValue: true) }
}

//var isFirstLaunch = Defaults[\.isFirstLaunch]
