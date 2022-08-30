/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


function loadComment(endpoint, bushomeId) {
    fetch(endpoint).then(function(res) {
        return res.json();
    }).then(function(data) {
        console.info(data)
        let h = '';
        for (let c of data)
            h += `
                <div class="c-comment-box">
                <div class="c-comment-box__avatar"><img src="${c.user.avatar}" /></div>
                    <div class="c-comment-box__content">
                        <div class="c-comment-name">Binh luan boi ${c.user.username}
                            <div class="time">${moment(c.createdDate).locale("vi").fromNow()}</div>
                        </div>
                        <div class="c-comment-text">${c.content}</div>
                    </div>
                </div>
            </div>
            `

        let d = document.getElementById("comments");
        d.innerHTML = h;
    });
}

function addComment(endpoint, bushomeId) {
    fetch(endpoint, {
        method: "post",
        body: JSON.stringify({
            "content": document.getElementById("content").value,
            "bushomeId": bushomeId
        }),
        headers: {
            'Content-Type': "application/json"
        }
    }).then(function(res) {
        return res.json();
    }).then(function(data) {
        
        let h = `
                <div class="c-comment-box">
                <div class="c-comment-box__avatar"><img src="${data.user.avatar}" /></div>
                    <div class="c-comment-box__content">
                        <div class="c-comment-name">Binh luan boi ${data.user.username}
                            <div class="time">${moment(data.createdDate).locale("vi").fromNow()}</div>
                        </div>
                        <div class="c-comment-text">${data.content}</div>
                    </div>
                </div>
            </div>
            `;
        
        location.reload();
    })
}