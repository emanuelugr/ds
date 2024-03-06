from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException
from scraper_strategy import ScraperStrategy

class SeleniumScraper(ScraperStrategy):
    def scrape(self, url):
        options = webdriver.FirefoxOptions()
        options.headless = True

        # Iniciamos el navegador Firefox
        driver = webdriver.Firefox(options=options)
        
        # Navegamos a la URL
        driver.get(url)
        
        # Manejamos el popup haciendo clic en el botón "Rechazar todo"
        # Para ello maximizamos la pantalla para que sea accesible dicho botón
        try:
            driver.maximize_window()
            rechazar_button = driver.find_element("xpath", "/html/body/div/div/div/div/form/div[2]/div[2]/button[2]")
            rechazar_button.click()
        except NoSuchElementException:
            print("No se encontró el botón 'Rechazar todo'")

        # Extraemos los datos después de manejar el popup
        data = {
            'Estrategia de Scraping': 'Selenium',
            'Previous Close': driver.find_element("xpath", "//td[@data-test='PREV_CLOSE-value']").text,
            'Open': driver.find_element("xpath", "//td[@data-test='OPEN-value']").text,
            'Volume': driver.find_element("xpath", "//td[@data-test='TD_VOLUME-value']").text,
            'Market Cap': driver.find_element("xpath", "//td[@data-test='MARKET_CAP-value']").text
        }
        
        # Cerramos el navegador
        driver.quit()
        
        return data