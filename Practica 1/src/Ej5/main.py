import os
import json
from context import Context
from beautiful_soup_scraper import BeautifulSoupScraper
from selenium_scraper import SeleniumScraper

def save_to_json(data):
    folder_path = "./src/Ej5"
    if not os.path.exists(folder_path):
        os.makedirs(folder_path)

    file_path = os.path.join(folder_path, 'url_info.json')
    with open(file_path, 'w') as file:
        json.dump(data, file, indent=4)

def main():
    stock = input("\nIngrese el símbolo de la acción (por ejemplo, TSLA para Tesla): ")
    strategy_choice = input("Seleccione el método de scraping (1 para BeautifulSoup, 2 para Selenium): ")

    if strategy_choice == '1':
        scraper = BeautifulSoupScraper()
    elif strategy_choice == '2':
        scraper = SeleniumScraper()
    else:
        print("Opción no válida.")
        return

    url = f"https://finance.yahoo.com/quote/{stock}"
    context = Context(scraper)
    url_data = context.scrape_data(url)

    save_to_json(url_data)
    print("\nDatos guardados exitosamente en url_info.json")

if __name__ == "__main__":
    main()