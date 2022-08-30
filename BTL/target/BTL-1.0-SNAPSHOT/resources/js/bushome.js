/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

function deleteBusHome(endpoint, id, btn) {
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

function updateBusHome(endpoint, id, btn) {
    if (confirm("Ban chac chan muon thay doi khong?") == true) {
        fetch(endpoint, {
            method: 'put'
        }).then(function (res) {
            if (res.status !== 204)
                alert("Something wrong!!!");
            location.reload();
        }).catch(function (err) {
            console.error(err);

        });
    }
}

function getBusHome(endpoint) {
    fetch(endpoint).then(function (res) {
        return res.json();
    }).then(function (data) {
        let d = document.getElementById("mybushome");

        if (d !== null) {
            let value = "";
            let h = "";
            for (let i = 0; i < data.length; i++)
                h += `
                <tr id="row${data[i].id}">
                    <td>
                         <img src="${data[i].image}" alt="" class="avatar-md" />
                    </td>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="flex-grow-1">${data[i].name}</div>
                        </div>
                    </td>
                    <td>${data[i].address}</td>
                    <td>
                        <span class="text-success">${data[i].phone}</span>
                    </td>
                    <td>${data[i].email}</td>
                    <td>
                        <span class="badge badge-soft-success" >${data[i].active}</span>
                    </td>
                    <td>
                       <div class="spinner-border text-info" style="display:none" id="load${data[i].id}"></div>
                        <button class="btn btn-danger" onclick="deleteBusHome('${endpoint + "/" + data[i].id}', ${data[i].id}, this)">Xoa</button>                     
                       <button class="btn btn-danger" onclick="updateBusHome('${endpoint + "/" + data[i].id}', ${data[i].id}, this)">Tat</button>
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

function getBusHomeFalse(endpoint) {
    fetch(endpoint).then(function (res) {
        return res.json();
    }).then(function (data) {
        let d = document.getElementById("mybushome");

        if (d !== null) {
            let value = "";
            let h = "";
            for (let i = 0; i < data.length; i++)
                h += `
                <tr id="row${data[i].id}">
                    <td>
                         <img src="${data[i].image}" alt="" class="avatar-xs" />
                    </td>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="flex-grow-1">${data[i].name}</div>
                        </div>
                    </td>
                    <td>${data[i].address}</td>
                    <td>
                        <span class="text-success">${data[i].phone}</span>
                    </td>
                    <td>${data[i].email}</td>
                    <td>
                        <span class="badge badge-soft-success" >${data[i].active}</span>
                    </td>
                    <td>
                       <div class="spinner-border text-info" style="display:none" id="load${data[i].id}"></div>
                        <button class="btn btn-danger" onclick="deleteBusHome('${endpoint + "/" + data[i].id}', ${data[i].id}, this)">Xoa</button>                     
                       <button class="btn btn-danger" onclick="updateBusHome('${endpoint + "/" + data[i].id}', ${data[i].id}, this)">Bat</button>
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


function getRoute(endpoint, id) {   
//    let r = document.getElementById("routee");
//    r.style.display = "block";
    fetch(endpoint).then(function (res) {
        return res.json();
    }).then(function (data) {
        let d = document.getElementById("myroute");
        
        let value = "";
        let h = "";
        
        if (d !== null) {
            
            for (let i = 0; i < data.length; i++)
                h += `
                    <tr>
                        <td>
                            <div class="d-flex align-items-center">

                                <div>
                                    <h5 class="fs-14 my-1 fw-medium">
                                        <a href="apps-ecommerce-seller-details.html" class="text-reset">${data[i].name}</a>
                                    </h5>
                                    <span class="text-muted">Ten tuyen</span>
                                </div>
                            </div>
                        </td>
                        <td>
                            <p>${data[i].startingPOS}</p>
                            <span class="text-muted">Diem bat dau</span>
                        </td>
                        <td>
                            <p>${data[i].endPOS}</p>
                            <span class="text-muted">Diem ket thuc</span>
                        </td>
                    </tr>
            `
            d.innerHTML = h;
        }
        
    }).catch(function (err) {
        console.error(err);
    });
}
function getBusHomeAdmin(endpoint) {
    fetch(endpoint).then(function (res) {
        return res.json();
    }).then(function (data) {
        let d = document.getElementById("mybushomeadmin");
//        let r = document.getElementById("routee");
//        r.style.display = "none";
//        
        if (d !== null) {
            let value = "";
            let h = "";
            for (let i = 0; i < data.length; i++)
                h += `
                <tr id="row${data[i].id}">
                    <td onclick="getRoute('${endpoint + "/" + data[i].id + "/route" } ', ${data[i].id})">
                        <div class="d-flex align-items-center">
                            <div class="avtar-md bg-light rounded  " style="width: 4.5rem;">
                                
                                <img src="${data[i].image}" alt="" class="img-fluid " />
                            </div>
                            <div style=" padding-left: 5px;">
                                <h5 class="fs-14 my-1">${data[i].name}</h5>
                                <span class="text-muted">Name</span>
                            </div>
                        </div>
                    </td>
                    <td>
                        <h5 class="fs-14 my-1 fw-normal">${data[i].address}</h5>
                        <span class="text-muted">Address</span>
                    </td>
                    <td>
                        <h5 class="fs-14 my-1 fw-normal">${data[i].phone}</h5>
                        <span class="text-muted">Phome</span>
                    </td>
                    <td>
                        <h5 class="fs-14 my-1 fw-normal">${data[i].email}</h5>
                        <span class="text-muted">Email</span>
                    </td>
                    
                </tr>

            `
            d.innerHTML = h;
        }
    }).catch(function (err) {
        console.error(err);
    });
}