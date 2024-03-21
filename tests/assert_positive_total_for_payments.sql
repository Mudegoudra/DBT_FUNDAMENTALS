-- Refunds have a negative amount, so the total amount should always be >= 0.
-- Therefore return records where this isn't true to make the test fail.
select
    order_id,
    sum(amount) as total_amount
from {{ ref('stg_payments') }}
group by 1
having not(total_amount >= 0)



--dbt Commands

--Execute dbt test to run all generic and singular tests in your project.
--Execute dbt test --select test_type:generic to run only generic tests in your project.
--Execute dbt test --select test_type:singular to run only singular tests in your project.