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
sent='sabato sera cosa far�?';
case 'd2'
sent='Porti con te quella cosa?';
case 'l1'
sent='L''autunno prossimo Tony partir� per la Spagna nella prima met� di ottobre';
case 'l2'
sent='Ora prendo la felpa di l� ed esco per fare una passeggiata';
case 'l3'
sent='Un attimo dopo si � incamminato ed � inciampato';
case 'l4'
sent='Vorrei il numero telefonico del Signor Bianchi';
otherwise
sent=[];
end


