let selectAll = document.querySelector(".selectAllMembers");
selectAll.addEventListener('click', function () {
    let obj = document.querySelectorAll(".memberChk");
    for (let i = 0; i < obj.length; i++) {
        obj[i].checked = selectAll.checked;
    }
}, false);

let objs = document.querySelectorAll(".memberChk");
for (let i = 0; i < objs.length; i++) {
    objs[i].addEventListener('click', function () {
        let notSelect = document.querySelector(".selectAllMembers");
        for (let j = 0; j < objs.length; j++) {
            if (objs[j].checked === false) {
                notSelect.checked = false;
                return;
            }
        }
        notSelect.checked = true;
    }, false);
}