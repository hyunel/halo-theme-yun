function toggle() {
    const navbar = $('.navbar-item');
    const tl = anime.timeline({easing: 'easeInOutQuad'});

    let toggle = navbar.hasClass('active');

    if(toggle) {
        navbar.removeClass('active');
    } else {
        navbar.addClass('active');
    }

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

function toTop(cb_done) {
    return anime({
        targets: document.scrollingElement,
        scrollTop: 0,
        duration: 500,
        easing: 'easeInOutQuad',
        autoplay: true,
        complete: cb_done
    });
}

class yunCover {

    initAnime() {
        this.cover_tittle.css('font-size', this.initFontSize);
        this.anime = anime({
            targets: this.cover_tittle[0],
            keyframes: [
                {'letter-spacing': [8, 0], 'font-weight':[400, 700]},
                {bottom: [this.initBottom, 60], delay: 100},
                {left: [this.initLeft, 20], bottom: [60, 16], 'font-size': [this.initFontSize, 20]} // margin-left: 20px;
            ],
            autoplay: false,
            easing: 'easeInOutSine'
        });
    };

    constructor() {
        this.lastScroll = 0;

        this.cover_tittle = $('.cover-tittle');
        this.initRect = this.cover_tittle[0].getBoundingClientRect();
        
        console.log(this.initRect);

        this.initFontSize = this.cover_tittle.css('font-size');

        $('.navbar-logo').hide();

        this.onResize();


        $(window).resize(() => { this.onResize(); });
        $(window).scroll(() => { this.onScroll(); });
        
        this.initAnime();
    }

    onResize() {
        document.documentElement.style.setProperty('--vh', window.innerHeight+'px');

        this.offset = $('.cover').height() - 60;
        this.initLeft = (window.innerWidth-this.initRect.width)/2;
        this.initBottom = (window.innerHeight-this.initRect.height)/2;
        
        $('.cover-tittle').css('left', this.initLeft);
        $('.cover-tittle').css('bottom', this.initBottom);
        
        this.initAnime();
        this.onScroll();
    };

    onScroll() {
        const top = $(window).scrollTop();
        if(top > this.lastScroll && top > this.offset + 300) {
            $('.container').addClass('hide');
        } else {
            $('.container').removeClass('hide');
        }

        if(top > this.offset) {
            $('.container').addClass('container--top');
            this.onProcess(1);
        } else {
            $('.container').removeClass('container--top');
            $('.navbar-item ul').removeAttr('style');
            $('.navbar-item').removeClass('active');
            this.onProcess(top / this.offset);
        }

        this.lastScroll = top;
    };

    onProcess(process) {
        this.anime.seek(this.anime.duration * process);
        if(process===1) {
            this.cover_tittle.hide();
            $('.navbar-logo').show();
        } else {
            this.cover_tittle.show();
            $('.navbar-logo').hide();
        }
    }

}

new yunCover();

WordCloud(
    document.querySelector('.widget-tags .in-widget-content'),
    {
        list: [['foo', 0], ['bar', 0], ['bar', 0], ['bar', 0]],
        weightFactor: function (size) {
            return Math.floor(Math.random() * Math.floor(20)) + 12;
        },

});