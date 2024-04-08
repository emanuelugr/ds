import requests
from bs4 import BeautifulSoup
from scraper_strategy import ScraperStrategy

class BeautifulSoupScraper(ScraperStrategy):
    def scrape(self, url):
        response = requests.get(url)

        if response.status_code == 200:
            soup = BeautifulSoup(response.text, 'html.parser')
            
            data = {
                'Estrategia de Scraping': 'BeautifulSoup',
                'Previous Close': soup.find('td', {'data-test': 'PREV_CLOSE-value'}).text,
                'Open': soup.find('td', {'data-test': 'OPEN-value'}).text,
                'Volume': soup.find('td', {'data-test': 'TD_VOLUME-value'}).text,
                'Market Cap': soup.find('td', {'data-test': 'MARKET_CAP-value'}).text
            }

            if data:
                return data
            else:
                return 'Open Value not found'
        else:
            return f'Failed to retrieve the webpage, status code: {response.status_code}'
