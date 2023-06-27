function doLike(pid, user_id) {
    const d = {
        user_id: user_id,
        pid: pid,
        operation: "like"
    };
    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {

            let booleanResult = data.slice(0, 6).trim();
            let numberOfLikes = data.slice(6).trim();
            if (booleanResult.trim() === 'true') {
                $(".like-counter").html(' ' + numberOfLikes);
            } else {
                $(".like-counter").html(' ' + numberOfLikes);
            }
        },
        error: function (data, textStatus, errorThrown) {
            console.log(data);
        }
    });

    function validateCheckBox(checkboxGroupName, parentContainerId) {
        var b = 0, chk = document.getElementsByName(checkboxGroupName);
        for (j = 0; j < chk.length; j++) {
            if (chk.item(j).checked === false) {
                b++;
            }
        }
        if (b === chk.length) {
            swal("Please check tearms and conditions...");
            document.getElementById(parentContainerId).setAttribute("class", "alert alert-danger");
            return false;
        } else {
            document.getElementById(parentContainerId).removeAttribute("class", "alert alert-danger");
            return true;
        }
    }

    function validateRadioButton(radiogroupName, parentContainerId) {
        let a = 0, rdbtn = document.getElementsByName(radiogroupName);
        for (i = 0; i < rdbtn.length; i++) {
            if (rdbtn.item(i).checked === false) {
                a++;
            }
        }
        if (a === rdbtn.length) {
            swal("Please select your gender...");
            document.getElementById(parentContainerId).setAttribute("class", "alert alert-danger");
            return false;
        } else {
            document.getElementById(parentContainerId).removeAttribute("class", "alert alert-danger");
            return true;
        }
    }
    function validateRadiobtnOrCheckbx(radiogroupName, parentContainerId, message) {
        let a = 0, rdbtn = document.getElementsByName(radiogroupName);
        for (i = 0; i < rdbtn.length; i++) {
            if (rdbtn.item(i).checked === false) {
                a++;
            }
        }
        if (a === rdbtn.length) {
            swal(message);
            document.getElementById(parentContainerId).setAttribute("class", "alert alert-danger");
            return false;
        } else {
            document.getElementById(parentContainerId).removeAttribute("class", "alert alert-danger");
            return true;
        }
    }
    function noSpaceAllowed(formId, textfieldId, message) {
        let x = document.forms[formId][textfieldId].value.trim();
        if (x.toString().indexOf(" ") === -1) {
            swal(message);
            return false;
        } else {
            return true;
        }
    }
    function validateFormFeild(formId, textfieldId) {
        let x = document.forms[formId][textfieldId].value.trim();
        if (x === "" || x === null) {
            return false;
        } else {
            return true;
        }
    }
}
