# Spatial-Analysis for used to profit business | Hotels and restuarants location in India

Introduction 

Spatial Analysis techniques and tools are used to find out the areas of interest. In this project spatial analysis technique is used to identifying places with more number of hotels in India for new business of food material whole store. Aim of this project is also to identify the pattern and reason behind the location of hotels. 
Data Source
Places in India Data is downloaded from the below source http://download.geofabrik.de/asia/india.html Shape file (gis.osm_pois_free_1.shp) from the downloaded compressed file (“india-latest-free.shp.zip”) is used. 
State polygon data is downloaded from available moodle data. Shape file (crs_state_polygons_india.shp) is used to plot the map of India.
Above mentioned data was in coordinate reference system WGS84 (EPSG: 4326). The coordinate system was changed to India projection i.e. Indian 1975 / UTM zone 47N – EPSG: 24047

Story

As an investor, I wanted to invest in new business in India as it has got highest population. After querying the type of places in India, I came to know that number food places are most. This encouraged me to invest in wholesale store for raw food materials. In order to produce more profit I used spatial Analysis to target the places with high concentration of hotels.		
The below image of choropleth map helps me to understand the states of India which has got the most number of hotels. The states with dark brown have more intensity of hotels. It can be seen that the states like Goa and Karnataka has maximum number of hotels.
 Fig-1 Choropleth Map

As the states in India are vast in area it is important to identify the region with more number of hotels in each state. Point in polygon analysis is used to identify the number of hotels in each state. The point on Choropleth map in below map shows that there are more hotels in eastern coastal areas. These places are mostly attraction of tourist with beaches. Also there are cluster of hotels in north India i.e. in Kashmir which is again a tourist place known for its natural beauty. The Heatmap in Fig 3 shows region where number of hotels are more in particular area and best places to invest for the food material store.
 Fig 2 Point on polygon
 
Fig 3 Heatmap

The below image Fig 4  of web map aids to know the name of the hotels and type such as restaurant, food court, hotels etc.
 
Fig 4 Web map of hotels in India

Need of Tools (PostGIS, QGIS & Leaflet)

I used QGIS to view the shape file of India which contained attribute/information like geographical location, name of states. Also used QGIS to view the location of hotels in form of points using the shape file which consist of attributes such as location details, type of place, and name of place. 
Postgres is used to query the maximum of places by grouping the type of place. Attribute/Information in shape file is imported to Database i.e. Postgres from QGIS. Two different tables are created named “pois_india” and “state_polygons_india” which holds the information about types of places and state boundary of India respectively. The new table named “pois_india_hotels” is created. This table consist the data of food places such as restaurant, hotels, food courts etc and other data like park, pharmacy etc is filtered. New field in table “state_polygons_india” is added which will hold the number of hotels in each state. ST_CONTAINS function is used to create view and populate this column which counts the number of points falling each polygon of state. The null values of points are updated with zero so that the polygon with zero hotels can be seen.
Again, in QGIS this new information are viewed by adding the database tables to QGIS canvas. The Graduated option is used to build choropleth map based on the number of hotels using the “state_polygons_india”.  The choropleth map is classified using number of hotels to understand the states hotels distribution state wise. The information in database table “pois_india_hotels” about the places where hotels are located is added to QGIS canvas on top of choropleth map to know which region of state is densely populated with hotels.
A webmap is created with the available sample code. The sample code is modified to display the hotel points in India. The path of Geojson file is created using the QGIS is given in code to show the points. Three background layer is used to make the map more interactive using the leaflet website.  

Summary
With the help of spatial analysis techniques and tools it is identified that the most of the hotels are situated to eastern coastal region which are tourist attractive points. The State like Goa has most hotels and beaches as it has got more tourists from around the world. Also it is evident that major/metro cities such capital of states has more hotels. After analysis, it can be decided to invest in food material whole supplier business will produce more profit. These regions of the state must be targeted to start the business.


