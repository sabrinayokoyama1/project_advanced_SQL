WITH transacoes_ultimos_6m AS (
    SELECT
        A.cliente_id,
        SUM(CASE WHEN LOWER(B.tipo) = 'debito'  THEN B.valor ELSE 0 END) AS total_debitos_6m,
        SUM(CASE WHEN LOWER(B.tipo) = 'credito' THEN B.valor ELSE 0 END) AS total_creditos_6m
    FROM contas AS A
    LEFT JOIN transacoes AS B
        ON B.conta_id = A.conta_id
       AND B.data_transacao >= (CURRENT_DATE - INTERVAL '6' MONTH)
    GROUP BY
        A.cliente_id
),

emprestimos_ativos AS (
    SELECT
        A.cliente_id,
        SUM(A.valor) AS divida_ativa
    FROM emprestimos AS A
    WHERE LOWER(A.status) = 'ativo'
    GROUP BY
        A.cliente_id
),

-- informações gerais e comportamento financeiro recente
features_cliente AS (
    SELECT
        A.cliente_id,
        A.nome,
        A.score_credito,
        A.renda_mensal,
        COALESCE(B.divida_ativa, 0)      AS divida_ativa,
        COALESCE(C.total_debitos_6m, 0)  AS debitos_6m,
        COALESCE(C.total_creditos_6m, 0) AS creditos_6m
    FROM clientes AS A
    LEFT JOIN emprestimos_ativos AS B
        ON B.cliente_id = A.cliente_id
    LEFT JOIN transacoes_ultimos_6m AS C
        ON C.cliente_id = A.cliente_id
)

SELECT
    A.cliente_id,
    A.nome,
    A.score_credito,
    A.renda_mensal,
    A.divida_ativa,
    A.debitos_6m,
    A.creditos_6m,
    ROUND(
          (A.score_credito / 1000.0) * 0.40
        + (A.renda_mensal / 15000.0) * 0.30
        - (A.divida_ativa / 40000.0) * 0.20
        + COALESCE(A.creditos_6m / NULLIF(A.debitos_6m, 0), 0) * 0.10
    , 3) AS risco_cred_score
FROM features_cliente AS A
ORDER BY
    risco_cred_score DESC;
