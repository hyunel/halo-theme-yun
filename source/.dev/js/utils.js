var scrolling = 0;

export function numberFormatter(input, type) {
    function yunRound(value, n) {
        return Math.round(value*Math.pow(10,n))/Math.pow(10,n);
    }

    if(type==='time') {
        if(input<60) return Math.round(input)+'s';
        else if(input<60*60) return Math.round(input/60)+'min';
        else return yunRound(input/3600,1)+'h';  
    }
    if(input<1) return yunRound(input, 1);
    else if(input<1000) return input;
    else if(input<10000) return yunRound(input/1000, 1)+'k';
    else return yunRound(input/10000, 2)+'w';
}

export function yunScrollTo(id, cb_done) {
    function elmYPosition(eID) {
        var elm = document.getElementById(eID);
        var y = elm.offsetTop;
        var node = elm;
        while (node.offsetParent && node.offsetParent != document.body) {
            node = node.offsetParent;
            y += node.offsetTop;
        } return y;
    }
    scrolling ++;
    return anime({
        targets: document.scrollingElement,
        scrollTop: elmYPosition(id),
        duration: 500,
        easing: 'easeInOutQuad',
        autoplay: true,
        complete: ()=>{
            scrolling--;
            if(cb_done!==undefined) cb_done();
        }
    });
}

export function toTop(cb_done) {
    scrolling ++;
    return anime({
        targets: document.scrollingElement,
        scrollTop: 0,
        duration: 500,
        easing: 'easeInOutQuad',
        autoplay: true,
        complete: ()=>{
            scrolling--;
            if(cb_done!==undefined) cb_done();
        }
    });
}