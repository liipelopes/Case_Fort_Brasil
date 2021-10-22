SELECT 
     p.ID_PESSOA,
     p.NM_PESSOA
FROM d_Pessoa AS P WITH(NOLOCK)
WHERE p.ID_PESSOA NOT IN (  SELECT DISTINCT v.ID_PESSOA FROM f_Vendas AS v
								INNER JOIN d_Tempo AS t WITH(NOLOCK) ON t.ID_TEMPO = v.ID_TEMPO
								WHERE t.DT_REF >= '2020-03-01'
								  AND t.DT_REF <= '2020-03-31'
                          )