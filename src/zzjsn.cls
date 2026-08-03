Class rc.zzjsn [ Abstract ]
{

ClassMethod AddLine2Rou(line, rou As %String = "%ZLANGC00", err, r) As %Status
{
	new $namespace
	set $namespace="%sys"
	merge r=^rMAC(rou,0)
	for i=1:1 { quit:'$DATA(r(i),str)
		if $p(str,"(")=$p(line,"(") set r(i)=line,yes=1
	}
	if '$GET(yes) {
		set r(i)=line
		set r(0)=i
	}
	D ROUTINE^%R(rou_".MAC",.r,.err,"CS",0)
	quit $$$OK
}

/// do ##class(rc.zzjsn).init()
ClassMethod init() As %Status
{
	set line="ZZJSN(in,out="""") new $namespace zn """_$namespace_""" new res,t,zr set t=$t,zr=$zr set res=$$Do^ZPretty(.in) if (out="""") { write res,! } elseif ($isObject(out) && out.%IsA(""%Stream.Object"")) { do out.Write(res) } else { set @out=res } set $zr=zr if t {} quit"
	do ##class(rc.zzjsn).AddLine2Rou(line)
	quit $$$OK
 /*
ZZJSN(in,out="")  ; produce pretty JSON output for Caché
    new res,t,zr
    set t=$t,zr=$zr
    set res=$$Do^ZPretty(.in)
    if (out="") {
        write res,! 
        } 
    elseif ($isObject(out) && out.%IsA("%Stream.Object")) {
        do out.Write(res) 
     } 
    else {
        set @out=res
        }
    set $zr=zr if t    
    quit
 */
}
ClassMethod demo(jsn = "") As %Status
{
 set test="{'Name':'Li,Robert K.','SSN':'672-92-9664',"_
	"'DOB':'1975-01-12','Home':{'Street':'986 Washington Blvd',"_
	"'City':'Boston','State':'PA','Zip':'95802'},'Office':"_
	"{'Street':'6012 First Place','City':'Reston','State':'MT',"_
	"'Zip':'77739'},'Spouse':{'Name':'Avery,Zelda H.','SSN':"_
	"'323-13-7437','DOB':'1943-03-27','Home':{'Street':"_
	"'196 Main Drive','City':'Youngstown','State':'WY','Zip':"_
	"'53229'},'Office':{'Street':'4056 Franklin Court','City':"_
	"'Bensonhurst','State':'IA','Zip':'27688'},'FavoriteColors':"_
	"['Black'],'Age':77},'Age':45,'Title':'Associate Marketing Manager',"_
	"'Salary':10421}"
 set js=$tr(test,"'","""")
 if jsn="" set jsn={}.%FromJSON(js) write js,!
 ZZJSN jsn	
 quit $$$OK
}
}

