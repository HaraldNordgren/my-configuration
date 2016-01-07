//$(document).ready(function () { alert("Hello World"); });

var raw_title = document.getElementsByClassName("question-hyperlink")[0];

//var query_box = document.getElementsByName("q")[0];
//query_box.value = raw_title;

//alert(document.getElementsByName("q"));
//alert(query_box);


var kickass = window.open("https://kickass.unblocked.pe/");

$(kickass.document).ready( function() {
    //alert(kickass.innerWidth);
    //$("#contentSearch")
    kickass.alert("hej");
    var s = kickass.document.getElementById("contentSearch");
    alert(s);
});

/*
kickass.onload = function () {
    document.write("5");
    //kickass.document.write(kickass.document.getElementById("contentSearch"));
};
*/

//alert(kickass.document.getElementById("contentSearch"));
//kickass.document.getElementById("contentSearch")[0].value = raw_title;
