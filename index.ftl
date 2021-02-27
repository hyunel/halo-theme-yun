<#include "module/macro.ftl">
<@layout title="${blog_title!}">

<div class="container">
    <header class="cover">
        <div class="background"></div>
        <span class="cover-tittle">${blog_title!}</span>
        <#include "module/navbar.ftl">
    </header>

    <div class="index-content layout">
        <div class="layout-left">
            <div class="layout-articles">
            <#if posts?? && posts.getTotalElements() gt 0>
                <#list posts.content as post>
                <article class="card card-article">
                    <#assign postimg=theme_base+'/source/images/bg-cover.jpg'/>
                    <#if post.thumbnail?? && post.thumbnail!=''><#assign postimg=post.thumbnail /></#if>

                    <a href="${post.fullPath!}"><img src="${postimg!}" alt="bg"></a>
                    <div class="in-card">
                        <a class="in-card-tittle" href="${post.fullPath!}"><h3>${post.title!}</h3></a>
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
                                        <a href="${tag.fullPath!}">${tag.name!}</a>
                                    </#list>
                                </div>
                            </#if>
                            <#if !post.disallowComment!false>
                            <div class="in-card-meta-item">
                                <svg class="icon" aria-hidden="true">
                                    <use xlink:href="#icon-FontAwesomecommentdotssolid"></use>
                                </svg>
                                ${post.commentCount!} 条评论
                            </div>
                            </#if>
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
                <p>${user.nickname!}</p>
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

                        <a href="${rss_url!}">
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
                        <div><@postTag method="count">${count!0}</@postTag></div>
                    </div>
                    <div class="num-block">
                        <div>图片</div>
                        <div><@photoTag method="count">${count!0}</@photoTag></div>
                    </div>
                    <div class="num-block">
                        <div>评论</div>
                        <div><@commentTag method="count">${count!0}</@commentTag></div>
                    </div>
                    <div class="num-block">
                        <div>分类</div>
                        <div><@categoryTag method="count">${count!0}</@categoryTag></div>
                    </div>
                    <div class="num-block">
                        <div>标签</div>
                        <div><@tagTag method="count">${count!0}</@tagTag></div>
                    </div>
                    <div class="num-block">
                        <div>访客</div>
                        <div>123</div>
                    </div>
                </div>

            </div>

            <div class="card card-widget widget-tags">
                <a class="in-widget-tittle" href="${context!}tags">
                    <svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-tag"></use>
                    </svg>
                    标签云
                </a>
                <!-- .widget-tags .in-widget-content -->
                <div class="in-widget-content tags-cloud"></div>
            </div>

            <div class="card card-widget widget-category">
                <a class="in-widget-tittle" href="${context!}categories">
                    <svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-leibie"></use>
                    </svg>
                    文章分类
                </a>

                <div class="in-widget-content">
                    <ul>
            <@categoryTag method="list">
                <#if categories?? && categories?size gt 0>
                    <#list categories as category>
                    <#if category?index gt 3>
                        <li><a href="${context!}categories">...</a></li>
                    <#break></#if>
                        <li><a href="${category.fullPath!}"><span>${category.name}</span><span class="line-num">
                        <@postTag method="listByCategorySlug" categorySlug="${category.slug!}">
                            ${posts?size}
                        </@postTag>
                        </span></a></li>
                    </#list>
                    <#else>
                        <li>暂时还没有分类</li>
                </#if>
            </@categoryTag>
                    </ul>
                </div>
            </div>
        </div>
        
    </div>
</div>

</@layout>
