/*
Pregunta
===========================================================================

Ordene el archivo `data.tsv`  por letra y valor (3ra columna). Escriba el
resultado separado por comas.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

     >>> Escriba el codigo del mapper a partir de este punto <<<
*/
Data_ = LOAD 'data.tsv' USING PigStorage('\t')
    AS(
       f1:chararray,
       f2:chararray,
       f3:int
       );
sort_ = ORDER Data_ BY f1, f3 asc;
STORE sort_ INTO 'output' USING PigStorage(',');