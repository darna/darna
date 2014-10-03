
LandingPage = {
  initiate: () ->
    setInterval(LandingPage.cycleThroughThings, 2000)

  cycleThroughThings: () ->
    thingsImage = ['Satellite', 'Submarine', 'Wallet', 'Meteor']
    $('.landing-cycler-text').text(LandingPage.useCasesToCycle[LandingPage.currentCycleIndex % 4]['descriptiveWord'])
    $('.landing-cycler-image').attr('src', "assets/#{LandingPage.useCasesToCycle[LandingPage.currentCycleIndex % 4]['imageName']}.png")
    LandingPage.currentCycleIndex++

  currentCycleIndex: 0

  useCasesToCycle: [
    {descriptiveWord: 'Car', imageName: 'Satellite'}
    {descriptiveWord: 'Television', imageName: 'Submarine'}
    {descriptiveWord: 'Robot', imageName: 'Wallet'}
    {descriptiveWord: 'UFO', imageName: 'Meteor'}
  ]

}

LandingPage.initiate()

