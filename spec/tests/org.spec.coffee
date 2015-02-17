describe 'mocky mock app', ->
  describe 'button text', ->
    beforeEach ->
      browser.get '/'
      @button = element By.id('importantbutton')
      @buttonText = element By.binding('sometext')

    it 'should change on click', ->
      browser.get '/'
      text = @buttonText.getText()
      expect(text).toEqual 'click here'
      @button.click()
      text = @buttonText.getText()
      expect(text).toEqual 'hooray you clicked!'
      @button.click()
      text = @buttonText.getText()
      expect(text).toEqual 'click here'

  # xdescribe 'organizations list', ->
  #   beforeEach ->
  #     browser.get '/'
  #     @orgsList = element.all By.repeater("(key, org) in orgs")

  #   it 'should be four items long', ->
  #     expect(@orgsList.count()).toBe 4



