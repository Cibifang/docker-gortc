## Build

`docker build -t gortc:1.0.0 .`

## Ports

| Port   | Description   |
|--------|---------------|
| 8080   | RTC Port      |
| 2539   | API port      | 

## Run

`docker run --name gortc -v /usr/local/gortc/conf:/usr/local/gortc/conf --rm -p 8080:8080 -p 2539:2539 -d gortc:1.0.0`
