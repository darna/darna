
LandingPage = {
  initiate: () ->
    setInterval(LandingPage.cycleThroughThings, 2000)

  cycleThroughThings: () ->
    thingsImage = ['Satellite', 'Submarine', 'Wallet', 'Meteor']
    $('.landing-cycler-person-name').text(LandingPage.useCasesToCycle[LandingPage.currentCycleIndex % 4]['name'])
    $('.landing-cycler-text').text(LandingPage.useCasesToCycle[LandingPage.currentCycleIndex % 4]['descriptiveWord'])
    $('.landing-cycler-pronoun').text(LandingPage.useCasesToCycle[LandingPage.currentCycleIndex % 4]['pronoun'])
    $('.landing-cycler-image').attr('src', "assets/#{LandingPage.useCasesToCycle[LandingPage.currentCycleIndex % 4]['imageName']}.png")
    LandingPage.currentCycleIndex++

  currentCycleIndex: 0

  useCasesToCycle: [
    {name: 'Virna', pronoun: 'her', descriptiveWord: 'Car', imageName: 'Satellite'}
    {name: 'Joe', pronoun: 'his', descriptiveWord: 'Yellow Submarine', imageName: 'Submarine'}
    {name: 'Sam', pronoun: 'his', descriptiveWord: 'Robot', imageName: 'Wallet'}
    {name: 'Maria', pronoun: 'her', descriptiveWord: 'UFO', imageName: 'Meteor'}
  ]
}

LandingPage.initiate()

