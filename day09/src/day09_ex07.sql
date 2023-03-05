CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[]) RETURNS numeric AS $$
    DECLARE min_val numeric;
	BEGIN
            SELECT MIN(unnest)
            INTO min_val
            FROM unnest(arr);
            RETURN min_val;
	END;
$$ LANGUAGE plpgsql;