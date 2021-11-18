/* MySQL storage engines */

-- Es fundamental comprender las características de cada motor de almacenamiento para poder utilizarlas de forma eficaz y maximizar el rendimiento de sus bases de datos.

### MyISAM
/*
MyISAM amplía el antiguo motor de almacenamiento ISAM. Las tablas MyISAM están optimizadas para compresión y velocidad. Las tablas MyISAM también son portátiles entre plataformas y sistemas operativos.

El tamaño de la tabla MyISAM puede ser de hasta 256 TB, lo cual es enorme. Además, las tablas MyISAM se pueden comprimir en tablas de solo lectura para ahorrar espacios. Al inicio, MySQL comprueba las tablas MyISAM en busca de daños e incluso las repara en caso de errores. Las tablas MyISAM no son seguras para transacciones.

Antes de MySQL versión 5.5, MyISAM es el motor de almacenamiento predeterminado cuando crea una tabla sin especificar el motor de almacenamiento explícitamente. Desde la versión 5.5, MySQL usa InnoDB como motor de almacenamiento predeterminado.
*/

### InnoDB
/*
Las tablas InnoDB soportan plenamente compatible con ACID y transacciones . También son óptimos para el rendimiento. La tabla InnoDB admite claves externas , confirmación, reversión y operaciones de avance. El tamaño de una mesa InnoDB puede ser de hasta 64 TB.

Al igual que MyISAM, las tablas InnoDB son portátiles entre diferentes plataformas y sistemas operativos. MySQL también comprueba y repara las tablas InnoDB, si es necesario, al inicio.
*/

### IR
/*
Una tabla MERGE es una tabla virtual que combina varias tablas MyISAM que tienen una estructura similar a una tabla. El motor de almacenamiento MERGE también se conoce como MRG_MyISAMmotor. La MERGEtabla no tiene sus propios índices; en su lugar, utiliza índices de las tablas de componentes.

Con la tabla MERGE, puede acelerar el rendimiento al  unir varias tablas . MySQL solo le permite realizar operaciones SELECT , DELETE , UPDATE e INSERT en las MERGEtablas. Si usa una DROP TABLEdeclaración en una MERGEtabla, solo MERGEse elimina la especificación. Las tablas subyacentes no se verán afectadas.
*/

### Memoria
/*
Las tablas de memoria se almacenan en memoria y utilizan índices hash para que sean más rápidas que las tablas MyISAM. La vida útil de los datos de las tablas de memoria depende del tiempo de actividad del servidor de la base de datos. El motor de almacenamiento de memoria se conocía anteriormente como HEAP.
*/

### Archivo
/*
El motor de almacenamiento de archivos le permite almacenar una gran cantidad de registros, que con fines de archivo, en un formato comprimido para ahorrar espacio en el disco. El motor de almacenamiento de archivos comprime un registro cuando se inserta y lo descomprime utilizando la biblioteca zlib a medida que se lee.

Las tablas de archivo solo permiten instrucciones INSERT y SELECT . Las ARCHIVEtablas no admiten índices, por lo que se requiere un escaneo completo de la tabla para leer filas.
*/

### CSV
/*
El motor de almacenamiento CSV almacena datos en formato de archivo de valores separados por comas (CSV). Una tabla CSV ofrece una forma conveniente de migrar datos a aplicaciones que no son SQL, como software de hoja de cálculo.

La tabla CSV no admite el tipo de datos NULL. Además, la operación de lectura requiere un escaneo completo de la tabla.
*/

### FEDERADO
/*
El FEDERATEDmotor de almacenamiento le permite administrar datos desde un servidor MySQL remoto sin utilizar la tecnología de clúster o replicación. La tabla federada local no almacena datos. Cuando consulta datos de una tabla federada local, los datos se extraen automáticamente de las tablas federadas remotas.
*/