rm(list = ls())   
options(stringsAsFactors = F)
load(file = 'prepared_boxplot.rdata')
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
  ggsave(filename = paste0('boxplot_',y,'.png'))#批量输出，保存
}
