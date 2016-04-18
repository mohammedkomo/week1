
function home() {
    window.location = "index.html";
}
function AboutMenu() {
    window.location = "about.html";
}
function loginuser() {
    window.location = "login.html";
}
function Register() {
    window.location = "Register.html";
}
function ContactMenu() {
    window.location = "contactus.html";
}
function RegisterMenu() {
    window.location = "Register.html";
}
function NoteMenu() {
    window.location = "note.html";
}

//-----------------------
function login() {
    try {
        var id = document.getElementById("id").value;
        var pasword = document.getElementById("pass").value;
        if (id == "") {
            showmessage("Input Iser ID ");
            return;
        }

        if (pasword == "") {
            showmessage("Input password");
            return;
        }

        $.ajax({
            type: "POST",
            url: "code/login.ashx",
            data: { id: id, pass: pasword },
            timeout: 30000,
            crossDomain: true,
            success: function (par) {
                var m = par.split("//");
                showmessage(m[1]);
                if (m[0] == "1") {
                    window.location = "chome.html";
                }

            },
            error: function (par) { toast(' can not connect ' + par); }
        });
    }
    catch (e) { toast('error : ' + e); }
}
//-------------------
function cregister() {
    try {
        var id = document.getElementById("userid").value;
        var name = document.getElementById("username").value;
        var email = document.getElementById("email").value;
        var phone = document.getElementById("phone").value;
        var pasword = document.getElementById("password").value;
        var address = document.getElementById("address").value;
        
        if (id == "") {
            showmessage("please input Customer id ");
            return;
        }

        if (name == "") {
            showmessage("please input Customer name ");
            return;
        }
        if (email == "") {
            showmessage("please input Customer email ");
            return;
        }

        if (phone == "") {
            showmessage("please input Customer phone ");
            return;
        }
        if (pasword == "") {
            showmessage("please input Customer password ");
            return;
        }

        if (phone.length != 10) {
            showmessage("Please input phone number in 10 numbers");
            return;
        }
        if (phone.substring(0, 2) != "05") {
            showmessage("input phone incorrect format and start with 05");
            return;
        }
        var expname = /^[0-9|]+$/;

        if (!expname.test(phone)) {
            showmessage("the phone must in number only ");
            return;
        }

        if (email.indexOf(".") == -1 || email.indexOf("@") == -1) {
            showmessage("input Email incorrect format ");
            return;
        }


        $.ajax({
            type: "POST",
            url: "code/register.ashx",
            data: { id: id, name: name, phone: phone, email: email, pass: pasword, address: address },
            success: function (par) {
                showmessage(par);
            },
            error: function (par) { showmessage(par); }
        });
    }
    catch (e) { showmessage(e); }
}
