/**
 * Created by Yejunjie on 2017/5/12.
 */
function navspace(n) {
    switch (n){
        case 1:
            document.getElementById("t2con1").style.display = "block";
            document.getElementById("t2con2").style.display = "none";
            document.getElementById("t2con3").style.display = "none";
            break;
        case 2:
            document.getElementById("t2con1").style.display = "none";
            document.getElementById("t2con2").style.display = "block";
            document.getElementById("t2con3").style.display = "none";
            break;
        case 3:
            document.getElementById("t2con1").style.display = "none";
            document.getElementById("t2con2").style.display = "none";
            document.getElementById("t2con3").style.display = "block";
            break;
    }
}

function box(n) {
    switch (n){
        case 1:
            document.getElementById("box1").style.color="rgb(51,51,51)";
            document.getElementById("box2").style.color="rgba(51,51,51,0.7)";
            document.getElementById("form1").style.display="block";
            document.getElementById("form2").style.display="none";
            break;
        case 2:
            document.getElementById("box1").style.color="rgba(51,51,51,0.7)";
            document.getElementById("box2").style.color="rgb(51,51,51)";
            document.getElementById("form1").style.display="none";
            document.getElementById("form2").style.display="block";
            break;
    }
}


