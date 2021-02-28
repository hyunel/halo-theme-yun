<#include "module/macro.ftl">
<@layout title="友情链接 - ${blog_title!}">

<@linkTag method="listByRandom">
<div class="content page-content page-link-content">
    <h1>友链</h1>
<#if links?? && links?size gt 0>
    <p>友链总数: ${links?size}</p>

    <main class="card card-links">
    <#list links as link>
        <a href="${link.url}" class="card-link">
            <img src="${link.logo!''}"></img>
            <div>
                <h3 class="link-name">${link.name}</h3>
                <p class="link-info limit-more-line">${link.description}</p>
            </div>
        </a>
    </#list>
    </main>
    <#else>
    <p>还没有一个友链</p>
</#if>
</div>
</@linkTag>

</@layout>
