/* Prepared Statement */ 

/*

Para utilizar la declaración preparada de MySQL, utilice las tres declaraciones siguientes:

PREPARE - preparar una declaración para la ejecución.
EXECUTE- ejecutar una declaración preparada preparada por la PREPAREdeclaración.
DEALLOCATE PREPARE - publicar una declaración preparada.

*/

### Primero, prepare una declaración que devuelva el código de producto y el nombre de un producto especificado por código de producto:
PREPARE stmt1 FROM 
	'SELECT 
   	    productCode, 
            productName 
	FROM products
        WHERE productCode = ?';
        
### En segundo lugar, declare una variable nombrada pc, representa el código de producto y establezca su valor en 'S10_1678':
SET @pc = 'S10_1678'; 

### En tercer lugar, ejecute la declaración preparada:
EXECUTE stmt1 USING @pc;

### Cuarto, asigne a la variable pc otro código de producto:
SET @pc = 'S12_1099';

### En quinto lugar, ejecute la declaración preparada con el nuevo código de producto:
EXECUTE stmt1 USING @pc;

### Finalmente, publique la declaración preparada:
DEALLOCATE PREPARE stmt1;