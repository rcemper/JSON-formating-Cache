<img src="https://community.intersystems.com/sites/default/files/inline/images/archived.gif" width=100></img>
<b>&nbsp;no maintenance or update</b> 

# fast JSON formatting (Caché / Ensemble)
It is dedicated to Caché. All extensions for IRIS have been removed.  
It's also an example for a customized command extension (ZZJSN)
  
### Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.  
Prepare a valid Caché license key to work with meore than 1 user  

### Installation
Clone/git pull the repo into any local directory
```
git clone https://github.com/rcemper/JSON-formating-Cache.git
```
To build and start the container run:
```
$ docker compose up -d && docker compose logs -f
```
To open Caché console:
```
$ docker-compose exec cache ccontrol session cache
USER>   
```
Prepare test data:
```
USER> read js
{"Name":"Li,Robert K.","SSN":"672-92-9664","DOB":"1975-01-12","Home":{"Street":"986 Washington Blvd","City":"Boston","State":"PA","Zip":"95802"},"Office":{"Street":"6012 First Place","City":"Reston","State":"MT","Zip":"77739"},"Spouse":{"Name":"Avery,Zelda H.","SSN":"323-13-7437","DOB":"1943-03-27","Home":{"Street":"196 Main Drive","City":"Youngstown","State":"WY","Zip":"53229"},"Office":{"Street":"4056 Franklin Court","City":"Bensonhurst","State":"IA","Zip":"27688"},"FavoriteColors":["Black"],"Age":77},"Age":45,"Title":"Associate Marketing Manager","Salary":10421}

USER>set jsn={}.%FromJSON(js)
```
Now see it:
```
USER>ZWRITE jsn  
jjsn={"Name":"Li,Robert K.","SSN":"672-92-9664","DOB":"1975-01-12","Home":{"Street":"986 Washington Blvd","City":"Boston","State":"PA","Zip":"95802"},"Office":{"Street":"6012 First Place","City":"Reston","State":"MT","Zip":"77739"},"Spouse":{"Name":"Avery,Zelda H.","SSN":"323-13-7437","DOB":"1943-03-27","Home":{"Street":"196 Main Drive","City":"Youngstown","State":"WY","Zip":"53229"},"Office":{"Street":"4056 Franklin Court","City":"Bensonhurst","State":"IA","Zip":"27688"},"FavoriteColors":["Black"],"Age":77},"Age":45,"Title":"Associate Marketing Manager","Salary":10421}  ; <DYNAMIC OBJECT>
```  
This doesn't look so easy to follow.  
So this is a shorthand to save time and reduce mistyping.

The attached ZZJSN.inc is to be included into your %ZLANGC00.mac
```  
USER>ZZJSN jsn        ; does the Output to Terminal / Device  
{
  "Name":"Li,Robert K.",
  "SSN":"672-92-9664",
  "DOB":"1975-01-12",
  "Home":{
    "Street":"986 Washington Blvd",
    "City":"Boston",
    "State":"PA",
    "Zip":"95802"
  },
  "Office":{
    "Street":"6012 First Place",
    "City":"Reston",
    "State":"MT",
    "Zip":"77739"
  },
  "Spouse":{
    "Name":"Avery,Zelda H.",
    "SSN":"323-13-7437",
    "DOB":"1943-03-27",
    "Home":{
      "Street":"196 Main Drive",
      "City":"Youngstown",
      "State":"WY",
      "Zip":"53229"
    },
    "Office":{
      "Street":"4056 Franklin Court",
      "City":"Bensonhurst",
      "State":"IA",
      "Zip":"27688"
    },
    "FavoriteColors":[
      "Black"
    ],
    "Age":77
  },
  "Age":45,
  "Title":"Associate Marketing Manager",
  "Salary":10421
}
```
__output to stream__

```  
set st=##class(%Stream.GlobalCharacter).%New()
ZZJSN jsn:st      ; write result to Stream
```  
__output to string__

```  
ZZJSN jsn:"BOBBY"  ; writes it to local variable BOBBY
```  

[Article in DC](https://community.intersystems.com/post/fast-json-formatting-cach%C3%A9-ensemble)
