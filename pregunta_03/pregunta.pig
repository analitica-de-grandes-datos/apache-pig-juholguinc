/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
Data_ = LOAD 'data.tsv' USING PigStorage('\t')
    AS(
        f1:chararray,
        f2:chararray,
        f3:int
     );
top = FOREACH Data_ GENERATE f3;
sort_ = ORDER top BY f3 asc;
sort_ = LIMIT sort_ 5;
STORE sort_ INTO 'output' USING PigStorage(',');