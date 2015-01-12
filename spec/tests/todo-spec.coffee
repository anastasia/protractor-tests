# describe 'stacker homepage', ->
  # it 'should do stuff', ->
    # browser.get 'http://localhost:3000'
    # browser.pause()


describe 'angularjs homepage todo list', ->
  it 'should add a todo', ->
    browser.get 'http://www.angularjs.org'
    console.log 'hello there'

    element(By.model('todoText')).sendKeys 'write a protractor test'
    element(By.css('[value="add"]')).click()
    todoList = element.all(By.repeater('todo in todos'))
    expect(todoList.count()).toEqual(3)
    expect(todoList.get(2).getText()).toEqual('write a protractor test')

describe 'angularjs homepage', ->
  firstNumber  = element By.model('first')
  secondNumber = element By.model('second')
  goButton     = element By.id('gobutton')
  latestResult = element By.binding('latest')
  history      = element.all By.repeater('result in memory')

  add = (a, b) ->
    console.log 'getting here?'
    firstNumber.sendKeys(a)
    secondNumber.sendKeys(b)
    goButton.click()

  beforeEach ->
    browser.get 'http://juliemr.github.io/protractor-demo/'

  afterEach ->
    browser.manage().logs().get('browser').then (browserLogs) ->
      expect(browserLogs.length).toEqual 0
      if browserLogs.length
        console.log 'browserLogs:' +JSON.stringify(browserLogs)


  it 'should have a history', ->
    add(1, 2)
    add(3, 4)

    expect(history.count()).toEqual 2

    # add 5, 6

    # expect(history.count()).toEqual 0
    # This is wrong!

