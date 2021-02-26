<#include "module/macro.ftl">
<@layout title="分类：${category.name} - ${blog_title!}">

<div class="content page-content page-list-content">
    <h1><a href="${context!}categories">分类</a>：${category.name}</h1>
    <p>创建时间: ${category.createTime?string("yyyy-MM-dd")}, 文章数量: ${posts.content?size}</p>
    <main class="list">
    <#list posts.content as post>
        <a class="card card-list" href="${post.fullPath!}"> 
            <h3 class="in-card-tittle">${post.title!}</h3>
            <div class="in-card-meta">
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
            </div>
            <p class="limit-more-line">${post.summary!}</p>
        </a>
    </#list>
    </main>
</div>

<#if posts.totalPages gt 1>
    <@paginationTag method="categoryPosts" page="${posts.number}" total="${posts.totalPages}" display="3" slug="${category.slug!}">
        <#include "module/pagination.ftl">
    </@paginationTag>
</#if>


</@layout>
