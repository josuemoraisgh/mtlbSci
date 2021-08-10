mode(1)
//
// Demo of hrtSerialRead.sci
//

halt()   // Press return to continue
 
serial = hrtSerialOpen(3,'19200,n,8,1');
[n,status] = hrtSerialStatus(serial);
if(n(1)>0)then
strFrame=hrtSerialRead(serial,n(1));
end
halt()   // Press return to continue
 
halt()   // Press return to continue
 
//========= E N D === O F === D E M O =========//
