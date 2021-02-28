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

                    <#if settings.index_post_img?? && settings.index_post_img!=''>
                        <#assign postimg=settings.index_post_img/>
                    <#else>
                        <#assign postimg=theme_base+'/source/images/bg-cover.jpg'/>
                    </#if>
                    
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
<#if !settings.enable_card_avatar?? || settings.enable_card_avatar>
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
</#if><#if !settings.enable_card_announce?? || settings.enable_card_announce>
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
</#if><#if !settings.enable_card_social?? || settings.enable_card_social>
            <div class="card card-widget widget-social">
                <div class="in-widget-tittle">
                    <svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-share"></use>
                    </svg>
                    分享 & 订阅
                </div>
                <div class="in-widget-content">

                    <p>分享</p>
                    <a href="https://service.weibo.com/share/share.php?url=${blog_url}&title=%E6%88%91%E5%8F%91%E7%8E%B0%E4%BA%86%E4%B8%80%E4%B8%AA%E5%BE%88%E6%A3%92%E7%9A%84%E7%BD%91%E7%AB%99" class="line-center" target="view_window">
                        <svg class="icon" aria-hidden="true" style="color: #E3262A;">
                            <use xlink:href="#icon-weibo"></use>
                        </svg>
                        <span>分享本页到 微博</span>
                    </a>

                    <a href="https://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=${blog_url}&sharesource=qzone&title=%E7%BD%91%E7%AB%99%E5%88%86%E4%BA%AB&summary=%E6%88%91%E5%8F%91%E7%8E%B0%E4%BA%86%E4%B8%80%E4%B8%AA%E5%BE%88%E6%A3%92%E7%9A%84%E7%BD%91%E7%AB%99" class="line-center" target="view_window">
                        <svg class="icon" aria-hidden="true" style="color: #FECE00;">
                            <use xlink:href="#icon-qzone"></use>
                        </svg>
                        <span>分享本页到 QQ空间</span>
                    </a>

                    <p>订阅</p>
<#--  
                    <a href="#" class="line-center star">
                        <svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-iconfont48"></use>
                        </svg>
                        <span>添加本页到 收藏夹</span>
                    </a>  -->

                    <div class="space-around">
                        <a target="view_window" href="${'http://wpa.qq.com/msgrd?v=3&uin=${settings.social_qq_number!\'10001\'}&site=qq&menu=yes'}">
                            <svg class="icon" aria-hidden="true">
                                <use xlink:href="#icon-QQ"></use>
                            </svg>
                        </a>

                        <a target="view_window" href="${'https://github.com/${settings.social_github_id!\'halo-dev\'}'}">
                            <svg class="icon" aria-hidden="true">
                                <use xlink:href="#icon-huaban88"></use>
                            </svg>
                        </a>

                        <a target="view_window" href="${'mailto:${settings.social_mail!\'10001@qq.com\'}'}">
                            <svg class="icon" aria-hidden="true">
                                <use xlink:href="#icon-mail"></use>
                            </svg>
                        </a>

                        <a target="view_window" href="${rss_url!}">
                            <svg class="icon" aria-hidden="true">
                                <use xlink:href="#icon-RSS"></use>
                            </svg>
                        </a>

                    </div>
                </div>
            </div>
</#if><#if !settings.enable_card_statistic?? || settings.enable_card_statistic>
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
                        <div>友链</div>
                        <div><@linkTag method="count">${count!0}</@linkTag></div>
                    </div>
                    <div class="num-block">
                        <div>图库</div>
                        <div><@photoTag method="count">${count!0}</@photoTag></div>
                    </div>
                </div>

            </div>
</#if><#if !settings.enable_card_tags?? || settings.enable_card_tags>
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
</#if><#if !settings.enable_card_category?? || settings.enable_card_category>
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
</#if>
        </div>
        
    </div>
</div>

</@layout>
