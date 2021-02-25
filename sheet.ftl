<#include "module/macro.ftl">
<@layout title="${sheet.title!} - ${blog_title!}">
    <div class="post-content sheet-content">
        <div class="card card-post">
            <#assign postimg=theme_base+'/source/images/bg-cover.jpg'/>
            <#if sheet.thumbnail?? && sheet.thumbnail!=''><#assign postimg=sheet.thumbnail /></#if>
            <div class="post-info" style="background-image: url('${postimg!}');">
                <span class="post-tittle">${sheet.title!}</span>
                <div class="post-meta-group">
                    <div class="in-card-meta-item">
                        <svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-time"></use>
                        </svg>
                        <span>发表于: ${sheet.createTime?string("yyyy-MM-dd")}</span>
                    </div>
                    <div class="in-card-meta-item">
                        <svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-eye"></use>
                        </svg>
                        <span>热度: ${sheet.visits!}</span>
                    </div>
                    <div class="in-card-meta-item">
                        <svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-bi"></use>
                        </svg>
                        <span>总字数: <span class="count-all">0</span></span>
                    </div>
                <#if sheet.categories?? && sheet.categories?size gt 0>
                    <div class="in-card-meta-item">
                        <svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-hardware"></use>
                        </svg>
                    <#list sheet.categories as category>
                        <a href="${category.fullPath!}"><span>${category.name!}</span></a>
                    </#list>
                    </div>
                </#if>
                </div>
            </div>
            <article class="post-wrapper">${sheet.formatContent!}</article>
        </div>

        <#if !sheet.disallowComment!false>
        <div class="card widget-post-comment">
            <#include "module/comment.ftl">
            <@comment post=sheet type="sheet" />
        </div>
        </#if>
    </div>
</@layout>
