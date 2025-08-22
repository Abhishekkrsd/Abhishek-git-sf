CREATE OR REPLACE MASKING POLICY customer_phone 
    as (val string) returns string->
CASE WHEN CURRENT_ROLE() in ('ACCOUNT_ADMIN', 'SYSADMIN') THEN val
    ELSE '##-###-###-'||SUBSTRING(val,12,4) 
    END;