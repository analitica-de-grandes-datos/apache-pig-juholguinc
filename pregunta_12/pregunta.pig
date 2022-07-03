Data_ = LOAD 'data.csv' USING PigStorage(',')
    AS(
        id:int,
        name:chararray,
        lsname:chararray,
        date:chararray,
        color:chararray,
        number:int
      );

step1 = FOREACH Data_ GENERATE lsname;
step2 = FILTER step1 BY (lsname MATCHES '.*^[d-kD-K].*');
STORE step2 INTO 'output' USING PigStorage(',');
