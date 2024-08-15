USE petshop_ecommerce;

SELECT 
    TABLE_NAME, 
    TABLE_COMMENT
FROM 
    INFORMATION_SCHEMA.TABLES
WHERE 
    TABLE_SCHEMA = 'petshop_ecommerce';
    
-- VERIFICACION DE IMPORTACION

SELECT 
    table_name AS `Table`, 
    table_rows AS `Row Count`
FROM 
    information_schema.tables
WHERE 
    table_schema = 'petshop_ecommerce'
ORDER BY 
    table_name DESC;