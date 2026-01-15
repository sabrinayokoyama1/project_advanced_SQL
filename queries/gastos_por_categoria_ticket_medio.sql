--- Total de Gastos por categoria e ticket médio por cliente
SELECT 
  c.cliente_id AS id_cliente,
  c.nome,
  SUM(CASE WHEN t.tipo = 'Débito' THEN t.valor ELSE 0 END) AS total_gasto,
  t.categoria AS categoria_gastos,
  AVG(CASE WHEN t.tipo = 'Débito' THEN t.valor ELSE NULL END) AS ticket_medio,
  DATE_TRUNC('month', t.data_transacao) AS mes_ref
FROM clientes c

LEFT JOIN contas ct 
  ON c.cliente_id = ct.cliente_id
  
LEFT JOIN transacoes t 
  ON ct.conta_id = t.conta_id
  
GROUP BY 
  c.cliente_id,
  c.nome,
  t.categoria,
  mes_ref
  
ORDER BY 
  mes_ref,
  total_gasto DESC;
