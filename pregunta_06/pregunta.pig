/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

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
step1 = FOREACH Data_ GENERATE f3;
step2 = FOREACH step1 GENERATE FLATTEN(TOKENIZE(f3)) AS f31;
step3 = FOREACH step2 GENERATE REPLACE (f31, '([^a-zA-Z\\s]+)','') AS f31;
step4 = GROUP step3 BY f31;
Agr_ = FOREACH step4 GENERATE group, COUNT(step3);
STORE Agr_ INTO 'output' USING PigStorage(',');