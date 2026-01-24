<img src="https://community.intersystems.com/sites/default/files/inline/images/archived.gif" width=100></img>
<b>&nbsp;no maintenance or update</b> 

# fast JSON formatting (Caché / Ensemble)
It's also an example for a customized command extension (ZZJSN) in Caché & IRIS 
  
This is the Caché version for fast JSON formatting but it also works in IRIS.   
Requires package [ZPretty](https://github.com/isc-at/ZPretty)   
To allow parallel existence in IRIS this is named ZZJSN   

prepare test data:
```
USER> read js
{"Name":"Li,Robert K.","SSN":"672-92-9664","DOB":"1975-01-12","Home":{"Street":"986 Washington Blvd","City":"Boston","State":"PA","Zip":"95802"},"Office":{"Street":"6012 First Place","City":"Reston","State":"MT","Zip":"77739"},"Spouse":{"Name":"Avery,Zelda H.","SSN":"323-13-7437","DOB":"1943-03-27","Home":{"Street":"196 Main Drive","City":"Youngstown","State":"WY","Zip":"53229"},"Office":{"Street":"4056 Franklin Court","City":"Bensonhurst","State":"IA","Zip":"27688"},"FavoriteColors":["Black"],"Age":77},"Age":45,"Title":"Associate Marketing Manager","Salary":10421}

USER>set jsn={}.%FromJSON(js)
```
now see it:
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
