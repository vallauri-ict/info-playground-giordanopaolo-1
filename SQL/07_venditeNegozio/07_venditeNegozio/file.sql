SELECT 'Internet' as Tipo, Data
from venditeinternet
union
select 'Negozio' as Tipo, data
from VenditeNegozio
order by Data desc