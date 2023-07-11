args<-commandArgs(trailingOnly=T)
score<-as.matrix(read.csv(args[1], header=T))
score[ ,1]<-as.numeric(score[ ,1])
FP<-as.matrix(read.csv(args[2], header=T, sep="\t"))
cutoff<-as.numeric(args[3])
posi<-matrix(ncol=3)
neg<-matrix(ncol=3)
m<-matrix(ncol=4,nrow=nrow(FP))
for(i in 1:nrow(score)){
  if(as.numeric(score[i,1])>=cutoff){m[i, ]<-c(FP[i,1:2],score[i,1],"Positive")} else{m[i, ]<-c(FP[i,1:2],score[i,1],"Negative")}
                 }
colnames(m)<-c("ID","Smiles", "Score","Status") 
p<-grep("Positive",m[ ,4])
if(length(p)==1){
hits<-matrix(m[p, ],nrow=1)
colnames(hits)<-colnames(m)
          write.table(hits, args[4], col.names=T, row.names=F, quote=F, sep="\t")
           }
if(length(p)>1){write.table(m[p, ], args[4], col.names=T, row.names=F, quote=F, sep="\t")}
write.table(m, "score.txt", col.names=T, row.names=F, quote=F, sep="\t")
