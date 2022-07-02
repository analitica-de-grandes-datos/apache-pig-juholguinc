/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
Data_ = LOAD 'data.tsv' USING PigStorage('\t')
    AS(
        dt1:chararray,
        dt2:chararray,
        dt3:chararray
     );

step1 = FOREACH Data_ GENERATE FLATTEN(TOKENIZE(dt2, ',')) AS dt21, FLATTEN(TOKENIZE(dt3, ',')) AS dt31;
step2 = FOREACH step1 GENERATE REPLACE(dt21, '([^a-zA-Z\\s]+)','') AS dt22, REPLACE(dt31, '([^a-zA-Z\\s]+)','') AS dt32;
step3 = FOREACH step2 GENERATE TOTUPLE(dt22, dt32) AS tupl;
Aggr = GROUP step3 BY tupl;
Cnt_ = FOREACH Aggr GENERATE group, COUNT(step3);
STORE Cnt_ INTO 'output' USING PigStorage(',');
