import json
import os
import requests
from abc import ABC, abstractmethod
from bs4 import BeautifulSoup
from selenium import webdriver

class ScraperStrategy(ABC):
	@abstractmethod
	def scrape(self, stock):
		pass

class BeautifulSoupScraper(ScraperStrategy):
	def scrape(self, stock):
		url = f"https://finance.yahoo.com/quote/{stock}"
		response = requests.get(url)
		soup = BeautifulSoup(response.text, 'html.parser')

		data = {
        	'Previous Close': soup.find('td', {'data-test': 'PREV_CLOSE-value'}).text,
        	'Open': soup.find('td', {'data-test': 'OPEN-value'}).text,
        	'Volume': soup.find('td', {'data-test': 'TD_VOLUME-value'}).text,
        	'Market Cap': soup.find('td', {'data-test': 'MARKET_CAP-value'}).text
		}
        
		return data

class SeleniumScraper(ScraperStrategy):
	def scrape(self, stock):
		url = f"https://finance.yahoo.com/quote/{stock}"
		driver = webdriver.Chrome() # Necesitas tener instalado Chromedriver
		driver.get(url)
        
		data = {
        	'Previous Close': driver.find_element_by_xpath("//td[@data-test='PREV_CLOSE-value']").text,
        	'Open': driver.find_element_by_xpath("//td[@data-test='OPEN-value']").text,
        	'Volume': driver.find_element_by_xpath("//td[@data-test='TD_VOLUME-value']").text,
			'Market Cap': driver.find_element_by_xpath("//td[@data-test='MARKET_CAP-value']").text
		}
        
		driver.quit()
		return data

class ScraperContext:
	def __init__(self, strategy):
		self.strategy = strategy
    
	def set_strategy(self, strategy):
		self.strategy = strategy
    
	def scrape_data(self, stock):
		return self.strategy.scrape(stock)

def save_to_json(data):
	with open('stock_info.json', 'w') as file:
		json.dump(data, file, indent=4)

def main():
	stock = input("Ingrese el símbolo de la acción (por ejemplo, TSLA para Tesla): ")
	strategy_choice = input("Seleccione el método de scraping (1 para BeautifulSoup, 2 para Selenium): ")

	if strategy_choice == '1':
		scraper = BeautifulSoupScraper()
	elif strategy_choice == '2':
		scraper = SeleniumScraper()
	else:
		print("Opción no válida.")
		return

	scraper_context = ScraperContext(scraper)
	stock_data = scraper_context.scrape_data(stock)

	save_to_json(stock_data)
	print("Datos guardados exitosamente en stock_info.json")

if __name__ == "__main__":
	main()