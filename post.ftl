<#include "module/macro.ftl">
<@layout title="${post.title!} - ${blog_title!}">
    <div class="post-sidebar">
        <div class="card card-post-widget widget-post-index">
            <div class="in-widget-tittle">
                <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-mulu"></use>
                </svg>
                文章目录
            </div>
            <div class="in-widget-content yun-scroll-bar" id="post-toc"></div>
        </div>
        <div class="card card-post-widget widget-post-count">
            <div class="in-widget-tittle">
                <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-ic_statistics_s"></use>
                </svg>
                统计信息
            </div>
            <div class="in-widget-content">
                <p>总字数<span class="count-all"></span></p>
                <p>您已阅读<span class="count-time"></span></p>
                <p>预计用时<span class="count-need-time"></span></p>
                <p>阅读进度<span class="read-process">0%</span></p>
                <div class="processbar">
                    <div class="processbar-process">
                        <svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-rocket__easyi"></use>
                        </svg>
                    </div>
                </div>

            </div>
        </div>

    </div>

        <div class="post-content">
            <div class="card card-post">
                <#assign postimg=theme_base+'/source/images/bg-cover.jpg'/>
                <#if post.thumbnail?? && post.thumbnail!=''><#assign postimg=post.thumbnail /></#if>
                <div class="post-info" style="background-image: url('${postimg!}');">
                    <span class="post-tittle">${post.title!}</span>
                    <div class="post-meta-group">
                        <div class="in-card-meta-item">
                            <svg class="icon" aria-hidden="true">
                                <use xlink:href="#icon-time"></use>
                            </svg>
                            <span>发表于: ${post.createTime?string("yyyy-MM-dd")}</span>
                        </div>
                        <div class="in-card-meta-item">
                            <svg class="icon" aria-hidden="true">
                                <use xlink:href="#icon-eye"></use>
                            </svg>
                            <span>热度: ${post.visits!}</span>
                        </div>
                        <div class="in-card-meta-item">
                            <svg class="icon" aria-hidden="true">
                                <use xlink:href="#icon-bi"></use>
                            </svg>
                            <span>总字数: <span class="count-all">0</span></span>
                        </div>
                    <#if post.categories?? && post.categories?size gt 0>
                        <div class="in-card-meta-item">
                            <svg class="icon" aria-hidden="true">
                                <use xlink:href="#icon-hardware"></use>
                            </svg>
                        <#list post.categories as category>
                            <a href="${category.fullPath!}"><span>${category.name!}</span></a>
                        </#list>
                        </div>
                    </#if>
                    </div>
                </div>
                <article class="post-wrapper">${post.formatContent!}</article>
            </div>

            <#if !post.disallowComment!false>
            <div class="card widget-post-comment">
                <#include "module/comment.ftl">
                <@comment post=post type="post" />
            </div>
            </#if>
        </div>


        <style>@media not screen and (max-width: 900px) { footer { padding-left: 20%; }}</style>

</@layout>
