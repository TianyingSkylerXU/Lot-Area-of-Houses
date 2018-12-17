

Does Lot Area follow Benford's law?
========================================================
author: Tianying Xu
date: 2018/12/16
autosize: true
font-family: 'Helvetica'

Goals
========================================================

- Does Lot Area follow Benford's law?
- What may cause data to deviate against Benfrod's law?


Method
====================================
Data Source
- Housing price data on kaggle.com
  - competition to predict house prcie

***

Analysis
  - 1. Benford's law
  - 2. Similar Features
  

Benford's Law
========================================================
left: 70%
<img src="Final2-figure/unnamed-chunk-2-1.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" width="1820px" height="700px" />

***

- Digits from "10"-"15" and after "70" have deviations from the Benford's Law

Similar Feature: Summary of "suspects"
========================================================

```r
D_spts <- getSuspects(bfd_area,D)
summary(D_spts$LotArea)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  10000   10400   10800   11230   11342  115149 
```

Similar Feature:
========================================================
- 1) Outside Living Conditions
  - a. Zoning
  - b. Building Type
  - c. Linear Feet of Street Connected to Property
  - d. Quality
- 2) Outside Living Conditions
  - a. Garage Type
  - b. Screen Porch Area 
  - c. Total Rooms Above Grade
- 3) Time
- 4) Geography

1) a. Zoning
========================================================
left: 70%
<img src="Final2-figure/unnamed-chunk-4-1.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" width="1200px" height="300px" />
  
***
  
  - "RL" has more density among "suspects" than non-suspects



1) a. Zoning
========================================================
<img src="Final2-figure/unnamed-chunk-5-1.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" width="800px" height="500px" />

1) a. Zoning
========================================================
left: 70%
<img src="Final2-figure/unnamed-chunk-6-1.png" title="plot of chunk unnamed-chunk-6" alt="plot of chunk unnamed-chunk-6" width="1200px" height="500px" />
  
***

  - "RL" place: higher proportion of lot area start with digits "10" or "11", which may lead to deviation.


1) b. Building Type
========================================================
left: 70%
<img src="Final2-figure/unnamed-chunk-7-1.png" title="plot of chunk unnamed-chunk-7" alt="plot of chunk unnamed-chunk-7" width="1000px" height="450px" />
  
***
  
  - "1Fam" is more popular among suspects than among non-suspects.


1) c. Linear Feet of Street Connected
========================================================
left: 80%
<img src="Final2-figure/unnamed-chunk-8-1.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" width="1600px" height="450px" />
  
***
  
  - Most suspects has 100 feet long street connected to their property.


2) a. Garage Type
========================================================
left: 70%
<img src="Final2-figure/unnamed-chunk-9-1.png" title="plot of chunk unnamed-chunk-9" alt="plot of chunk unnamed-chunk-9" width="1200px" height="450px" />
  
***
  
  - "Suspects" usually have more garage attached than others.
  
  
2) b. Screen Porch Area 
========================================================
left: 70%
<img src="Final2-figure/unnamed-chunk-10-1.png" title="plot of chunk unnamed-chunk-10" alt="plot of chunk unnamed-chunk-10" width="1000px" height="450px" />
  
***
  
  - "Suspects" are more scattered, varing from 0 too almost 500 square feet.
  - Non-suspects are all under 300 square feet
  
  
2) c. Total Rooms Above Grade
========================================================
left: 70%
<img src="Final2-figure/unnamed-chunk-11-1.png" title="plot of chunk unnamed-chunk-11" alt="plot of chunk unnamed-chunk-11" width="1000px" height="300px" />
  
***
  
  - More rooms above grade among "suspects" than others.


2) d. Quality
========================================================
left: 70%
<img src="Final2-figure/unnamed-chunk-12-1.png" title="plot of chunk unnamed-chunk-12" alt="plot of chunk unnamed-chunk-12" width="1000px" height="450px" />
  
***
  
  - "Suspects" tend to have higher overall quality than others


3) Time
========================================================
<img src="Final2-figure/unnamed-chunk-13-1.png" title="plot of chunk unnamed-chunk-13" alt="plot of chunk unnamed-chunk-13" width="1000px" height="600px" />

3) Time
========================================================
left: 70%
<img src="Final2-figure/unnamed-chunk-14-1.png" title="plot of chunk unnamed-chunk-14" alt="plot of chunk unnamed-chunk-14" width="1000px" height="450px" />
  
***
  
  - "Suspects" are mostly built in late years
  - Percentage of "suspects" in all built houses every year increases since 1940.
  
  
