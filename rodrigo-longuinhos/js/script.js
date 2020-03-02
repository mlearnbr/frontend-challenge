$(document).ready(function () {
    var urlStr = "https://swapi.co/api/people/1/";
    
    $.ajax({
        url: urlStr,
        type: "get",
        dataType: "json",
        success: function (data) {
            console.log(data);

            $("txtName").val(data.name);
            $("txtBirth_year").val(data.birth_year);
            $("txtEye_color").val(data.eye_color);
            $("txtGender").val(data.gender);
            $("txtHair_color").val(data.hair_color);
            $("txtHeight").val(data.height);
            $("txtMass").val(data.mass);
            $("txtSkin_color").val(data.skin_color);
            $("txtHomeworld").val(data.homeworld);
            $("txtFilms").val(data.films);
            $("txtSpecies").val(data.species);
        },
        error: function (erro) {
            console.log(erro);
        }
    });
});