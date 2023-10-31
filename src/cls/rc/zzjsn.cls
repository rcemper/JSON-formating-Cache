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
	;set line="ZPIPE(%a) new $namespace zn """_$namespace_""" do cmd^Zpipe(%a) quit",rou="%ZLANGC00" new $namespace set $namespace="%sys" merge r=^rMAC(rou,0) for i=1:1 { quit:'$DATA(r(i),str)  set:$p(str,"(")=$p(line,"(") r(i)=line,yes=1 }	if '$GET(yes) {	set r(i)=line,r(0)=i } D ROUTINE^%R(rou_".MAC",.r,.err,"CS",0)
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

}

