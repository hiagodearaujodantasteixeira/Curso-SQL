SELECT *

FROM relatorio_diario;

UPDATE relatorio_diario
SET qtTransacao = 10000
WHERE dtSemana >= '4';

SELECT *

FROM relatorio_diario;