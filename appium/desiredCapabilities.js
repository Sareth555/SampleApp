exports.options = {
    capabilities: {
        platformName: 'iOS',
        app: '/Users/sareth/Documents/sampleApp/ios/build/sampleApp/Build/Products/Debug-iphonesimulator/sampleApp.app',
        // app: '/Users/sareth/Documents/Clik/ClikProject/ConsumerApp/ios/build/ConsumerApp/Build/Products/Debug-iphonesimulator/Debug-Consumer.app',
        deviceName: 'iPhone X',
        udid: 'EAAD30DA-E6C3-452D-B6E0-D8279FBB3E84',
        automationName: "XCUITest",
        platformVersion: "12.2",
    },
    maxInstances: 10,
    host: 'localhost',
    port: 4723
}