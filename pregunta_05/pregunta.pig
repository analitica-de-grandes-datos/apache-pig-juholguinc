/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

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
step1 = FOREACH Data_ GENERATE f2;
step2 = FOREACH step1 GENERATE FLATTEN(TOKENIZE(f2)) AS f21;
step3 = FILTER step2 BY (f21 MATCHES '.*[a-z].*');
step4 = GROUP step3 BY f21;
Agr_ = FOREACH step4 GENERATE group, COUNT(step3);
STORE Agr_ INTO 'output' USING PigStorage(',');