4) Geography
========================================================
<img src="Final2-figure/unnamed-chunk-15-1.png" title="plot of chunk unnamed-chunk-15" alt="plot of chunk unnamed-chunk-15" width="950px" height="600px" />

4) Geography
========================================================
left: 70%
<img src="Final2-figure/unnamed-chunk-16-1.png" title="plot of chunk unnamed-chunk-16" alt="plot of chunk unnamed-chunk-16" width="1200px" height="650px" />

```
List of 60
 $ line                 :List of 6
  ..$ colour       : chr "black"
  ..$ size         : num 0.5
  ..$ linetype     : num 1
  ..$ lineend      : chr "butt"
  ..$ arrow        : logi FALSE
  ..$ inherit.blank: logi TRUE
  ..- attr(*, "class")= chr [1:2] "element_line" "element"
 $ rect                 :List of 5
  ..$ fill         : chr "white"
  ..$ colour       : chr "black"
  ..$ size         : num 0.5
  ..$ linetype     : num 1
  ..$ inherit.blank: logi TRUE
  ..- attr(*, "class")= chr [1:2] "element_rect" "element"
 $ text                 :List of 11
  ..$ family       : chr ""
  ..$ face         : chr "plain"
  ..$ colour       : chr "black"
  ..$ size         : num 11
  ..$ hjust        : num 0.5
  ..$ vjust        : num 0.5
  ..$ angle        : num 0
  ..$ lineheight   : num 0.9
  ..$ margin       : 'margin' num [1:4] 0pt 0pt 0pt 0pt
  .. ..- attr(*, "valid.unit")= int 8
  .. ..- attr(*, "unit")= chr "pt"
  ..$ debug        : logi FALSE
  ..$ inherit.blank: logi TRUE
  ..- attr(*, "class")= chr [1:2] "element_text" "element"
 $ axis.title.x         :List of 11
  ..$ family       : NULL
  ..$ face         : chr "bold"
  ..$ colour       : NULL
  ..$ size         : num 13
  ..$ hjust        : NULL
  ..$ vjust        : num 1
  ..$ angle        : NULL
  ..$ lineheight   : NULL
  ..$ margin       : 'margin' num [1:4] 2.75pt 0pt 0pt 0pt
  .. ..- attr(*, "valid.unit")= int 8
  .. ..- attr(*, "unit")= chr "pt"
  ..$ debug        : NULL
  ..$ inherit.blank: logi FALSE
  ..- attr(*, "class")= chr [1:2] "element_text" "element"
 $ axis.title.x.top     :List of 11
  ..$ family       : NULL
  ..$ face         : NULL
  ..$ colour       : NULL
  ..$ size         : NULL
  ..$ hjust        : NULL
  ..$ vjust        : num 0
  ..$ angle        : NULL
  ..$ lineheight   : NULL
  ..$ margin       : 'margin' num [1:4] 0pt 0pt 2.75pt 0pt
  .. ..- attr(*, "valid.unit")= int 8
  .. ..- attr(*, "unit")= chr "pt"
  ..$ debug        : NULL
  ..$ inherit.blank: logi TRUE
  ..- attr(*, "class")= chr [1:2] "element_text" "element"
 $ axis.title.y         :List of 11
  ..$ family       : NULL
  ..$ face         : chr "bold"
  ..$ colour       : NULL
  ..$ size         : num 15
  ..$ hjust        : NULL
  ..$ vjust        : num 1
  ..$ angle        : num 90
  ..$ lineheight   : NULL
  ..$ margin       : 'margin' num [1:4] 0pt 2.75pt 0pt 0pt
  .. ..- attr(*, "valid.unit")= int 8
  .. ..- attr(*, "unit")= chr "pt"
  ..$ debug        : NULL
  ..$ inherit.blank: logi FALSE
  ..- attr(*, "class")= chr [1:2] "element_text" "element"
 $ axis.title.y.right   :List of 11
  ..$ family       : NULL
  ..$ face         : NULL
  ..$ colour       : NULL
  ..$ size         : NULL
  ..$ hjust        : NULL
  ..$ vjust        : num 0
  ..$ angle        : num -90
  ..$ lineheight   : NULL
  ..$ margin       : 'margin' num [1:4] 0pt 0pt 0pt 2.75pt
  .. ..- attr(*, "valid.unit")= int 8
  .. ..- attr(*, "unit")= chr "pt"
  ..$ debug        : NULL
  ..$ inherit.blank: logi TRUE
  ..- attr(*, "class")= chr [1:2] "element_text" "element"
 $ axis.text            :List of 11
  ..$ family       : NULL
  ..$ face         : NULL
  ..$ colour       : chr "grey30"
  ..$ size         : 'rel' num 0.8
  ..$ hjust        : NULL
  ..$ vjust        : NULL
  ..$ angle        : NULL
  ..$ lineheight   : NULL
  ..$ margin       : NULL
  ..$ debug        : NULL
  ..$ inherit.blank: logi TRUE
  ..- attr(*, "class")= chr [1:2] "element_text" "element"
 $ axis.text.x          :List of 11
  ..$ family       : NULL
  ..$ face         : chr "bold"
  ..$ colour       : NULL
  ..$ size         : num 13
  ..$ hjust        : NULL
  ..$ vjust        : num 0.5
  ..$ angle        : num 45
  ..$ lineheight   : NULL
  ..$ margin       : 'margin' num [1:4] 2.2pt 0pt 0pt 0pt
  .. ..- attr(*, "valid.unit")= int 8
  .. ..- attr(*, "unit")= chr "pt"
  ..$ debug        : NULL
  ..$ inherit.blank: logi FALSE
  ..- attr(*, "class")= chr [1:2] "element_text" "element"
 $ axis.text.x.top      :List of 11
  ..$ family       : NULL
  ..$ face         : NULL
  ..$ colour       : NULL
  ..$ size         : NULL
  ..$ hjust        : NULL
  ..$ vjust        : num 0
  ..$ angle        : NULL
  ..$ lineheight   : NULL
  ..$ margin       : 'margin' num [1:4] 0pt 0pt 2.2pt 0pt
  .. ..- attr(*, "valid.unit")= int 8
  .. ..- attr(*, "unit")= chr "pt"
  ..$ debug        : NULL
  ..$ inherit.blank: logi TRUE
  ..- attr(*, "class")= chr [1:2] "element_text" "element"
 $ axis.text.y          :List of 11
  ..$ family       : NULL
  ..$ face         : chr "bold"
  ..$ colour       : NULL
  ..$ size         : num 13
  ..$ hjust        : num 1
  ..$ vjust        : num 0.5
  ..$ angle        : num 45
  ..$ lineheight   : NULL
  ..$ margin       : 'margin' num [1:4] 0pt 2.2pt 0pt 0pt
  .. ..- attr(*, "valid.unit")= int 8
  .. ..- attr(*, "unit")= chr "pt"
  ..$ debug        : NULL
  ..$ inherit.blank: logi FALSE
  ..- attr(*, "class")= chr [1:2] "element_text" "element"
 $ axis.text.y.right    :List of 11
  ..$ family       : NULL
  ..$ face         : NULL
  ..$ colour       : NULL
  ..$ size         : NULL
  ..$ hjust        : num 0
  ..$ vjust        : NULL
  ..$ angle        : NULL
  ..$ lineheight   : NULL
  ..$ margin       : 'margin' num [1:4] 0pt 0pt 0pt 2.2pt
  .. ..- attr(*, "valid.unit")= int 8
  .. ..- attr(*, "unit")= chr "pt"
  ..$ debug        : NULL
  ..$ inherit.blank: logi TRUE
  ..- attr(*, "class")= chr [1:2] "element_text" "element"
 $ axis.ticks           :List of 6
  ..$ colour       : chr "grey20"
  ..$ size         : NULL
  ..$ linetype     : NULL
  ..$ lineend      : NULL
  ..$ arrow        : logi FALSE
  ..$ inherit.blank: logi TRUE
  ..- attr(*, "class")= chr [1:2] "element_line" "element"
 $ axis.ticks.length    : 'unit' num 2.75pt
  ..- attr(*, "valid.unit")= int 8
  ..- attr(*, "unit")= chr "pt"
 $ axis.line            :List of 6
  ..$ colour       : chr "black"
  ..$ size         : 'rel' num 1
  ..$ linetype     : NULL
  ..$ lineend      : NULL
  ..$ arrow        : logi FALSE
  ..$ inherit.blank: logi TRUE
  ..- attr(*, "class")= chr [1:2] "element_line" "element"
 $ axis.line.x          : NULL
 $ axis.line.y          : NULL
 $ legend.background    :List of 5
  ..$ fill         : NULL
  ..$ colour       : logi NA
  ..$ size         : NULL
  ..$ linetype     : NULL
  ..$ inherit.blank: logi TRUE
  ..- attr(*, "class")= chr [1:2] "element_rect" "element"
 $ legend.margin        : 'margin' num [1:4] 5.5pt 5.5pt 5.5pt 5.5pt
  ..- attr(*, "valid.unit")= int 8
  ..- attr(*, "unit")= chr "pt"
 $ legend.spacing       : 'unit' num 11pt
  ..- attr(*, "valid.unit")= int 8
  ..- attr(*, "unit")= chr "pt"
 $ legend.spacing.x     : NULL
 $ legend.spacing.y     : NULL
 $ legend.key           : list()
  ..- attr(*, "class")= chr [1:2] "element_blank" "element"
 $ legend.key.size      : 'unit' num 1.2lines
  ..- attr(*, "valid.unit")= int 3
  ..- attr(*, "unit")= chr "lines"
 $ legend.key.height    : NULL
 $ legend.key.width     : NULL
 $ legend.text          :List of 11
  ..$ family       : NULL
  ..$ face         : chr "bold"
  ..$ colour       : NULL
  ..$ size         : num 15
  ..$ hjust        : NULL
  ..$ vjust        : NULL
  ..$ angle        : NULL
  ..$ lineheight   : NULL
  ..$ margin       : NULL
  ..$ debug        : NULL
  ..$ inherit.blank: logi FALSE
  ..- attr(*, "class")= chr [1:2] "element_text" "element"
 $ legend.text.align    : NULL
 $ legend.title         :List of 11
  ..$ family       : NULL
  ..$ face         : chr "bold"
  ..$ colour       : NULL
  ..$ size         : num 15
  ..$ hjust        : num 0
  ..$ vjust        : NULL
  ..$ angle        : NULL
  ..$ lineheight   : NULL
  ..$ margin       : NULL
  ..$ debug        : NULL
  ..$ inherit.blank: logi FALSE
  ..- attr(*, "class")= chr [1:2] "element_text" "element"
 $ legend.title.align   : NULL
 $ legend.position      : chr "right"
 $ legend.direction     : NULL
 $ legend.justification : chr "center"
 $ legend.box           : NULL
 $ legend.box.margin    : 'margin' num [1:4] 0cm 0cm 0cm 0cm
  ..- attr(*, "valid.unit")= int 1
  ..- attr(*, "unit")= chr "cm"
 $ legend.box.background: list()
  ..- attr(*, "class")= chr [1:2] "element_blank" "element"
 $ legend.box.spacing   : 'unit' num 11pt
  ..- attr(*, "valid.unit")= int 8
  ..- attr(*, "unit")= chr "pt"
 $ panel.background     :List of 5
  ..$ fill         : chr "white"
  ..$ colour       : logi NA
  ..$ size         : NULL
  ..$ linetype     : NULL
  ..$ inherit.blank: logi TRUE
  ..- attr(*, "class")= chr [1:2] "element_rect" "element"
 $ panel.border         : list()
  ..- attr(*, "class")= chr [1:2] "element_blank" "element"
 $ panel.spacing        : 'unit' num 5.5pt
  ..- attr(*, "valid.unit")= int 8
  ..- attr(*, "unit")= chr "pt"
 $ panel.spacing.x      : NULL
 $ panel.spacing.y      : NULL
 $ panel.grid           :List of 6
  ..$ colour       : chr "grey92"
  ..$ size         : NULL
  ..$ linetype     : NULL
  ..$ lineend      : NULL
  ..$ arrow        : logi FALSE
  ..$ inherit.blank: logi TRUE
  ..- attr(*, "class")= chr [1:2] "element_line" "element"
 $ panel.grid.minor     : list()
  ..- attr(*, "class")= chr [1:2] "element_blank" "element"
 $ panel.ontop          : logi FALSE
 $ plot.background      :List of 5
  ..$ fill         : NULL
  ..$ colour       : chr "white"
  ..$ size         : NULL
  ..$ linetype     : NULL
  ..$ inherit.blank: logi TRUE
  ..- attr(*, "class")= chr [1:2] "element_rect" "element"
 $ plot.title           :List of 11
  ..$ family       : NULL
  ..$ face         : chr "bold"
  ..$ colour       : NULL
  ..$ size         : num 17
  ..$ hjust        : num 0.5
  ..$ vjust        : num 1
  ..$ angle        : NULL
  ..$ lineheight   : NULL
  ..$ margin       : 'margin' num [1:4] 0pt 0pt 5.5pt 0pt
  .. ..- attr(*, "valid.unit")= int 8
  .. ..- attr(*, "unit")= chr "pt"
  ..$ debug        : NULL
  ..$ inherit.blank: logi FALSE
  ..- attr(*, "class")= chr [1:2] "element_text" "element"
 $ plot.subtitle        :List of 11
  ..$ family       : NULL
  ..$ face         : chr "bold"
  ..$ colour       : NULL
  ..$ size         : num 15
  ..$ hjust        : num 1
  ..$ vjust        : num 1
  ..$ angle        : NULL
  ..$ lineheight   : NULL
  ..$ margin       : 'margin' num [1:4] 0pt 0pt 5.5pt 0pt
  .. ..- attr(*, "valid.unit")= int 8
  .. ..- attr(*, "unit")= chr "pt"
  ..$ debug        : NULL
  ..$ inherit.blank: logi FALSE
  ..- attr(*, "class")= chr [1:2] "element_text" "element"
 $ plot.caption         :List of 11
  ..$ family       : NULL
  ..$ face         : NULL
  ..$ colour       : NULL
  ..$ size         : 'rel' num 0.8
  ..$ hjust        : num 1
  ..$ vjust        : num 1
  ..$ angle        : NULL
  ..$ lineheight   : NULL
  ..$ margin       : 'margin' num [1:4] 5.5pt 0pt 0pt 0pt
  .. ..- attr(*, "valid.unit")= int 8
  .. ..- attr(*, "unit")= chr "pt"
  ..$ debug        : NULL
  ..$ inherit.blank: logi TRUE
  ..- attr(*, "class")= chr [1:2] "element_text" "element"
 $ plot.tag             :List of 11
  ..$ family       : NULL
  ..$ face         : NULL
  ..$ colour       : NULL
  ..$ size         : 'rel' num 1.2
  ..$ hjust        : num 0.5
  ..$ vjust        : num 0.5
  ..$ angle        : NULL
  ..$ lineheight   : NULL
  ..$ margin       : NULL
  ..$ debug        : NULL
  ..$ inherit.blank: logi TRUE
  ..- attr(*, "class")= chr [1:2] "element_text" "element"
 $ plot.tag.position    : chr "topleft"
 $ plot.margin          : 'margin' num [1:4] 5.5pt 5.5pt 5.5pt 5.5pt
  ..- attr(*, "valid.unit")= int 8
  ..- attr(*, "unit")= chr "pt"
 $ strip.background     :List of 5
  ..$ fill         : chr "white"
  ..$ colour       : chr "black"
  ..$ size         : 'rel' num 2
  ..$ linetype     : NULL
  ..$ inherit.blank: logi TRUE
  ..- attr(*, "class")= chr [1:2] "element_rect" "element"
 $ strip.placement      : chr "inside"
 $ strip.text           :List of 11
  ..$ family       : NULL
  ..$ face         : NULL
  ..$ colour       : chr "grey10"
  ..$ size         : 'rel' num 0.8
  ..$ hjust        : NULL
  ..$ vjust        : NULL
  ..$ angle        : NULL
  ..$ lineheight   : NULL
  ..$ margin       : 'margin' num [1:4] 4.4pt 4.4pt 4.4pt 4.4pt
  .. ..- attr(*, "valid.unit")= int 8
  .. ..- attr(*, "unit")= chr "pt"
  ..$ debug        : NULL
  ..$ inherit.blank: logi TRUE
  ..- attr(*, "class")= chr [1:2] "element_text" "element"
 $ strip.text.x         : NULL
 $ strip.text.y         :List of 11
  ..$ family       : NULL
  ..$ face         : NULL
  ..$ colour       : NULL
  ..$ size         : NULL
  ..$ hjust        : NULL
  ..$ vjust        : NULL
  ..$ angle        : num -90
  ..$ lineheight   : NULL
  ..$ margin       : NULL
  ..$ debug        : NULL
  ..$ inherit.blank: logi TRUE
  ..- attr(*, "class")= chr [1:2] "element_text" "element"
 $ strip.switch.pad.grid: 'unit' num 2.75pt
  ..- attr(*, "valid.unit")= int 8
  ..- attr(*, "unit")= chr "pt"
 $ strip.switch.pad.wrap: 'unit' num 2.75pt
  ..- attr(*, "valid.unit")= int 8
  ..- attr(*, "unit")= chr "pt"
 $ panel.grid.major     : list()
  ..- attr(*, "class")= chr [1:2] "element_blank" "element"
 - attr(*, "class")= chr [1:2] "theme" "gg"
 - attr(*, "complete")= logi TRUE
 - attr(*, "validate")= logi TRUE
```
  
***
  
  - Neighborhood Northwest Ames and has the highest proportion of "suspects"
  - A large portion of "suspects" are in this neighborhood. 


Conclusion
========================================================
 - Lot area in this dataset does not follow Benford's law.
 - Deviation from Benford's law may be due to the high proportion of low reidential density places, especially neighborhood Northwest Ames.
 - There are many similar features among "suspects".
