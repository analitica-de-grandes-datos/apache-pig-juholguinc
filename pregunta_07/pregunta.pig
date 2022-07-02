/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la
columna 3 separados por coma. La tabla debe estar ordenada por las
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
Data_ = LOAD 'data.tsv' USING PigStorage('\t')
    AS(
        f1:chararray,
        f2:chararray,
        f3:chararray
     );

step1 = FOREACH Data_07 GENERATE f1, TOKENIZE(f2, ',') AS f21, TOKENIZE(f3, ',') AS f31;
step2 = FOREACH step1 GENERATE f1, COUNT(f21) AS f22, COUNT(f31) AS f32;
step3 = ORDER step2 BY f1, f22, f32 asc;
STORE step3 INTO 'output' USING PigStorage(',');