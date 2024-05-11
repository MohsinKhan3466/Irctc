class SearchClass:

    def __init__(self, driver):
        self.driver = driver

    def set_source_element(self, destination):
        self.driver.find_element_by_xpath("//input[@class='ng-tns-c57-9 ui-inputtext ui-widget ui-state-default ui-corner-all ui-autocomplete-input ng-star-inserted']").send_keys(destination)

    def set_destination_element(self, destination):
        self.driver.find_element_by_xpath("//input[@class='ng-tns-c57-8 ui-inputtext ui-widget ui-state-default ui-corner-all ui-autocomplete-input ng-star-inserted']").send_keys(destination)

    def set_date_element(self, date):
        self.driver.find_element_by_xpath("//input[@class='ng-tns-c58-10 ui-inputtext ui-widget ui-state-default ui-corner-all ng-star-inserted']").send_keys(date)

    def select_class(self, birth_class):
        self.driver.find_element_by_xpath("//div[@class='ng-tns-c65-11 ui-dropdown ui-widget ui-state-default ui-corner-all']").send_keys(birth_class)

    def click_search_element(self):
        self.driver.find_element_by_xpath("//button[@class='search_btn train_Search']").click()

    def search(self, source, destination, date, seat_class):
        self.set_source_element(source)
        self.set_destination_element(destination)
        self.set_date_element(date)
        self.select_class(seat_class)
        self.click_search_element()
