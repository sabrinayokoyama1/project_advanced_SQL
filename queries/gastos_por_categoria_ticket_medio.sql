SELECT
    A.cliente_id AS id_cliente,
    A.nome,
    SUM(CASE WHEN B.tipo = 'Debito' THEN B.valor ELSE 0 END) AS total_gasto,
    B.categoria AS categoria_gastos,
    AVG(CASE WHEN B.tipo = 'Debito' THEN B.valor ELSE NULL END) AS ticket_medio, -- valor médio gasto por transação
    DATE_TRUNC('month', B.data_transacao) AS mes_ref
FROM clientes AS A
LEFT JOIN contas AS C
    ON A.cliente_id = C.cliente_id
LEFT JOIN transacoes AS B
    ON C.conta_id = B.conta_id
GROUP BY
    A.cliente_id,
    A.nome,
    B.categoria,
    DATE_TRUNC('month', B.data_transacao)
ORDER BY
    mes_ref,
    total_gasto DESC;
