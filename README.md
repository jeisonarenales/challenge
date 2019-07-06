## Run project with docker
1. Clone this repo: ```git clone git@github.com:jeison24/challenge.git```
2. Open project folder ```cd challenge```
3. Execute ```docker-compose build```
4. Execute ```docker-compose up```
5. Open a new terminal for execute step 6 and 7
6. Execute ```docker-compose run web rake db:create```
7. Execute ```docker-compose run web rake db:migrate```
8. Now the shortened url API is running in `localhost:3000`

## How to use
1. Create a new shortened url
```curl -X POST http://localhost:3000/url.json -H 'Content-Type: application/json' -d '{"url": "http://www.google.com"}'```
response: ```{
                 "shortened_url": "localhost:3000/4jDZX"
             }```
     
2. Get top 100
```curl -X GET http://localhost:3000/top.json -H 'Content-Type: application/json'```

3. redirect the real url ```curl -X GET http://localhost:3000/4jDZX ```