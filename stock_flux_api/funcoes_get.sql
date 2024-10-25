create or replace FUNCTION get_medicamentos(
    p_categoria IN VARCHAR2 DEFAULT NULL,
    p_motivo IN VARCHAR2 DEFAULT NULL,
    p_status IN VARCHAR2 DEFAULT NULL,
    p_medicamento IN VARCHAR2 DEFAULT NULL
)
RETURN SYS_REFCURSOR IS
    rc SYS_REFCURSOR;
BEGIN
    OPEN rc FOR
    SELECT c.descricao AS Categoria, mt.descricao AS Motivo, m.nome, m.codigo, m.quantidade_minima, m.localizacao, s.descricao AS Status
    FROM rm93069.medicamentos m
    JOIN rm93069.categorias c ON m.id_categoria = c.id_categoria
    JOIN rm93069.motivos mt ON m.id_motivo = mt.id_motivo
    JOIN rm93069.status_medicamento sm ON m.id_medicamento = sm.id_medicamento
    JOIN rm93069.status s ON sm.id_status = s.id_status
    WHERE (p_categoria IS NULL OR c.descricao = p_categoria)
    AND (p_motivo IS NULL OR mt.descricao = p_motivo)
    AND (p_status IS NULL OR s.descricao = p_status)
    AND (p_medicamento IS NULL OR m.nome = p_medicamento);

    RETURN rc;
END;
/
create or replace FUNCTION get_status(
    p_status IN VARCHAR2 DEFAULT NULL
)
RETURN SYS_REFCURSOR IS
    rc SYS_REFCURSOR;
BEGIN
    OPEN rc FOR
    SELECT id_status, descricao, motivo
    FROM rm93069.status
    WHERE (p_status IS NULL OR descricao = p_status);
    RETURN rc;
END;
/
CREATE OR REPLACE FUNCTION get_fornecedores(
    p_fornecedor_id IN NUMBER DEFAULT NULL
)
RETURN SYS_REFCURSOR IS
    rc SYS_REFCURSOR;
BEGIN
    OPEN rc FOR
    SELECT id_fornecedor, nome, telefone, email
    FROM rm93069.fornecedores
    WHERE (p_fornecedor_id IS NULL OR id_fornecedor = p_fornecedor_id);
    RETURN rc;
END;
/

CREATE OR REPLACE FUNCTION get_materiais(
    p_material_id IN NUMBER DEFAULT NULL,
    p_fornecedor_id IN NUMBER DEFAULT NULL
)
RETURN SYS_REFCURSOR IS
    rc SYS_REFCURSOR;
BEGIN
    OPEN rc FOR
    SELECT id_material, f.nome, descricao
    FROM rm93069.materiais m
    JOIN rm93069.fornecedores f ON m.id_fornecedor = f.id_fornecedor
    WHERE (p_material_id IS NULL OR m.id_material = p_material_id)
    AND (p_fornecedor_id IS NULL OR f.id_fornecedor = p_fornecedor_id);
    RETURN rc;
END;
/
CREATE OR REPLACE FUNCTION get_categorias(
    p_categoria_id IN NUMBER DEFAULT NULL
)
RETURN SYS_REFCURSOR IS
    rc SYS_REFCURSOR;
BEGIN
    OPEN rc FOR
    SELECT id_categoria, descricao
    FROM rm93069.categorias
    WHERE (p_categoria_id IS NULL OR id_categoria = p_categoria_id);
    RETURN rc;
END;
/
CREATE OR REPLACE FUNCTION get_motivos(
    p_motivo_id IN NUMBER DEFAULT NULL
)
RETURN SYS_REFCURSOR IS
    rc SYS_REFCURSOR;
BEGIN
    OPEN rc FOR
    SELECT id_motivo, descricao
    FROM rm93069.motivos
    WHERE (p_motivo_id IS NULL OR id_motivo = p_motivo_id);
    RETURN rc;
END;
/
CREATE OR REPLACE FUNCTION get_cargos(
    p_cargo_id IN NUMBER DEFAULT NULL
)
RETURN SYS_REFCURSOR IS
    rc SYS_REFCURSOR;
BEGIN
    OPEN rc FOR
    SELECT id_cargo, descricao
    FROM rm93069.cargos
    WHERE (p_cargo_id IS NULL OR id_cargo = p_cargo_id);
    RETURN rc;
END;
/
CREATE OR REPLACE FUNCTION get_departamentos(
    p_departamento_id IN NUMBER DEFAULT NULL
)
RETURN SYS_REFCURSOR IS
    rc SYS_REFCURSOR;
