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
  const cachedThumbnail = localStorage.getItem(`${searchParam}-thumbnail`)

  if (!cachedThumbnail) {
    await page.goto(`https://www.starwars.com/databank/${searchParam}`)
    const characterThumbnail = await page.evaluate(() => {
      return {
        thumbnail: document.querySelector('.thumb.reserved-ratio')?.getAttribute('src')
      }
    })

    await browser.close()
    localStorage.setItem(`${searchParam}-thumbnail`, characterThumbnail.thumbnail!)
    res.send(characterThumbnail)
  }

  await browser.close()

  res.send(cachedThumbnail)
})

app.use(route)


app.listen(3333)