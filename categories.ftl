<#include "module/macro.ftl">
<@layout title="分类列表 - ${blog_title!}">
    <div class="content page-content page-categories">
        <h1>分类列表</h1>
        <div class="card card-categories widget-category">
            <div class="in-widget-content">
                <ul>
        <@categoryTag method="list">
            <#if categories?? && categories?size gt 0>
                <#list categories as category>
                    <li><a href="${category.fullPath!}">${category.name}</a></li>
                </#list>
            </#if>
        </@categoryTag>
                </ul>
            </div>
        </div>
    </div>
    
</@layout>
