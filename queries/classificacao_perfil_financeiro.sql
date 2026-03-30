WITH resumo_financeiro AS (
    SELECT
        A.cliente_id,
        A.nome,
        A.renda_mensal,
        B.saldo,
        COUNT(C.transacao_id) AS qtd_transacoes,
        SUM(CASE WHEN C.tipo = 'Debito' THEN C.valor ELSE 0 END) AS total_gasto,
        COALESCE(SUM(D.valor), 0) AS total_emprestimos
    FROM clientes AS A
    LEFT JOIN contas AS B
        ON A.cliente_id = B.cliente_id
    LEFT JOIN transacoes AS C
        ON B.conta_id = C.conta_id
    LEFT JOIN emprestimos AS D
        ON A.cliente_id = D.cliente_id
    GROUP BY
        A.cliente_id,
        A.nome,
        A.renda_mensal,
        B.saldo
)

SELECT
    A.nome,
    A.renda_mensal,
    A.total_gasto,
    A.total_emprestimos,
    A.qtd_transacoes,
    A.saldo,
    CASE
        WHEN A.total_gasto > A.renda_mensal THEN 'Gastador' -- Gasta mais do que ganha
        WHEN A.qtd_transacoes <= 2 AND A.saldo > A.renda_mensal THEN 'Conservador' -- Poucas transações e saldo alto
        WHEN A.total_emprestimos >= A.renda_mensal THEN 'Gastador' -- Empréstimos altos em relação à renda
        ELSE 'Equilibrado' -- Comportamento equilibrado
    END AS perfil_financeiro
FROM resumo_financeiro AS A
ORDER BY
    perfil_financeiro;
