# Boxplot
* 批量画箱式图
* 准备数据： re 
 ![image](https://user-images.githubusercontent.com/78598588/110113323-e81f0400-7ded-11eb-81ee-7dbf27f40686.png)
* 【模仿格式即可，列为表达量，行为样本，要有一列分组代表：这里为 event 】
* 参数：https://rpkgs.datanovia.com/ggpubr/reference/ggboxplot.html


```r
library(ggpubr) 
i=1
for (i in 1:7) {
y=as.character(colnames(re[i]))
p1 = ggboxplot(re, x = "event", y = y,
               color = "event", 
               palette = 'jco',
               add = "jitter")
my_comparisons=list(c('Normal','Tumor'))#指定比较对象
p1+stat_compare_means(comparisons = my_comparisons)#默认非参检验，也可指定
ggsave(filename = paste0('boxplot_',y,'.png')) #批量输出，保存
}
```
* ![image](https://user-images.githubusercontent.com/78598588/110113600-4c41c800-7dee-11eb-9a82-280db8d0f153.png)
