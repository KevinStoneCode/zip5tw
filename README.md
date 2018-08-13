# zip5tw

* Ruby version
2.5.1p57

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Next, download the data file( JSON format ) from [政府資料開放平臺](https://data.gov.tw/dataset/5948)
and rename the file to `zip5.txt`, move it to `db/`

seed DB
```
$ rails db:seed
```

## Demo
[Heroku website](https://zip5.herokuapp.com/)

## Todo
* 舊縣市：台北縣，桃園縣，台中縣，台南縣，高雄縣

## License
[MIT License](http://www.opensource.org/licenses/MIT).
