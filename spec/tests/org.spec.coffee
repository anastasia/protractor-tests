describe 'mocky mock app', ->
  describe 'button text', ->
    browser.get '/'
    button = element By.id('importantbutton')
    buttonText = element By.binding('sometext')

    it 'should change on click', ->
      browser.get '/'
      text = buttonText.getText()
      expect(text).toEqual 'click here'
      button.click()
      text = buttonText.getText()
      expect(text).toEqual 'hooray you clicked!'
      button.click()
      text = buttonText.getText()
      expect(text).toEqual 'click here'

  describe 'organizations list', ->
    browser.get '/'
    orgsList = element.all By.repeater("(key, org) in orgs")
    orgName = element.all By.binding "org.name"

    it 'should be four items long', ->
      expect(orgsList.count()).toBe 4



