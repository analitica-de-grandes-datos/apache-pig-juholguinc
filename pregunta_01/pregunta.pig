/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
Data_ = LOAD 'data.tsv' USING PigStorage('\t')
    AS (
        dt1:chararray,
        dt2:chararray,
        dt3:int
    );
Agr = GROUP Data_ BY dt1;
Count_ = FOREACH Agr GENERATE group, COUNT(Data_);
STORE Count_ INTO 'output' USING PigStorage(',');