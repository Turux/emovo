function sent=select_sentence(name)
x=name(end-5:end-4);
switch x
case 'b1'
sent='Gli operai si alzano presto';
case 'b2'
sent='I vigili sono muniti di pistola';
case 'b3'
sent='La cascata fa molto rumore';
case 'd1'
sent='sabato sera cosa farà?';
case 'd2'
sent='Porti con te quella cosa?';
case 'l1'
sent='L''autunno prossimo Tony partirà per la Spagna nella prima metà di ottobre';
case 'l2'
sent='Ora prendo la felpa di là ed esco per fare una passeggiata';
case 'l3'
sent='Un attimo dopo si è incamminato ed è inciampato';
case 'l4'
sent='Vorrei il numero telefonico del Signor Bianchi';
otherwise
sent=[];
end


