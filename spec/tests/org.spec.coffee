describe 'mocky mock app', ->
  beforeEach ->
    browser.driver.get 'http://localhost:3300/'
    browser.driver.wait ->
      browser.driver.isElementPresent By.id("importantbutton")
    , 1200
    expect(browser.driver.getCurrentUrl()).toMatch("/");
  describe 'button text', ->
    beforeEach ->
      @button = element By.id('importantbutton')
      @buttonText = element By.binding('sometext')
    it 'should change on click', ->
      text = @buttonText.getText()
      expect(text).toEqual 'click here'
      @button.click()
      text = @buttonText.getText()
      expect(text).toEqual 'hooray you clicked!'
      @button.click()
      text = @buttonText.getText()
      expect(text).toEqual 'click here'

  describe 'organizations list', ->
    beforeEach ->
      @orgsList = element.all By.repeater("(key, org) in orgs")

    it 'should be four items long', ->
      expect(@orgsList.count()).toBe 4



