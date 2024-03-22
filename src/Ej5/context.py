class Context:
    def __init__(self, strategy):
        self.strategy = strategy
    
    def set_strategy(self, strategy):
        self.strategy = strategy
    
    def scrape_data(self, url):
        return self.strategy.scrape(url)