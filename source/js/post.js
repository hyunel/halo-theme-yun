document.addEventListener('DOMContentLoaded', function () {
    loadToc('.post-wrapper', '#post-toc', 'h1, h2, h3, h4, h5, h6');
    document.querySelectorAll('pre code').forEach((block) => {
        hljs.highlightBlock(block);
        const copyme = document.createElement('button');
        copyme.classList.add('copy');
        copyme.innerHTML = '<svg class="icon" aria-hidden="true"><use xlink:href="#icon-mulu"></use></svg>'
        block.parentElement.insertBefore(copyme, block.parentElement.firstChild);
    });

    let clipboard = new ClipboardJS('pre .copy', {
        text: function (trigger) {
            return trigger.parentElement.querySelector('code').textContent;
        },
    });

    clipboard.on('success', function (e) {
        toastr.success('复制成功!');
        e.clearSelection();
    });

    clipboard.on('error', function (e) {
        toastr.warning('复制失败, 您的浏览器不支持此操作!');
    });

    // 初始化文章数据统计、计时器
    const countAll = document.querySelector('.post-wrapper').textContent.replaceAll(' ','').replaceAll('\n','').length;
    $('.count-all').text(numberFormatter(countAll));
    $('.count-need-time').text(numberFormatter(countAll*0.03, 'time'));
    
    function timeCounter(count) {
        $('.count-time').text(numberFormatter(count, 'time'));
        let nextTime = 1000;
        if(count>=60) nextTime = 60000;
        setTimeout(()=>{timeCounter(count+1)}, 1000);
    }

    timeCounter(0);
});

function loadToc(from, to, sec) {
    const fromEm = document.querySelector(from);
    const tocEm = document.querySelector(to);

    const tempTocEm = document.createElement('ul');
    let lastNum = 999;
    let lastRoot = tempTocEm;
    let lastTop = new Array(7).fill(tempTocEm);

    const headings = [].slice.call(fromEm.querySelectorAll(sec));
    if(headings.length===0) {
        const p = document.createElement('p');
        p.textContent = '无目录';
        tocEm.appendChild(p);
        return;
    }
    headings.forEach((heading, index)=> {
        
        if (!heading.hasAttribute("id"))
            return;

        const ref = heading.getAttribute("id");
        const hNum = parseInt(heading.tagName.substring(1));
        
        const li = document.createElement('li');
        const a = document.createElement('a');
        a.textContent = heading.textContent;
        a.setAttribute('onclick', "yunScrollTo('"+ref+"')");
        li.appendChild(a);
        
        const ul = document.createElement('ul');
        li.append(ul);
        if(hNum <= lastNum) { // 这个是更大的标题
            lastTop[hNum].appendChild(li);
            lastTop.fill(ul, hNum+1, 7);
        } else { // 这个是更小号的标题
            lastRoot.appendChild(li);
            lastTop[hNum] = lastRoot;
        }

        lastRoot = ul;
        lastNum = hNum;
    });

    let ulList = tempTocEm.querySelectorAll('ul')
    ulList.forEach((ul, index)=> {
        if(ul.childNodes.length===0)
            ul.remove()
    })
    tocEm.appendChild(tempTocEm);
}


