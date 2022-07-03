/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
Data_ = LOAD 'data.csv' USING PigStorage(',')
    AS(
        id:int,
        name:chararray,
        lsname:chararray,
        date:datetime,
        color:chararray,
        number:int
    );

step1 = GROUP Data_ BY GetYear(date);
count_31 = FOREACH step1 GENERATE group, COUNT(Data_31);
STORE count_31 INTO 'output' USING PigStorage(',');