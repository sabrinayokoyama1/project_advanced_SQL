SELECT
    A.categoria,
    COUNT(*) AS qtd_transacoes,
    SUM(A.valor) AS total_receita,
    AVG(A.valor) AS ticket_medio
FROM transacoes A
WHERE A.tipo = 'Credito'
GROUP BY
    A.categoria
ORDER BY
    total_receita DESC;
