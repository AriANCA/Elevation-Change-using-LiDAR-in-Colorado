#Elevation Change using LiDAR in Colorado

# Install packages
install.packages("raster")
install.packages("rgdal")

# Load libraries
library(raster)   
library(rgdal)    

# Set the working directory
wd <- "C:/Users/Ariana Arguello/Desktop/EAGLE/Courses/Introduction to programming/Finalproject/" 
setwd(wd)

# Load DTMs (digital terrain model) into R
DTM_pre <- raster(paste0(wd,"disturb-events-co13/lidar/pre-flood/preDTM3.tif"))
DTM_post <- raster(paste0(wd,"disturb-events-co13/lidar/post-flood/postDTM3.tif"))

# View raster structure
# data collected 26-27 June 2013 
DTM_pre

## class      : RasterLayer 
## dimensions : 2000, 2000, 4e+06  (nrow, ncol, ncell)
## resolution : 1, 1  (x, y)
## extent     : 473000, 475000, 4434000, 4436000  (xmin, xmax, ymin, ymax)
## crs        : +proj=utm +zone=13 +datum=WGS84 +units=m +no_defs 
## source     : preDTM3.tif 
## names      : preDTM3

# data collected on 8 October 2013 
DTM_post

## class      : RasterLayer 
## dimensions : 2000, 2000, 4e+06  (nrow, ncol, ncell)
## resolution : 1, 1  (x, y)
## extent     : 473000, 475000, 4434000, 4436000  (xmin, xmax, ymin, ymax)
## crs        : +proj=utm +zone=13 +datum=WGS84 +units=m +no_defs 
## source     : postDTM3.tif 
## names      : postDTM3

# Create hillshade for DTM_pre & DTM_post

DTM_pre_slope <- terrain(DTM_pre, opt="slope",units = "radians")
DTM_pre_aspect <- terrain(DTM_pre, opt ="aspect", units = "radians")
DTM_pre_hillshade <- hillShade(DTM_pre_slope, DTM_pre_aspect)

DTM_post_slope <- terrain(DTM_post, opt="slope",units = "radians")
DTM_post_aspect <- terrain(DTM_post, opt ="aspect", units = "radians")
DTM_post_hillshade <- hillShade(DTM_post_slope, DTM_post_aspect)

# Split the screen in several panels
#par(mfrow=c(2,2))

# Plot Pre-flood with hillshade
plot(DTM_pre_hillshade,
     col=grey(1:90/100),  # create a color ramp of grey colors for hillshade
     legend=FALSE,         
     main="Four Mile Canyon Creek, Boulder County\nPre-Flood",
     axes=FALSE)           

plot(DTM_pre, 
     axes=FALSE,
     alpha=0.3,   # sets how transparent the object will be (0=transparent, 1=not transparent)
     add=TRUE)  # add=TRUE (or T), add plot to the previous plotting frame

# Plot Post-flood with hillshade
plot(DTM_post_hillshade,
     col=grey(1:90/100),  
     legend=FALSE,
     main="Four Mile Canyon Creek, Boulder County\nPost-Flood",
     axes=FALSE)

plot(DTM_post, 
     axes=FALSE,
     alpha=0.3,
     add=T)

# Digital Elevation Model of Difference (DoD): erosion to be neg, deposition to be positive, therefore post - pre
DoD <- DTM_post-DTM_pre

plot(DoD,
     main="Digital Elevation Model of Difference (DoD)",
     axes=FALSE)

# Histogram of values in DoD
hist(DoD)

# Make the map easier to read
# Color palette for 5 categories
difCol5 = c("#d7191c","#fdae61","#ffffbf","#abd9e9","#2c7bb6")

# Plot hillshade first
plot(DTM_post_hillshade,
     col=grey(1:90/100),  # create a color ramp of grey colors
     legend=FALSE,
     main="Elevation Change Post Flood\nFour Mile Canyon Creek, Boulder County",
     axes=FALSE)

# Add the DoD to it with specified breaks & colors
plot(DoD,
     breaks = c(-5,-1,-0.5,0.5,1,10),
     col= difCol5,
     axes=FALSE,
     alpha=0.3,
     add =T)

