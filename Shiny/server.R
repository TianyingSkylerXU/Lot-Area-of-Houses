pacman::p_load(benford.analysis, dplyr, ggplot2, stringr,reshape2)
D <- read.csv("train.csv",header=T)
bfd_area <- benford(D$LotArea)
suspects_area <- getSuspects(bfd_area, D,how.many = 2)
D1 <- D %>% 
  mutate(ifsuspect=ifelse(Id %in% suspects_area$Id,1,0))

function(input, output) {
  output$plot_bfd <- renderPlot({plot(bfd_area)})
  output$bfd_results <- renderPrint({
    bfd_area})
  
  output$Density_Plot1 <- renderPlot({
    D_D <- D1 %>% select(input$Factors,ifsuspect)
    names(D_D) <- c("x","ifsuspect")
    ggplot(D_D, aes(x=x,fill=factor(ifsuspect),group=factor(ifsuspect)))+
      geom_histogram(stat="density",position="dodge",bins = 1000) +
      xlab(input$Factors)+
      guides(fill=guide_legend(title="suspect or not"))+
      theme_classic()+
      ggtitle(paste0("Density Plots of ",input$Factors),subtitle = "----between suspects and non-suspects")+
      theme(plot.title = element_text(size=17, face="bold",hjust = 0.5),plot.subtitle = element_text(size=15, face="bold",hjust = 1),
            axis.title.x = element_text(face="bold",  size=13), axis.title.y = element_text(face="bold",size=15),
            axis.text.x  = element_text(face="bold",angle=45,vjust=0.5,size=13),axis.text.y  = element_text(face="bold",vjust=0.5,size=13))
  })
  
  output$Violin_Plot <- renderPlot({
    D_V <- D1 %>% select(input$Factors_cat,LotArea)
    names(D_V) <- c("x","LotArea")
    ggplot(data = D_V) +
      aes(x = x, y = LotArea) +
      geom_violin(scale = "area", adjust = 1, fill = "skyblue")+
      theme_classic()+
      ggtitle(paste0("Violin Plot for ", input$Factors," data"))+
      theme(plot.title = element_text(size=17, face="bold",hjust = 0.5),plot.subtitle = element_text(size=15, face="bold",hjust = 1),
            axis.title.x = element_text(face="bold",  size=13), axis.title.y = element_text(face="bold",size=15),
            axis.text.x  = element_text(face="bold",angle=45,vjust=0.5,size=13),axis.text.y  = element_text(face="bold",vjust=0.5,size=13), 
            legend.title=element_text(face="bold",size=15), legend.text = element_text(face="bold",size=15))+
      xlab(input$Factors_cat)
    })
  
  output$Density_Plot2 <- renderPlot({
    D_D2 <- D1 %>% select(input$Factors_cat,LotArea)
    names(D_D2) <- c("g","LotArea")
    ggplot(D_D2,aes(x=LotArea,y=..density..,fill=factor(g),group=factor(g)))+
      geom_density(alpha=0.5)+
      guides(fill=guide_legend(title=paste0(input$Factor,"Values")))+
      theme_classic()+
      ggtitle("Density Plots of Lot Area",subtitle = "----among factors")+
      theme(plot.title = element_text(size=17, face="bold",hjust = 0.5),plot.subtitle = element_text(size=15, face="bold",hjust = 1),
            axis.title.x = element_text(face="bold",  size=13), axis.title.y = element_text(face="bold",size=15),
            axis.text.x  = element_text(face="bold",angle=45,vjust=0.5,size=13),axis.text.y  = element_text(face="bold",vjust=0.5,size=13), 
            legend.title=element_text(face="bold",size=15), legend.text = element_text(face="bold",size=15))+
      xlab(input$Factors_cat)
  })
  
  output$Percent <- renderPlot({
    D_P1 <- D1 %>% select(input$Factors_cat,ifsuspect)
    names(D_P1) <- c("x","ifsuspect")
    ggplot(D_P1,mapping=aes(x=factor(x),fill=factor(ifsuspect)))+
      geom_bar(position="fill")+
      guides(fill=guide_legend(title="suspect or not"))+
      xlab("factor values")+ylab("Percentage")+
      theme_classic()+
      ggtitle("Percentage of suspects' Lot Area", subtitle = "----among factors")+
      theme(plot.title = element_text(size=17, face="bold",hjust = 0.5),plot.subtitle = element_text(size=15, face="bold",hjust = 1),
            axis.title.x = element_text(face="bold",  size=13), axis.title.y = element_text(face="bold",size=15),
            axis.text.x  = element_text(face="bold",angle=45,vjust=0.5,size=13),axis.text.y  = element_text(face="bold",vjust=0.5,size=13), 
            legend.title=element_text(face="bold",size=15), legend.text = element_text(face="bold",size=15))
  })
 
  output$Scatter_Plot <- renderPlot({
    D_SP <- D1 %>% select(input$Factors_num,LotArea)
    names(D_SP) <- c("x","LotArea")
    ggplot(D_SP, aes(x=x,y=LotArea,color=x)) +
      geom_point()+
      xlab(input$Factors_num)+
      theme_classic()+
      ggtitle("Scatter Plot of Lot Area", subtitle = "----among factors")+
      theme(plot.title = element_text(size=17, face="bold",hjust = 0.5),plot.subtitle = element_text(size=15, face="bold",hjust = 1),
            axis.title.x = element_text(face="bold",  size=13), axis.title.y = element_text(face="bold",size=15),
            axis.text.x  = element_text(face="bold",angle=45,vjust=0.5,size=13),axis.text.y  = element_text(face="bold",vjust=0.5,size=13), 
            legend.title=element_text(face="bold",size=15), legend.text = element_text(face="bold",size=15))
  })
  
  output$Per_num <- renderPlot({
    D_PN <- D1 %>% select(input$Factors_num,ifsuspect)
    names(D_PN) <- c("x","ifsuspect")
    D_PN <- D_PN %>% 
      group_by(x) %>% 
      summarise(per=sum(ifsuspect)/n())
    D_PN[is.na(D_PN)] <- 0
    ggplot(D_PN, aes(x=x,y=per,color=x)) +
      geom_point(size=2)+
      xlab(input$Factors_num)+
      theme_classic()+
      ggtitle("Percentage of Suspects", subtitle = "----among factors")+
      theme(plot.title = element_text(size=17, face="bold",hjust = 0.5),plot.subtitle = element_text(size=15, face="bold",hjust = 1),
            axis.title.x = element_text(face="bold",  size=13), axis.title.y = element_text(face="bold",size=15),
            axis.text.x  = element_text(face="bold",angle=45,vjust=0.5,size=13),axis.text.y  = element_text(face="bold",vjust=0.5,size=13))
  })
    
    output$ht <- renderPlot({
      D_ht <- D1 %>% select(LotArea, LotFrontage, ScreenPorch, TotRmsAbvGrd, OverallQual)
      D_ht[is.na(D_ht)] <- 0
      corr <- melt(cor(D_ht))
      
      ggplot(data = corr, mapping=aes(x=Var1, y=Var2, fill=value)) +
        geom_tile(color = "white")+
        scale_fill_gradient2(low = "navyblue", high = "darkorange", mid = "white",
                             midpoint = 0, limit = c(-1,1), space = "Lab",
                             name="Correlation") +
        ggtitle("Correlation")+
        theme_classic()+
        theme(plot.title = element_text(size=17, face="bold",hjust = 0.5),plot.subtitle = element_text(size=15, face="bold",hjust = 1),
              axis.title.x = element_text(face="bold",  size=13), axis.title.y = element_text(face="bold",size=15),
              axis.text.x  = element_text(face="bold",angle=45,vjust=0.5,size=13),axis.text.y  = element_text(face="bold",vjust=0.5,size=13),
              legend.title=element_text(face="bold",size=15), legend.text = element_text(face="bold",size=15))
    })
}











