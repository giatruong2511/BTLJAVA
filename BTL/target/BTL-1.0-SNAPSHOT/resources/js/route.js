/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

function deleteRoute(endpoint, id, btn) {
    if (confirm("Ban chac chan xoa khong?") == true) {
        let r = document.getElementById(`row${id}`);
        let load = document.getElementById(`load${id}`);
        load.style.display = "block";
        btn.style.display = "none";
        fetch(endpoint, {
            method: 'delete'
        }).then(function (res) {
            if (res.status !== 204)
                alert("Something wrong!!!");
            load.style.display = "none";
            r.style.display = "none";
        }).catch(function (err) {
            console.error(err);
            btn.style.display = "block";
            load.style.display = "none";
        });
    }
}

function getRoute(endpoint) {
    fetch(endpoint).then(function (res) {
        return res.json();
    }).then(function (data) {
        let d = document.getElementById("myroute");

        if (d !== null) {
            let value = "";
            let h = "";
            for (let i = 0; i < data.length; i++)
                h += `
                <tr id="row${data[i].id}">
                    <td></td>    
                    <td>${data[i].name}</td>
                    <td>${data[i].startingPOS}</td>
                    <td>${data[i].endPOS}</td>
                    <td><span class="badge bg-success">${data[i].active}</span></td>
                    <td>
                        
                        <div class="spinner-border text-info" style="display:none" id="load${data[i].id}"></div>
                        <button  class="btn btn-sm btn-light" onclick="deleteRoute('${endpoint + "/" + data[i].id}', ${data[i].id}, this)">Xoa</button>
                    </td>
                </tr>

            `
            d.innerHTML = h;
        }
        let d2 = document.getElementById("mySpinner");
        d2.style.display = "none";

    }).catch(function (err) {
        console.error(err);
    });
}
