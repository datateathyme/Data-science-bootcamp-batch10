import express from "express"
import fs from "fs"
import puppeteer from "puppeteer"

const app = express()
app.use(express.json())

const sleep = (ms) => new Promise((resolve) => setTimeout(resolve, ms))

const cookiePath = "./cookies.json"
const debug = true

const init = async (browser, page) => {
    page.setViewport({
        width: 1920,
        height: 1080,
        deviceScaleFactor: 1,
        isMobile: false
    })

    await page.exposeFunction("closeAndSaveCookies", async () => {
        console.log("Closing and saving cookies...")
        const cookies = await page.cookies()
        fs.writeFileSync("./cookies.json", JSON.stringify(cookies, null, 2))
        console.log("✅ Cookies saved successfully! Please restart the script.")
        await browser.close()
    })

    await page.evaluateOnNewDocument(() => {
        window.getElementByXpath = (path) => {
            return document.evaluate(path, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        }
    })
}

const generateMedia = async (prompt, resolution, type) => {
    const browser = await puppeteer.launch({ 
        headless: !debug,
        args: ['--no-sandbox', '--disable-setuid-sandbox'] 
    })
    const page = await browser.newPage()

    await init(browser, page)

    let hasCookies = false
    try {
        if (fs.existsSync(cookiePath)) {
            const cookies = fs.readFileSync(cookiePath)
            const scookies = JSON.parse(cookies)
            await page.setCookie(...scookies)
            hasCookies = true
            console.log("🍪 Cookies loaded.")
        } else {
            console.log("⚠️ No cookies.json found.")
        }
    } catch (err) {
        console.log("❌ Failed to load cookies:", err.message)
    }

    await page.goto("https://www.meta.ai")

    if (!hasCookies) {
        await page.waitForSelector("body")
        await page.evaluate(() => {
            const button = document.createElement("button")
            button.innerText = "Close and Save Cookies"
            button.id = "close-btn"
            button.style.position = "fixed"
            button.style.top = "10px"
            button.style.left = "10px"
            button.style.zIndex = 9999
            button.style.padding = "10px"
            button.style.background = "red"
            button.style.color = "white"
            button.style.fontSize = "16px"
            button.style.cursor = "pointer"
            document.body.appendChild(button)
            button.addEventListener("click", () => { window.closeAndSaveCookies() })
        })
        return "Please authorize cookies first manually in the opened browser window!"
    } else {
        console.log("🚀 Sending prompt to Meta AI...")
        await page.keyboard.type(prompt)
        await page.keyboard.press("Enter")

        // รอผลลัพธ์แรกเริ่มปรากฏ
        await sleep(5000)

        // จัดการเรื่อง Resolution (อัตราส่วนภาพ)
        if (resolution !== "1:1" && (resolution === "16:9" || resolution === "9:16")) {
            console.log(`📏 Adjusting resolution to ${resolution}...`)
            await page.evaluate((resolution) => {
                return new Promise((resolve) => {
                    const btn1 = window.getElementByXpath("/html/body/div[1]/div/div/div/div[2]/div[1]/div/div/div/div[1]/div[1]/div/div[2]/div[1]/div/div/div[2]/div[1]/div/div/div/div[2]/div[2]/div/div/div/div/div/div[2]/div/div[1]/div/div[2]/span/div")
                    if (btn1) btn1.click()
                    setTimeout(() => {
                        const btn2 = window.getElementByXpath(
                            resolution === "16:9"
                                ? "/html/body/div[1]/div/div/div/div[2]/div[1]/div/div/div/div[2]/div/div/div[1]/div[1]/div/div/div/div/div/div/div/div[1]/div[3]/div"
                                : "/html/body/div[1]/div/div/div/div[2]/div[1]/div/div/div/div[2]/div/div/div[1]/div[1]/div/div/div/div/div/div/div/div[1]/div[2]/div"
                        )
                        if (btn2) btn2.click()
                        setTimeout(() => {
                            const generate_btn = window.getElementByXpath("/html/body/div[1]/div/div/div/div[2]/div[1]/div/div/div/div[1]/div[1]/div/div[2]/div[1]/div/div/div[2]/div[1]/div/div/div/div[2]/div[2]/div/div/div/div/div/div[2]/div/div[2]/div")
                            if (generate_btn) generate_btn.click()
                            resolve()
                        }, 2000)
                    }, 2000)
                })
            }, resolution)
            await sleep(5000)
        }

        let loaded = false
        let mediaUrls = []
        console.log(`⌛ Generating ${type}... this may take a while.`)

        // --- แก้ไขช่วงดึง URL รูปภาพให้แม่นยำขึ้น ---
        while (!loaded) {
            const result = await page.evaluate((type) => {
                // ค้นหารูปภาพจาก Selector ที่กว้างขึ้น (หาจากภาพที่มีลิงก์ของ Facebook CDN ซึ่ง Meta AI ใช้เก็บรูป)
                const images = Array.from(document.querySelectorAll('img[src*="fbcdn.net"]'));
                let sources = [];

                if (images.length > 0) {
                    if (type !== "video") {
                        // เก็บ URL ของรูปภาพทั้งหมดที่เจอ
                        sources = images.map(i => i.src);
                    } else {
                        // กรณีวิดีโอ ให้หาปุ่ม Generate Animate โดยหาจากข้อความในปุ่ม
                        const genBtn = Array.from(document.querySelectorAll('div[role="button"]'))
                                            .find(b => b.innerText.includes('Animate') || b.innerText.includes('Generate'));
                        if (genBtn) genBtn.click();
                    }
                }

                return {
                    loaded: images.length > 0,
                    sources: sources
                };
            }, type);

            loaded = result.loaded;
            mediaUrls = result.sources;

            if (loaded && type !== "video") {
                console.log(`✅ Found ${mediaUrls.length} images!`);
                await sleep(2000); 
            } else if (loaded && type === "video") {
                // ถ้าเป็นวิดีโอ ให้หลุดลูปเพื่อไปรอโหลดวิดีโอในขั้นถัดไป
                break;
            } else {
                await sleep(2000);
            }
        }

        // กรณีเป็น Video ต้องรอตรวจจับแท็ก Video แทน
        if (type === "video") {
            console.log("📽️ Waiting for video to render...")
            mediaUrls = []
            let videoWaitStart = Date.now();
            while (mediaUrls.length === 0) {
                mediaUrls = await page.evaluate(() => {
                    const videoTags = Array.from(document.querySelectorAll('video source'));
                    return videoTags.map(s => s.src).filter(Boolean);
                })
                if (mediaUrls.length === 0) {
                    await sleep(3000);
                    // ป้องกันค้างตลอดกาล (Timeout 5 นาที)
                    if (Date.now() - videoWaitStart > 300000) break;
                }
            }
            console.log(`✅ Video ready!`);
        }

        const session_url = page.url()
        await browser.close()

        return {
            urls: mediaUrls,
            session_url: session_url
        }
    }
}

// === API Endpoint ===
app.post("/api/generate", async (req, res) => {
    const prompt = req.body.prompt ? "Imagine " + req.body.prompt : "Imagine สร้างรูปภาพน้องแมว"
    const resolution = req.body.resolution || "9:16"
    const type = req.body.type || "image"

    console.log(`\n--- New Request Received ---`)
    console.log(`Prompt: ${prompt}`)
    console.log(`Type: ${type} | Resolution: ${resolution}`)

    try {
        const result = await generateMedia(prompt, resolution, type)

        if (typeof result === 'string') {
            return res.status(401).json({
                success: false,
                message: result
            })
        }

        console.log("✅ Generation Successful!")
        res.json({
            success: true,
            media_urls: result.urls,
            session_url: result.session_url,
            time_sequence: Date.now()
        })

    } catch (err) {
        console.error("❌ API Error:", err.message)
        res.status(500).json({
            success: false,
            message: "Media generation failed",
            error: err.message
        })
    }
})

app.listen(6336, () => {
    console.log("------------------------------------------")
    console.log("Express API running on http://localhost:6336")
    console.log("Ready to receive requests from Postman/n8n")
    console.log("------------------------------------------")
})
