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

    <#--
        公共 head 代码，详情请参考：https://docs.halo.run/zh/developer-guide/theme/public-template-tag
        包含：Favicon，自定义 head 等
    -->

    <@global.head />

    <title>${title}</title>
</head>
<body>

<#nested >

<#include "footer.ftl">
</body>

<script>


</script>

</html>
</#macro>

