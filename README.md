# Elevation Change using LiDAR in Colorado
Measure Changes in the Terrain Caused by a Flood Using Lidar Data

# Introduction


# Data 
The data to create DTMs to analyze landscape change due to the Colorado floods was downloaded directly from the National Ecological Observatory Network (NEON), however for practical purposes it is located in the data folder. 
The first DTM preDTM3.tif is a model from data collected 26-27 June 2013 and the postDTM3.tif is a model from data collected on 8 October 2013, the units are in meters for both rasters.

# Results and Discussion
Hillshade layers are models created to add visual depth to maps. It represents what the terrain would look like in shadow with the sun at a specific azimuth. The default azimuth for many hillshades is 315 degrees. This model was used in Colflood.R 
The Digital Terrain Model (DTM) shown below was created for the lower Four-Mile Canyon Creek area in Boulder, Colorado using data collected before and after the 2013 floods. These maps show subtle differences in elevation.

![Pre-flood_with_colorhillshade](https://user-images.githubusercontent.com/118282872/231853888-e096d161-cf82-4ee2-9d8a-d944ba4e627e.png)

![Post-flood_with_colorhillshade](https://user-images.githubusercontent.com/118282872/231853875-4f0cafa5-f78a-45cc-8f7b-cae4474256cb.png)

Digital Elevation Model of Difference (DoD)
A DoD is created by subtracting one DTM from the other and shows the change that occurred in a given location over a certain period of time.

![DoD](https://user-images.githubusercontent.com/118282872/231853851-c9f1a386-ddc5-4061-b005-bed98f4de18c.png)

Everything in the yellow shades are close to 0m of elevation change, those areas toward green are up to 10m increase of elevation, and those areas to red and white are a 5m or more decrease in elevation.
It is also possible to see the distribution of values better by viewing a histogram of all values in the DoD raster object. Most of the areas have a very small elevation change.

![histogram](https://user-images.githubusercontent.com/118282872/231853870-68e1521e-2d60-431d-9ce8-e67f985fb4ca.png)

Due to the fact that most areas have a very small elevation change, it is possible to set breaks for where you want to plot the color. The DoD plot above uses a continuous scale to show the gradation between elevation loss and elevation gain.  In the plotting code it is possible to set with the breaks= argument in the plot() function a breaks of -5, -1, -1, -1, -0.5, 0.5, 0.5, 0.5, 1, 10 which will result in 5 categories. In addition, a color can be specified for each of the elevation categories. 
ColorBrewer 2.0 is a great reference for choosing map color palettes and provides the hex codes for specifying map colors.

![DoD_color](https://user-images.githubusercontent.com/118282872/231853858-116975b2-550a-4c0d-a331-e25e86606050.png)

The DoD created with the Four Mile Canyon Creek DTMs is above. Areas in red have a lower elevation after the flood; in other words, they have experienced erosion. Areas in blue have a higher elevation after the flood and have experienced sedimentation.
Below is a cross-section showing the data represented by a DoD. The orange areas are where the earth’s surface is lower than before and the teal areas are where the earth’s surface is higher than before.

![MEC_with_DTMs](https://user-images.githubusercontent.com/118282872/231853871-003d8c33-8256-4b5c-82d6-6fdacc4a213b.png)

Quantifying causes and impacts with these tools allow scientists, urban planners, developers, and homeowners to make informed decisions to prepare for and respond to disturbances.
