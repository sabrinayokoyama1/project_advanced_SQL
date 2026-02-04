WITH transacoes_ultimos_6m AS (
    SELECT
        a.cliente_id,
        SUM(CASE WHEN lower(t.tipo) = 'debito'  THEN t.valor ELSE 0 END) AS total_debitos_6m,
        SUM(CASE WHEN lower(t.tipo) = 'credito' THEN t.valor ELSE 0 END) AS total_creditos_6m
    FROM contas a
    LEFT JOIN transacoes t
        ON t.conta_id = a.conta_id
       AND t.data_transacao >= (CURRENT_DATE - INTERVAL '6' month)
    GROUP BY a.cliente_id
),

emprestimos_ativos AS (
    SELECT
        cliente_id,
        SUM(valor) AS divida_ativa
    FROM emprestimos
    WHERE lower(status) = 'ativo'
    GROUP BY cliente_id
),

features_cliente AS (
    SELECT
        c.cliente_id,
        c.nome,
        c.score_credito,
        c.renda_mensal,
        COALESCE(e.divida_ativa, 0)        AS divida_ativa,
        COALESCE(t.total_debitos_6m, 0)    AS debitos_6m,
        COALESCE(t.total_creditos_6m, 0)   AS creditos_6m
    FROM clientes c
	
    LEFT JOIN emprestimos_ativos e ON 
		e.cliente_id = c.cliente_id
		
    LEFT JOIN transacoes_ultimos_6m t ON 
		t.cliente_id = c.cliente_id
)

SELECT
    cliente_id,
    nome,
    score_credito,
    renda_mensal,
    divida_ativa,
    debitos_6m,
    creditos_6m,

    ROUND(
          (score_credito / 1000.0) * 0.40
        + (renda_mensal / 15000.0) * 0.30
        - (divida_ativa / 40000.0) * 0.20
        + COALESCE(creditos_6m / NULLIF(debitos_6m, 0), 0) * 0.10
    , 3) AS risco_cred_score

FROM features_cliente
ORDER BY risco_cred_score DESC;
