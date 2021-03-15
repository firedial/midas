
window.onload = function () {
    var input = document.getElementById("pass");
    input.addEventListener("keyup", function(event) {
      if (event.keyCode === 13) {
          authentication();
      }
    });
};

function authentication() {
    var pass = document.getElementById("pass").value;
    var xhr = new XMLHttpRequest(); 
    
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                var result = JSON.parse(xhr.responseText);
                document.cookie = "auth_token=" + result.data + "; path=/";
                document.getElementById("pass").value = "";
            }
        }
    }
    xhr.open("POST", "./misuzu/api/v1/authentication/");
    xhr.setRequestHeader('content-type', 'application/x-www-form-urlencoded;charset=UTF-8');
    xhr.send('pass=' + encodeURIComponent(pass));
}
