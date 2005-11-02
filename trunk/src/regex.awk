BEGIN {
}

/Kunden-Nr.: / {        
	start = index($0,"Kunden-Nr.: ");
        if(start > 0)  {
                nummer = substr($0, start + length("Kunden-Nr.: "), 6);		
       }              	
}

END {
	befehl = "awk 'BEGIN {FS = \";\"} $1 ~ /" nummer "/ {print $3}' /usr/local/share/FaxProcess/Kundenliste";
	print | befehl;
}