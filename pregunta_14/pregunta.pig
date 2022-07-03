/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       color 
   FROM 
       u 
   WHERE 
       color NOT LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/
Data_ = LOAD 'data.csv' USING PigStorage(',')
    AS(
        id: int,
        name:chararray,
        lsname:chararray,
        date:chararray,
        color:chararray,
        numer:int
      );

step1 = FOREACH Data_ GENERATE color;
step2 = FILTER step1 BY NOT (color MATCHES '.*^[bB].*');
STORE step2 INTO 'output' USING PigStorage(',');
