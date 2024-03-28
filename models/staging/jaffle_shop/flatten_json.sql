WITH flatten_json AS (
    SELECT
        -- Generating row numbers as an alternative to auto-increment
        ROW_NUMBER() OVER (ORDER BY NULL) AS id,
        record_content:firstName::string AS firstname,
        record_content:lastName::string AS lastname,
        record_content:gender::string AS gender,
        record_content:age::int AS age,
        CURRENT_TIMESTAMP() AS insert_ts,
        NULL AS record_metadata,
    FROM {{ source('jaffle_shop', 'stg_raw_json') }}
)

SELECT * FROM flatten_json
