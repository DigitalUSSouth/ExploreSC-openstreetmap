# OpenStreetMap tile server for ExploreSC
This repository contains a customized docker image of the OpenStreetMap tile server, used for the [ExploreSC](https://github.com/DigitalUSSouth/ExploreSC) mobile app. The map only contains detailed data for South Carolina, but it may be expanded easily to cover a wider area.

## Usage
- Download shapefiles 
```cd osm/openstreetmap-carto-2.41.0 && ./get-shapefiles.sh```
- Build the docker image
```docker build -t exploresc-tileserver:1 . ```
- Run container on port 3000
```docker run -dit --name exploreSCtileserver -p 3000:80 exploresc-tileserver:1```

After starting the container, tiles will be available at http://localhost:3000/osm_tiles/0/0/0.png

## License
BSD 3-clause - ***Note:*** This license covers only the top-level docker code (Dockerfile, scripts at the top level, etc. ). Files/projects under the ```osm``` directory are covered by their own respective licenses. See included licenses in each directory.

