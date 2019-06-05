const wd = require("wd");
const expect = require('chai').expect;
const config = require('./desiredCapabilities').options;
let driver = wd.promiseChainRemote({
    host: config.host,
    port: config.port
});
describe('Sample App', () => {
    before(async () => {
        await driver.sleep(30000);
        return await driver.init(config.capabilities);
    });
    // before(async () => {
    //     await driver.sleep(600000);
    //     it("resolvingPromise", (done) => {
    //         resolvingPromise.then((result) => {
    //             return driver.init().then(done);
    //         }).then(done, done);
    //     })
    // });
    describe("Click confirm button", () => {
        // it('resolves', (done) => {
        //     resolvingPromise.then((result) => {
        //         driver.sleep(10000);
        //     }).then(done, done);
        // });

        // it('resolves', (done) => {
        //     resolvingPromise.then((result) => {
        //         let clickTextField = driver.elementByAccessibilityId('confirm');
        //          clickTextField.click();
        //          driver.sleep(2000);
        //     }).then(done, done);
        // });
        // it('resolves', (done) => {
        //     resolvingPromise.then((result) => {
        //         let commitOKFirstScreen =  driver.elementByAccessibilityId('OK', 'OK');
        //          commitOKFirstScreen.click();
        //          driver.sleep(3000);
        //     }).then(done, done);
        // });

        it("Waiting time", async () => {
            await driver.sleep(10000);
        })
        it("Clicked on sign in button", async () => {
            let clickTextField = await driver.elementByAccessibilityId('confirm', 'confirm');
            await clickTextField.click();
            await driver.sleep(10000);
        })
        it("Click Confirm", async () => {
            let commitOKFirstScreen = driver.elementByAccessibilityId('OK', 'OK');
            commitOKFirstScreen.click();
            driver.sleep(3000);
        })
    });

    after(async () => {
        // return await driver.quit();
        console.log("Quitting")
    })
});
