/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

var button = document.getElementById("next");
var bt = document.getElementById("prev");
let d = document.getElementById("count");
let d2 = document.getElementById("count2");
let price = document.getElementById("pr");
let d3 = document.getElementById("tt");
var checkBox2 = document.getElementById("flexRadioDefault2");
var checkBox = document.getElementById("flexRadioDefault1");
var dat = document.getElementById("dat");
x = price.innerHTML;
count = 1;
total = x * count;
button.onclick = function () {
    count += 1;
    prev.disabled = false;
    total = x * count;
    d3.innerHTML = total;
    d.innerHTML = count;
    d2.innerHTML = count;
};


bt.onclick = function () {
    if (count > 1)
        count -= 1;
    if (count == 1)
    {
        count = 1;
        prev.disabled = true;
    }
    total = x * count;
    d3.innerHTML = total;
    d.innerHTML = count;
    d2.innerHTML = count;
};

function load() {
    d.innerHTML = count;
    d2.innerHTML = count;
    total = x * count;
    d3.innerHTML = total;
    if (count == 1)
        prev.disabled = true;
    let f = document.getElementById("tt").value
}

function addBooking(endpoint, busesId) {

    fetch(endpoint, {
        method: "post",
        body: JSON.stringify({
            "numberticket": count,
            "busesId": busesId,
            "totalmoney": total,
            "name": document.getElementById("ten").value,
            "phone": document.getElementById("phone").value,
            "email": document.getElementById("email").value
        }),
        headers: {
            'Content-Type': "application/json"
        }
    }).then(function (res) {
        return res.json();
    }).then(function (data) {

        location.reload();
    });
}
