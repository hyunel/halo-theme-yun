<#include "module/macro.ftl">
<@layout title="归档 - ${blog_title!}">
    <div class="content page-content page-archives-content">
        <h1>文章归档</h1>
        <div class="card card-timeline">
            <div class="cd-timeline">
        <@postTag method="archive" type="month">
            <#list archives as archive>
                <div class="cd-timeline-block">
                    <div class="cd-timeline-dot"></div>
                    <div class="cd-timeline-content">
                        <span class="cd-date">${archive.year?c} 年 ${archive.month?c} 月</span>
                        <ul class="yun-scroll-bar">
                        <#list archive.posts?sort_by("createTime")?reverse as post>
                            <li>
                                <h2><a href="${post.fullPath!}">${post.title!}</a></h2>
                                <p class="limit-more-line"><span>Day ${post.createTime?string("dd")}</span>${post.summary!}</p>
                            </li>
                        </#list>
                        </ul>
                    </div>
                </div>
            </#list>
        </@postTag>
                <div class="cd-timeline-block">
                    <div class="cd-timeline-dot"></div>
        
                    <div class="cd-timeline-content">
                        <h2>Final Section</h2>
                        <p>This is the end of archives!</p>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <style>footer {display: none;}</style>

    <#--  <#if posts.totalPages gt 1>
        <ul>
            <@paginationTag method="archives" page="${posts.number}" total="${posts.totalPages}" display="3">
                <#if pagination.hasPrev>
                    <li>
                        <a href="${pagination.prevPageFullPath!}">
                            上一页
                        </a>
                    </li>
                </#if>
                <#list pagination.rainbowPages as number>
                    <li>
                        <#if number.isCurrent>
                            <span class="current">第 ${number.page!} 页</span>
                        <#else>
                            <a href="${number.fullPath!}">第 ${number.page!} 页</a>
                        </#if>
                    </li>
                </#list>
                <#if pagination.hasNext>
                    <li>
                        <a href="${pagination.nextPageFullPath!}">
                            下一页
                        </a>
                    </li>
                </#if>
            </@paginationTag>
        </ul>
    <#else>
        <span>当前只有一页</span>
    </#if>  -->
</@layout>
