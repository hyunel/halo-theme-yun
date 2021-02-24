const is_mobile = window.innerWidth <= 480;
var _scrolling = 0;

toastr.options = {
    "closeButton": false,
    "positionClass": "toast-bottom-center",
    "timeOut": "1000",
}

function numberFormatter(input, type) {
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

function yunScrollTo(id, cb_done) {
    function elmYPosition(eID) {
        var elm = document.getElementById(eID);
        var y = elm.offsetTop;
        var node = elm;
        while (node.offsetParent && node.offsetParent != document.body) {
            node = node.offsetParent;
            y += node.offsetTop;
        } return y;
    }
    _scrolling ++;
    return anime({
        targets: document.scrollingElement,
        scrollTop: elmYPosition(id),
        duration: 500,
        easing: 'easeInOutQuad',
        autoplay: true,
        complete: ()=>{
            _scrolling--;
            if(cb_done!==undefined) cb_done();
        }
    });
}

function toTop(cb_done) {
    _scrolling ++;
    return anime({
        targets: document.scrollingElement,
        scrollTop: 0,
        duration: 500,
        easing: 'easeInOutQuad',
        autoplay: true,
        complete: ()=>{
            _scrolling--;
            if(cb_done!==undefined) cb_done();
        }
    });
}

function toggleAnime(toggle) {
    const tl = anime.timeline({easing: 'easeInOutQuad'});

    // navbar.attr('display', toggle?'none':'flex')
    tl.add({
        targets: '.navbar-item ul',
        opacity: toggle?[1, 0]:[0, 1],
        duration: 200
    }).add({
        targets: '.navbar-item li',
        delay: anime.stagger(100),
        translateX: toggle?undefined:[888, 0],
        duration: 300
    });
}

class yunNav {
    constructor() {
        this.lastScroll = 0;
        this.container = $('.container');

        $(window).scroll(() => { this.onScroll(); });

        const navbar = $('.navbar-item');
        
        // 导航条移动端 toggle 点击事件
        $(".navbar-toggler").click(function(event){
            const toggle = navbar.hasClass('active');

            if(toggle) {
                navbar.removeClass('active');
            } else {
                navbar.addClass('active');
            }

            toggleAnime(toggle);
            event.stopPropagation();//阻止冒泡
        });

        // 自动隐藏 导航条 侧边栏
        $("body").click(()=>{
            if(navbar.hasClass('active')) navbar.removeClass('active');
            if(this.container.hasClass('sidebar')) this.container.removeClass('sidebar');
        });
    }

    onScroll() {
        const top = $(window).scrollTop();
        const scrollHeight = document.documentElement.scrollHeight - window.innerHeight;

        if('is_post' in window) {
            let process = top / scrollHeight * 100;
            if(process>100)   process=100;
            $('.read-process').text(parseInt(process)+'%');
            $('.processbar-process').css('width', process+'%')
        }

        if(_scrolling || top + 60 >= scrollHeight) {
            this.lastScroll = top;
            return;
        }

        if(top > this.lastScroll && !('is_index' in window) && !is_mobile && scrollHeight > 200 && false) {
            this.container.addClass('hide');
        } else {
            this.container.removeClass('hide');
        }

        this.lastScroll = top;
    }
}

new yunNav();

$('.theme-config').click(function() {
    $('.float-bar').toggleClass('config');
});
