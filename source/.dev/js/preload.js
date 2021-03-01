(function(){
    var setProp = function(...p){document.documentElement.style.setProperty(...p)};
    if(localStorage.getItem("nightMode")==='true') setProp('data-theme', 'dark');
    var themeColor = localStorage.getItem("themeColor");
    if(themeColor!=undefined) {
        console.log('[*] 检测到本地主题色：', themeColor);
        setProp('--theme-color',themeColor);
    } else if('default_theme' in window){
        var temp = parseInt(default_theme.substring(1),16);
        setProp('--theme-color',`${(temp>>16)&255},${(temp>>8)&255},${temp&255}`);
    }
})();