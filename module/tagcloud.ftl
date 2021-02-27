
<script>
    (function() {
        var wordCloudEm = document.querySelector('.tags-cloud');
        var list = [<@tagTag method="list"><#list tags as tag>['${tag.name!}',${tag.postCount!},'${tag.slug!}'],</#list></@tagTag>];
        
        if(list<=1) {
            var p = document.createElement('p');
            p.textContent = '无标签';
            wordCloudEm.appendChild(p);
            return;
        }

        WordCloud(
            wordCloudEm,
            {
                list: list,
                backgroundColor:'transparent',
                fontWeight: 'bold',
                weightFactor: function (size) {
                    return size + 12;
                },
                click: function(e){
                    window.open('/tags/'+e[2],'_self','');
                }
            }
        );
    })();
</script>