<#macro layout title>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="${meta_keywords!}"/>
    <meta name="description" content="${meta_description!}" />
    
    <link rel="stylesheet" href="${theme_base!}/source/css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/highlightjs@9.16.2/styles/github.css">

    <#--
        公共 head 代码，详情请参考：https://docs.halo.run/zh/developer-guide/theme/public-template-tag
        包含：Favicon，自定义 head 等
    -->

    <@global.head />

    <title>${title}</title>
</head>
<body>


<#if !is_index??>
    <div class="container container--top">
        <div class="cover"><#include "navbar.ftl"></div>
</#if>

<#nested >

<#include "floatbar.ftl">
<#include "footer.ftl">

<#if !is_index??>
    </div>
</#if>

</body>


<#if is_index??><script>var is_index=true;</script></#if>
<#if is_post??><script>var is_post=true;</script></#if>
<#if is_sheet??><script>var is_sheet=true;</script></#if>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/animejs@3.2.1/lib/anime.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/toastr.min.js"></script>

<#if is_index??>
<script src="https://cdn.jsdelivr.net/npm/wordcloud@1.1.2/src/wordcloud2.min.js"></script>
<#elseif is_post?? || is_sheet??>
<script src="https://cdn.jsdelivr.net/npm/clipboard@2.0.6/dist/clipboard.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/highlightjs@9.16.2/highlight.pack.min.js"></script>
</#if>

<script src="${theme_base!}/source/js/iconfont.js"></script>
<script src="${theme_base!}/source/js/main.js"></script>
</html>
</#macro>

