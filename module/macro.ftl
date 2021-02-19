<#macro layout title>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="${meta_keywords!}"/>
    <meta name="description" content="${meta_description!}" />
    
    <link rel="stylesheet" href="${theme_base!}/source/css/style.css">

    <#--
        公共 head 代码，详情请参考：https://docs.halo.run/zh/developer-guide/theme/public-template-tag
        包含：Favicon，自定义 head 等
    -->

    <@global.head />

    <title>${title}</title>
</head>
<body>

<#nested >

<#include "footer.ftl">
</body>

<script src="${theme_base!}/source/js/iconfont.js"></script>
<script src="https://cdn.jsdelivr.net/npm/animejs@3.2.1/lib/anime.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/wordcloud@1.1.2/src/wordcloud2.min.js"></script>
<script>

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
        let tittle_len = document.querySelector('.cover-tittle').getBoundingClientRect().width;

        this.offset = $('.cover').height() - 60;
        this.mobile = $('.cover-tittle').css('font-size') !== '40px';
        this.to_x = - $('.cover-tittle').offset().left - tittle_len*(this.mobile?0.166:0.233);
        this.to_y = $('.navbar').offset().top - $('.cover-tittle').offset().top + (this.mobile?10:0);
        
        this.anime = anime({
            targets: '.cover-tittle',
            keyframes: [
                {'letter-spacing': 0, 'font-weight':700},
                {translateY: this.to_y - 50, delay: 100},
                {translateX: this.to_x, translateY: this.to_y, scale: this.mobile?0.7:0.5}
            ],
            autoplay: false,
            easing: 'easeInOutSine'
        });
    };

    constructor() {
        this.toping = 0;
        this.lastScroll = 0;

        $('.navbar-logo').hide();

        $(window).resize(() => { this.onResize(); });
        $(window).scroll(() => { this.onScroll(); });

        this.initAnime();
    }

    onResize() {
        this.toping ++;
        toTop(()=>{
            this.toping --;
            if(this.toping === 0) {
                this.initAnime();
            }
        })
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
            $('.cover-tittle').hide();
            $('.navbar-logo').show();
        } else {
            $('.cover-tittle').show();
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
</script>

</html>
</#macro>

