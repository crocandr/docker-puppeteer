const puppeteer = require('puppeteer');


(async () => {
  const browser = await puppeteer.launch({
    executablePath: "/usr/bin/chromium-browser",
    headless: true,
    args: ['--no-sandbox', '--disable-setuid-sandbox'],
    ignoreHTTPSErrors: true,
    });

  const page = await browser.newPage();
  await page.setViewport({
      width: 1920,
      height: 1080,
      deviceScaleFactor: 1,
    });
  await page.goto('https://google.com');
  await page.screenshot({path: 'example.png'});

  await browser.close();
})();

