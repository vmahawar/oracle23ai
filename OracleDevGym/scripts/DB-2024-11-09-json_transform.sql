PROMPT
PROMPT Choice 1
PROMPT

with orders (jdata) as ( 
      select json ('{
            customerId : 1,
            products : [
            { productId : 1, quantity : 1, unitPrice: 2.71 },
            { productId : 2, quantity : 2, unitPrice: 3.14 }
            ]
      }')
)
select JSON_SERIALIZE(
      JSON_TRANSFORM (
            jdata,
            set '$.products[*].totalPaid' = path '@.quantity * @.unitPrice'
      )
      returning varchar2 pretty
) jdata
from orders;

PROMPT
PROMPT Choice 2
PROMPT

with orders (jdata) as ( 
      select json ('{
            customerId : 1,
            products : [
            { productId : 1, quantity : 1, unitPrice: 2.71 },
            { productId : 2, quantity : 2, unitPrice: 3.14 }
            ]
      }')
)
select JSON_SERIALIZE(
      JSON_TRANSFORM (
            jdata,
            nested path '$.products[*]' (
                  set '$.products[*].totalPaid' = path '@.quantity * @.unitPrice'
      )
      returning varchar2 pretty
) jdata
from orders;

PROMPT
PROMPT Choice 3
PROMPT

with orders (jdata) as ( 
      select json ('{
            customerId : 1,
            products : [
            { productId : 1, quantity : 1, unitPrice: 2.71 },
            { productId : 2, quantity : 2, unitPrice: 3.14 }
            ]
      }')
)
select JSON_SERIALIZE(
      JSON_TRANSFORM (
            jdata,
            nested path '$.products[*]' (
                  set '$.totalPaid' = path '@.quantity' * path '@.unitPrice'
                  )
      )
      returning varchar2 pretty
) jdata
from orders;

PROMPT
PROMPT Choice 4
PROMPT

with orders (jdata) as ( 
      select json ('{
            customerId : 1,
            products : [
            { productId : 1, quantity : 1, unitPrice: 2.71 },
            { productId : 2, quantity : 2, unitPrice: 3.14 }
            ]
      }')
)
select JSON_SERIALIZE(
      JSON_TRANSFORM (
            jdata,
            nested path '$.products[*]' (
                  copy '@.totalPaid' = path '@.quantity * @.unitPrice'
                  )
      )
      returning varchar2 pretty
) jdata
from orders;

PROMPT
PROMPT Choice 5 -- CORRECT
PROMPT

with orders (jdata) as ( 
      select json ('{
            customerId : 1,
            products : [
            { productId : 1, quantity : 1, unitPrice: 2.71 },
            { productId : 2, quantity : 2, unitPrice: 3.14 }
            ]
      }')
)
select JSON_SERIALIZE(
      JSON_TRANSFORM (
            jdata,
            nested path '$.products[*]' (
                  insert '@.totalPaid' = path '@.quantity * @.unitPrice'
                  )
      )
      returning varchar2 pretty
) jdata
from orders;

-- JDATA
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- {
--   "customerId" : 1,
--   "products" :
--   [
--     {
--       "productId" : 1,
--       "quantity" : 1,
--       "unitPrice" : 2.71,
--       "totalPaid" : 2.71
--     },
--     {

-- JDATA
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--       "productId" : 2,
--       "quantity" : 2,
--       "unitPrice" : 3.14,
--       "totalPaid" : 6.28
--     }
--   ]
-- }