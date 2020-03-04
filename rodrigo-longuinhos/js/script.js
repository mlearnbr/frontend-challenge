let url = 'https://swapi.co/api/people/1/';
$.getJSON(url, function (cardStarWars) {
    console.log(cardStarWars.name);
    $("input:nth-child(1)").attr('value', cardStarWars.name);
    $("input:nth-child(2)").attr('value', cardStarWars.birth_year);
    $('input:nth-child(3)').attr('value',cardStarWars.eye_color);
    $('input:nth-child(4)').attr('value',cardStarWars.gender);
    $('input:nth-child(5)').attr('value',cardStarWars.hair_color);
    $('input:nth-child(6)').attr('value',cardStarWars.height);
    $('input:nth-child(7)').attr('value',cardStarWars.mass);
    $('input:nth-child(8)').attr('value',cardStarWars.skin_color);
    $('input:nth-child(9)').attr('value',cardStarWars.homeworld);
    $('input:nth-child(10)').attr('value',...cardStarWars.films);
    $('input:nth-child(11)').attr('value',cardStarWars.species);
})