BEGIN
    OPEN rc FOR
    SELECT id_departamento, descricao
    FROM rm93069.departamentos
    WHERE (p_departamento_id IS NULL OR id_departamento = p_departamento_id);
    RETURN rc;
END;
/
CREATE OR REPLACE FUNCTION get_estoque(
    p_estoque_id IN NUMBER DEFAULT NULL,
    p_medicamento_id IN NUMBER DEFAULT NULL,
    p_responsavel_id IN NUMBER DEFAULT NULL,
    p_tipo_movimentacao_id IN NUMBER DEFAULT NULL
)
RETURN SYS_REFCURSOR IS
    rc SYS_REFCURSOR;
BEGIN
    OPEN rc FOR
    SELECT id_estoque, m.nome, r.nome, tm.descricao, quantidade, data, motivo
    FROM rm93069.estoque e
    JOIN rm93069.tipo_movimentacoes tm ON e.id_tipo_movimentacao = tm.id_tipo_movimentacao
    JOIN rm93069.responsaveis r ON e.id_responsavel = r.id_responsavel
    JOIN rm93069.medicamentos m ON e.id_medicamento = m.id_medicamento
    WHERE (p_estoque_id IS NULL OR e.id_estoque = p_estoque_id)
    AND (p_medicamento_id IS NULL OR m.id_medicamento = p_medicamento_id)
    AND (p_responsavel_id IS NULL OR r.id_responsavel = p_responsavel_id)
    AND (p_tipo_movimentacao_id IS NULL OR tm.id_tipo_movimentacao = p_tipo_movimentacao_id);
    RETURN rc;
END;
/
CREATE OR REPLACE FUNCTION get_etapas_producao(
    p_etapa_id IN NUMBER DEFAULT NULL
)
RETURN SYS_REFCURSOR IS
    rc SYS_REFCURSOR;
BEGIN
    OPEN rc FOR
    SELECT id_etapa, descricao, prazo_estimado
    FROM rm93069.etapas_producao
    WHERE (p_etapa_id IS NULL OR id_etapa = p_etapa_id);
    RETURN rc;
END;
/
CREATE OR REPLACE FUNCTION get_producao(
    p_producao_id IN NUMBER DEFAULT NULL,
    p_medicamento_id IN NUMBER DEFAULT NULL,
    p_etapa_id IN NUMBER DEFAULT NULL
)
RETURN SYS_REFCURSOR IS
    rc SYS_REFCURSOR;
BEGIN
    OPEN rc FOR
    SELECT id_producao, m.nome, ep.descricao, data_inicio, data_fim_prevista, data_fim_real
    FROM rm93069.producao p
    JOIN rm93069.medicamentos m ON p.id_medicamento = m.id_medicamento
    JOIN rm93069.etapas_producao ep ON p.id_etapa = ep.id_etapa
    WHERE (p_producao_id IS NULL OR p.id_producao = p_producao_id)
    AND (p_medicamento_id IS NULL OR m.id_medicamento = p_medicamento_id)
    AND (p_etapa_id IS NULL OR ep.id_etapa = p_etapa_id);
    RETURN rc;
END;
/
CREATE OR REPLACE FUNCTION get_atrasos_producao(
    p_atraso_id IN NUMBER DEFAULT NULL,
    p_producao_id IN NUMBER DEFAULT NULL,
    p_medicamento_id IN NUMBER DEFAULT NULL,
    p_etapa_id IN NUMBER DEFAULT NULL
)
RETURN SYS_REFCURSOR IS
    rc SYS_REFCURSOR;
BEGIN
    OPEN rc FOR
    SELECT id_atraso, m.nome, ep.descricao, dias_atraso, motivo
    FROM rm93069.atrasos_producao ap
    JOIN rm93069.producao p ON p.id_producao = ap.id_producao
    JOIN rm93069.medicamentos m ON p.id_medicamento = m.id_medicamento
    JOIN rm93069.etapas_producao ep ON p.id_etapa = ep.id_etapa
    WHERE (p_atraso_id IS NULL OR ap.id_atraso = p_atraso_id)
    AND (p_producao_id IS NULL OR p.id_producao = p_producao_id)
    AND (p_medicamento_id IS NULL OR m.id_medicamento = p_medicamento_id)
    AND (p_etapa_id IS NULL OR ep.id_etapa = p_etapa_id);
    RETURN rc;
END;
/
