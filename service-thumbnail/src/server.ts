import express from 'express'
import { Router, Request, Response } from 'express'
import puppeteer from 'puppeteer'
import cors from 'cors'

const app = express()
const route = Router()

app.use(express.json())
app.use(cors())

type NameParam = {
  name: string
}

route.get('/character-thumbnail/:name', async (req: Request<NameParam>, res: Response) => {
  const browser = await puppeteer.launch()
  const page = await browser.newPage()
  const searchParam = req.params.name.toLowerCase().replace(' ', '-')

  await page.goto(`https://www.starwars.com/databank/${searchParam}`, {
    timeout: 0,
    waitUntil: 'networkidle2'
  })
  const characterThumbnail = await page.evaluate(() => {
    return {
      thumbnail: document.querySelector('.image-wrapper img')?.getAttribute('src')
    }
  })

  await browser.close()
  res.send(characterThumbnail)
})


app.use(route)


app.listen(3333)