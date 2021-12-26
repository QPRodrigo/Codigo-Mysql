/* Character Set */

/*
Un conjunto de caracteres MySQL es un conjunto de caracteres que son legales en una cadena. Por ejemplo, tenemos un alfabeto con las letras de a  a z. Asignamos a cada letra un número, por ejemplo,   a = 1,  b = 2etc. La letra  a  es un símbolo, y el número 1  que se asocia con la letra a  es la codificación. La combinación de todas las letras de la A a la Z y sus codificaciones correspondientes es un conjunto de caracteres.
*/

SHOW CHARACTER SET;

/*
MySQL proporciona la LENGTHfunción para obtener la longitud de una cadena en bytes y la  CHAR_LENGTHfunción para obtener la longitud de una cadena en caracteres. Si una cadena contiene el carácter de varios bytes, el resultado de la  LENGTHfunción es mayor que el resultado de la  CHAR_LENGTH()función. Vea el siguiente ejemplo:
*/

SET @str = CONVERT('MySQL Character Set' USING ucs2);
SELECT LENGTH(@str), CHAR_LENGTH(@str);

-- La CONVERTfunción convierte una cadena en un juego de caracteres específico. En este ejemplo, convierte el juego de caracteres de la MySQL Character Set  cadena en ucs2. Dado ucs2que el juego de caracteres contiene caracteres de 2 bytes, la longitud de la @str  cadena en bytes es mayor que su longitud en caracteres.

-- Tenga en cuenta que algunos conjuntos de caracteres contienen caracteres de varios bytes, pero sus cadenas pueden contener solo caracteres de un solo byte, por ejemplo, utf8  como se muestra en las siguientes declaraciones:

SET @str = CONVERT('MySQL Character Set' USING utf8);
SELECT LENGTH(@str), CHAR_LENGTH(@str);

-- Sin embargo, si una utf8cadena contiene un carácter especial, por ejemplo, ü  en la  pingüino cadena; su longitud en bytes es diferente, vea el siguiente ejemplo:

SET @str = CONVERT('pingüino' USING utf8);
SELECT LENGTH(@str), CHAR_LENGTH(@str);

## Conversión entre diferentes conjuntos de caracteres

-- MySQL proporciona dos funciones que le permiten convertir cadenas entre diferentes conjuntos de caracteres: CONVERTy CAST. Hemos utilizado la CONVERTfunción varias veces en los ejemplos anteriores.

-- La sintaxis de la CONVERTfunción es la siguiente:

CONVERT(expression USING character_set_name)


-- La CASTfunción es similar a la CONVERTfunción. Convierte una cadena en un juego de caracteres diferente:

CAST(string AS character_type CHARACTER SET character_set_name)

-- Eche un vistazo al siguiente ejemplo de uso de la CAST función:

SELECT CAST(_latin1'MySQL character set' AS CHAR CHARACTER SET UTF8);


### Configuración de juegos de caracteres para conexiones de clientes

-- Para configurar un juego de caracteres para una conexión de cliente, puede realizar una de las siguientes formas:

-- Emita la SET NAME  declaración después de que el cliente se conecte al servidor de la base de datos MySQL. Por ejemplo, para establecer un juego de caracteres Unicode utf8, use la siguiente instrucción:

SET NAMES 'utf8';

-- Si la aplicación admite la --default-character-set  opción, puede usarla para configurar el juego de caracteres. Por ejemplo, la herramienta cliente mysql es compatible --default-character-set  y puede configurarla en el archivo de configuración de la siguiente manera:

[mysql]
default-character-set=UTF8


-- Algunos conectores MySQL le permiten configurar el juego de caracteres, por ejemplo, si usa PHP PDO, puede configurar el juego de caracteres en el nombre de la fuente de datos de la siguiente manera:

$dsn ="mysql:host=$host;dbname=$db;charset=utf8";


