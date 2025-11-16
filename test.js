const { Builder, By } = require("selenium-webdriver");

async function testAddition() {
    let driver = await new Builder().forBrowser("chrome").build();

    try {
        // Load your HTML file (use correct path!)
        await driver.get("file:///C:/COLLEGE/SEM-V/DEVOPS%20LAB/programs/week-11/index.html");

        // Enter values
        await driver.findElement(By.id("num1")).sendKeys("10");
        await driver.findElement(By.id("num2")).sendKeys("20");

        // Click add button
        await driver.findElement(By.id("addBtn")).click();

        // Read the output
        let result = await driver.findElement(By.id("output")).getText();

        console.log("Result from UI:", result);

        // Validate result
        if (result === "30") {
            console.log("Test Passed ✔");
        } else {
            console.log("Test Failed ✖");
        }

    } finally {
        await driver.quit();
    }
}

testAddition();
