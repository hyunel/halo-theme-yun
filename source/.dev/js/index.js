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
        // prevent history popstate and can't get correct initRect
        if ('scrollRestoration' in history) {
            history.scrollRestoration = 'manual';
        }

        this.cover_tittle = $('.cover-tittle');
        this.initRect = this.cover_tittle[0].getBoundingClientRect();
        this.initFontSize = this.cover_tittle.css('font-size');

        console.log('[*] mobile mode:', window.is_mobile);

        $('.navbar-logo').hide();

        $(window).resize(() => { this.onResize(); });
        $(window).scroll(() => { this.onScroll(); });

        this.onResize();
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

        if(top > this.offset) {
            $('.container').addClass('container--top');
            this.onProcess(1);
        } else {
            $('.container').removeClass('container--top');
            $('.navbar-item ul').removeAttr('style');
            $('.navbar-item').removeClass('active');
            this.onProcess(top / this.offset);
        }
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

export default yunCover;