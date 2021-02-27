(function(){
    if(localStorage.getItem("nightMode")==='true') document.documentElement.setAttribute('data-theme', 'dark');
    
    var themeColor = localStorage.getItem("themeColor");
    if(themeColor!=undefined) {
        console.log('[*] 检测到本地主题色：', themeColor);
        document.documentElement.style.setProperty('--theme-color', themeColor);
    }
})();