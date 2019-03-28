$(function () {
    //存入全局Ajax地址
    localStorage.setItem('ajaxUrl', 'http://localhost:8080');
    // localStorage.setItem('ajaxUrl', 'http://39.105.60.246');
});

function login() {
    window.location.href = localStorage.getItem("ajaxUrl") + "/main.do";
}
