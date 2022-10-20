install.packages("pheatmap")
install.packages(c("FactoMineR","factoextra"))

A <- newDATA %>% 
  filter(State =='AZ')
B <- newDATA %>% 
  filter(State =='CA')
C <- newDATA %>% 
  filter(State =='FL')
D <- newDATA %>% 
  filter(State =='GA')
E <- newDATA %>% 
  filter(State =='LA')
F <- newDATA %>% 
  filter(State =='NC')
G <- newDATA %>% 
  filter(State =='TX')

#Co-relation
cor(newDATA$Mileage,newDATA$fc,method = "pearson",)
plot(newDATA$Mileage,newDATA$fc)
cor(A$Mileage,A$fc,method = "pearson",)
cor(B$Mileage,B$fc,method = "pearson",)
cor(C$Mileage,C$fc,method = "pearson",)
cor(D$Mileage,D$fc,method = "pearson",)
cor(E$Mileage,E$fc,method = "pearson",)
cor(F$Mileage,F$fc,method = "pearson",)
cor(G$Mileage,G$fc,method = "pearson",)

#Regression
model<-lm(newDATA$Mileage~newDATA$fc,data = newDATA)
summary(model)
plot(newDATA$Mileage,newDATA$fc)
abline(lm(newDATA$Mileage~newDATA$fc,data = newDATA))
plot(newDATA$Mileage,newDATA$fc)

#Comparison-T-test
data1<-subset(newDATA$Mileage,newDATA$State=="CA")
data2<-subset(newDATA$Mileage,newDATA$State=="TX")
t.test(data1,data2)

#comparison ANOVA
aov.model<-aov()

#data visualization
pheatmap(newDATA[,1:4],
         cluster_rows=TRUE,
         cluster_cols=TRUE,
         clustering_method="complete")

pca<-PCA(newDATA[,1:4],scale.unit = TRUE,ncp=5)
fviz_pca_ind(pca,col.ind = newDATA$State)