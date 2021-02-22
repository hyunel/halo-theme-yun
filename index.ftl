<#include "module/macro.ftl">
<@layout title="${blog_title!}">

<div class="container">
    <header class="cover">
        <span class="cover-tittle">${blog_title!}</span>

        <nav class="navbar">
            <div class="navbar-logo">
                <a href="javascript:;" onclick="toTop()">${blog_title!}</a>
            </div>
            
            <div class="navbar-item">

                <ul>
                    <@menuTag method="tree">
                        <#list menus?sort_by('priority') as menu>
                            <li>
                                <#if menu.children?? && menu.children?size gt 0>
                                        <#--  <a href="javascript:void(0)" target="${menu.target!}" class="nav-menu-link">${menu.name} <i class="fa fa-angle-down nav-menu-angle" aria-hidden="true"></i></a>  -->
                                    <#else>
                                        <a href="${menu.url!}" target="${menu.target!}">${menu.name}</a>
                                </#if>
                                <#--  <#if menu.children?? && menu.children?size gt 0>
                                    <ul class="nav-sub-menu" style="display: none;">
                                        <#list menu.children?sort_by('priority') as child>
                                            <li>
                                                <a href="${child.url!}" data-ajax target="${child.target!}"
                                                   onfocus="this.blur();">${child.name}</a>
                                            </li>
                                        </#list>
                                    </ul>
                                </#if>  -->
                            </li>
                        </#list>
                    </@menuTag>
                </ul>
                
                <a class="navbar-toggler" onclick="toggle()">
                    <span class="navbar-toggler--line navbar-toggler--line-left"></span>
                    <span class="navbar-toggler--line"></span>
                    <span class="navbar-toggler--line navbar-toggler--line-right"></span>
                </a>
            </div>
            
        </nav>
    </header>

    <div class="content layout">
        <div class="layout-left">
            <div class="layout-mypost">
            <#if posts?? && posts.getTotalElements() gt 0>
                <#list posts.content as post>
                <article class="card card-post">

                <#if post.thumbnail?? && post.thumbnail!=''>
                    <a href="${post.fullPath!}"><img src="${post.thumbnail!}" alt="bg"></a>
                <#else>
                    <a href="${post.fullPath!}"><img src="${theme_base!}/source/images/bg-cover.jpg" alt="bg"></a>
                </#if>
                    
                    <div class="in-card">
                        <a class="in-card-tittle" href="${post.fullPath!}"><h3>${post.title}</h3></a>
                        <div class="in-card-meta">
                        <#if is_index?? && post.topPriority?? && post.topPriority gt 0>
                            <div class="in-card-meta-item top">
                                <svg class="icon" aria-hidden="true">
                                    <use xlink:href="#icon-nail"></use>
                                </svg>
                                置顶
                            </div>
                        </#if>

                            <div class="in-card-meta-item">
                                <svg class="icon" aria-hidden="true">
                                    <use xlink:href="#icon-time"></use>
                                </svg>
                                ${post.createTime?string("yyyy-MM-dd")}
                            </div>

                            <div class="in-card-meta-item">
                                <svg class="icon" aria-hidden="true">
                                    <use xlink:href="#icon-eye"></use>
                                </svg>
                                 ${post.visits!} 热度
                            </div>

                            <#if post.tags?? && post.tags?size gt 0>
                                <div class="in-card-meta-item">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-tag"></use>
                                    </svg>
                                    <#list post.tags as tag>
                                        <a href="${tag.fullPath!}">${tag.name!}&nbsp;&nbsp;</a>
                                    </#list>
                                </div>
                            </#if>

                            <div class="in-card-meta-item">
                                <svg class="icon" aria-hidden="true">
                                    <use xlink:href="#icon-FontAwesomecommentdotssolid"></use>
                                </svg>
                                ${post.commentCount} 条评论
                            </div>
                        </div>
                        <p class="in-card-article limit-more-line">${post.summary!}</p>
                    </div>
                </article>
                </#list>
            </#if>
            </div>

            <#if posts.totalPages gt 1>
                <@paginationTag method="index" page="${posts.number}" total="${posts.totalPages}" display="3">
                    <#include "module/pagination.ftl">
                </@paginationTag>
            </#if>
            
        </div>

        <div class="layout-info">
            <div class="card card-widget widget-avatar auto-hide">
                <img src="${user.avatar!}" alt="avatar">
                <p>Hyun</p>
                <p>Student</p>
                <p>
                    <svg class="icon color-theme" aria-hidden="true">
                        <use xlink:href="#icon-Frame1"></use>
                    </svg>
                    Henan China
                </p>
            </div>

            <div class="card card-widget widget-announce">
                <div class="in-widget-tittle">
                    <svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-gonggao"></use>
                    </svg>
                    公告
                </div>

                <p>
                    ${settings.index_notice!}
                </p>
            </div>

            <div class="card card-widget widget-social">
                <div class="in-widget-tittle">
                    <svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-share"></use>
                    </svg>
                    分享 & 订阅
                </div>
                <div class="in-widget-content">

                    <p>分享</p>
                    <a href="#" class="line-center">
                        <svg class="icon" aria-hidden="true" style="color: #E3262A;">
                            <use xlink:href="#icon-weibo"></use>
                        </svg>
                        <span>分享本页到 微博</span>
                    </a>

                    <a href="#" class="line-center">
                        <svg class="icon" aria-hidden="true" style="color: #FECE00;">
                            <use xlink:href="#icon-qzone"></use>
                        </svg>
                        <span>分享本页到 QQ空间</span>
                    </a>

                    <p>订阅</p>

                    <a href="#" class="line-center star">
                        <svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-iconfont48"></use>
                        </svg>
                        <span>添加本页到 收藏夹</span>
                    </a>

                    <div class="space-around">
                        <a href="#">
                            <svg class="icon" aria-hidden="true">
                                <use xlink:href="#icon-QQ"></use>
                            </svg>
                        </a>

                        <a href="#">
                            <svg class="icon" aria-hidden="true">
                                <use xlink:href="#icon-huaban88"></use>
                            </svg>
                        </a>

                        <a href="#">
                            <svg class="icon" aria-hidden="true">
                                <use xlink:href="#icon-mail"></use>
                            </svg>
                        </a>

                        <a href="#">
                            <svg class="icon" aria-hidden="true">
                                <use xlink:href="#icon-RSS"></use>
                            </svg>
                        </a>

                    </div>
                </div>
            </div>

            <div class="card card-widget widget-statistic">
                <div class="in-widget-tittle">
                    <svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-ic_statistics_s"></use>
                    </svg>
                    统计数据
                </div>

                <div class="in-widget-content color-theme">
                    <div class="num-block">
                        <div>文章</div>
                        <div>123</div>
                    </div>
                    <div class="num-block">
                        <div>阅读</div>
                        <div>123</div>
                    </div>
                    <div class="num-block">
                        <div>评论</div>
                        <div>123</div>
                    </div>
                    <div class="num-block">
                        <div>分类</div>
                        <div>1</div>
                    </div>
                    <div class="num-block">
                        <div>标签</div>
                        <div>1</div>
                    </div>
                    <div class="num-block">
                        <div>访客</div>
                        <div>123</div>
                    </div>
                </div>

            </div>

            <div class="card card-widget widget-tags">
                <div class="in-widget-tittle">
                    <svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-tag"></use>
                    </svg>
                    标签云
                </div>
                <!-- .widget-tags .in-widget-content -->
                <div class="in-widget-content"></div>
            </div>

            <div class="card card-widget widget-category">
                <div class="in-widget-tittle">
                    <svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-leibie"></use>
                    </svg>
                    文章分类
                </div>

                <div class="in-widget-content">
                    <ul>
            <@categoryTag method="list">
                <#if categories?? && categories?size gt 0>
                    <#list categories as category>
                        <li><a href="${category.fullPath!}"><span>${category.name}</span><span class="line-num">
                        <@postTag method="listByCategorySlug" categorySlug="${category.slug!}">
                            ${posts?size}
                        </@postTag>
                        </span></a></li>
                    </#list>
                </#if>
            </@categoryTag>
                    </ul>
                </div>
            </div>
        </div>
        
    </div>
</div>

    
<div class="toTop"></div>


<script src="https://cdn.jsdelivr.net/npm/animejs@3.2.1/lib/anime.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/wordcloud@1.1.2/src/wordcloud2.min.js"></script>
<script src="${theme_base!}/source/js/index.js"></script>
<script src="${theme_base!}/source/js/iconfont.js"></script>

</@layout>
