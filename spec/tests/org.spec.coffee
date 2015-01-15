describe 'mocky mock app', ->
  beforeEach ->
    browser.get '/'
  describe 'button text', ->
    button = element By.id('importantbutton')
    buttonText = element By.binding('sometext')

    it 'should change on click', ->
      console.log 'first test'
      text = buttonText.getText()
      expect(text).toEqual 'click here'
      button.click()
      text = buttonText.getText()
      expect(text).toEqual 'hooray you clicked!'
      button.click()
      text = buttonText.getText()
      expect(text).toEqual 'click here'

  describe 'organizations list', ->
    orgsList = element.all By.repeater("(key, org) in orgs")
    orgName = element.all By.binding "org.name"

    it 'should be four itmes long', ->
      expect(orgsList.count()).toBe 4



