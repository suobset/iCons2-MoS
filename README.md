# iCons2-MoS

## Mapping Transportation Accessibility in Boston


### Semester

Spring 2022

### Team Members
<img src="https://raw.githubusercontent.com/suobset/iCons2-MoS/main/data/RepoAssets/IMG_7096.jpg"></img>

Kushagra Srivastava, Jack Minella, Gabrielle Walczak, Cleo Hein, and Yi Ding 


---

### Project Overview
The final product is an interactive website, which includes a "*Blob* map" will help users look through the accessibility for public transit at every location in Boston. 

The data that have been collected are presented as a [Voronoi Diagram](https://en.wikipedia.org/wiki/Voronoi_diagram#:~:text=In%20mathematics%2C%20a%20Voronoi%20diagram,%2C%20sites%2C%20or%20generators) overlaying every subway line of the MBTA. The Voronoi polygons on the map represents the *blobs*. 

As the user hovers over a *blob* on the map on a computer or interactive digital display, an accessibility score between 0-100 will be displayed, to help the viewer judge the accessibility of a region. A high score means those living within the area have a greater opportunity to reduce their carbon footprint. 

Based on the *blob* score, conclusions can be made regarding why some areas have higher scores than others. These *blob* scores may also reveal influential factors such as geography, community demographics, or other factors that alter transportation accessibility. Increasing the understanding of train accessibility throughout Boston will help the city achieve its ambitious carbon neutrality goal. 


### Data 

The data used was made available by the Metropolitan Bay Transportation Authority via their [V3 API](https://www.mbta.com/developers/v3-api). 


### Tools 
MBTA subway station data in Boston was analyzed using **R** and displayed through a map made in **GIS** and **Leaflet**. The website with the map was made using **HTML**, **CSS**, **javaScript**.


### Calculation
First, the area of the Voronoi polygon is calculated, each area will be normalized so that the polygon area values are on a scale of 0-100. 

Then, the areas will be ordered from greatest to least in Excel, and they will be normalized using the formula 

`zi = 100 - (xi – min(x)) / (max(x) – min(x)) * 100` 

where zi is the i-th normalized value in the dataset, xi is the i-th value in the dataset, and min(x) and max(x) is the minimum and maximum value in the dataset, respectively.

### Diagram Screenshots

#### First Voronoi Diagram
<img src="https://raw.githubusercontent.com/suobset/iCons2-MoS/main/data/RepoAssets/Screenshot%202022-04-26%20121103.png"></img>

#### Voronoi overlap on Boston's Map
<img src="https://raw.githubusercontent.com/suobset/iCons2-MoS/main/data/RepoAssets/VoronoiFUll.png"></img>

#### Calculated Areas of Each Blob
<img src="https://raw.githubusercontent.com/suobset/iCons2-MoS/main/data/RepoAssets/BlobArea.png"></img>


### Referenced Sources


1. Introducing Voronoi Diagrams: http://cfbrasz.github.io/Voronoi.html
1. JS Source for referral purposes only (scratch): https://github.com/suobset/suobset.github.io
Added some Jargon R as well. 
1. Source: https://www.r-bloggers.com/2021/10/little-useless-useful-r-functions-interactive-voronoi-diagram-generator-using-r-and-x11/
1. BostonGIS: https://www.bostongis.com/?content_name=massgis_data
1. Shapefile manipulation: https://stat.ethz.ch/pipermail/r-sig-geo/2008-September/004247.html
1. Analyze Boston: https://data.boston.gov/
1. Map Inspiration (my iCons 1 Website): https://suobset.github.io/iCons/iCons1-CS2/hydroCost.html
2. Normalization of Data: https://www.statology.org/normalize-data-between-0-and-100/

