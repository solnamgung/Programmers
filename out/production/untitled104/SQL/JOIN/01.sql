
-- 1. Print a list of books and authors by ascending order
	
	SELECT
	        b.BOOK_ID, 
	        a.AUTHOR_NAME,   
	        DATE_FORMAT(b.PUBLISHED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE
	  FROM
	        BOOK b
	 JOIN
	        AUTHOR a
	   ON 
	        a.AUTHOR_ID = b.AUTHOR_ID
	WHERE 
	        b.CATEGORY = '경제'
	ORDER BY 
	        PUBLISHED_DATE ASC ;

-- 2.  extract the data from the animal_outs that doesn't contain id in the animal ins        
	SELECT
           a.ANIMAL_ID, a.NAME
      FROM
           ANIMAL_OUTS a
  LEFT JOIN
            ANIMAL_INS b
         ON
            b.ANIMAL_ID = a.ANIMAL_ID
      WHERE
            b.ANIMAL_ID IS NULL
   ORDER BY
            a.ANIMAL_ID ASC ;


-- 3. extract the data from ANIMAL_INS whose the DATETIME's data valuess are the bigger than animal_outs.
	SELECT 
	            a.ANIMAL_ID, a.NAME
	      FROM
	            ANIMAL_INS a
	      JOIN
	            ANIMAL_OUTS b
	        ON
	            b.ANIMAL_ID = a.ANIMAL_ID
	     WHERE
	            a.DATETIME > b.DATETIME 
	  ORDER BY
	            a.DATETIME ASC;
	            

-- 4.
  SELECT  
               NAME, DATETIME
          FROM
                ANIMAL_INS 
         WHERE
                ANIMAL_ID NOT IN (
                                    SELECT 
                                            ANIMAL_ID
                                      FROM 
                                            ANIMAL_OUTS )
      ORDER BY
               DATETIME ASC 
         LIMIT
                3;
                
       SELECT
                ins.NAME, ins.DATETIME
          FROM
                ANIMAL_INS ins
     LEFT JOIN
                ANIMAL_OUTS outs
             ON
                ins.ANIMAL_ID = outs.ANIMAL_ID
          WHERE
                outs.ANIMAL_ID IS NULL
       ORDER BY
                DATETIME ASC
          LIMIT
                3;             
                
  -- 5. First, extract the intact Male and female from ANIMAL_INS. 
  -- Then check whether the ANIMAL_ID's involved in ANIMAL_OUTS with the same conditions in 'SEX_UPON_INTAKE'
  
       
	     SELECT
	            outs.ANIMAL_ID, outs.ANIMAL_TYPE, outs.NAME
	       FROM
	            ANIMAL_OUTS outs
	  INNER JOIN
	            (
	            SELECT
	                    ANIMAL_ID, SEX_UPON_INTAKE
	              FROM
	                    ANIMAL_INS
	             WHERE
	                    SEX_UPON_INTAKE LIKE 'Intact%'
	            ) T
	         ON
	            outs.ANIMAL_ID = T.ANIMAL_ID
	      WHERE
	            T.SEX_UPON_INTAKE  <> outs.SEX_UPON_OUTCOME ;
            
                
            SELECT
		            outs.ANIMAL_ID, outs.ANIMAL_TYPE, outs.NAME
		      FROM
		            ANIMAL_OUTS outs
		 LEFT JOIN
		            ANIMAL_INS ins
		        ON
		            outs.ANIMAL_ID = ins.ANIMAL_ID
		     WHERE
		            outs.SEX_UPON_OUTCOME <> ins.SEX_UPON_INTAKE;         
	                
            
   -- 6. calculate the sum of the total sales by each product.
   --  Join the tables each other, then extract the price * sales_amount by descending order  of total sales and product code.
      
                 SELECT
	                    p.PRODUCT_CODE, 
	                    SUM(p.PRICE * s.SALES_AMOUNT)  AS TOTAL_PRICE
	              FROM
	                    PRODUCT p
	        INNER JOIN
	                    OFFLINE_SALE s
	                ON
	                    p.PRODUCT_ID = s.PRODUCT_ID
	         GROUP BY
	                  P.PRODUCT_CODE 
	         ORDER BY
	                  TOTAL_PRICE DESC, 
	                  p.PRODUCT_CODE ;
                          
                
  -- 7.calculate the ratio(round from two decimal places) of the number of members who bought products in 2021 
  --   and sorts by ascending order of the date acoording to the year and date.
		 		 
		SELECT * FROM ONLINE_SALE;


        SELECT 
              YEAR(s.SALES_DATE)         AS YEARS,
              MONTH(s.SALES_DATE)        AS MONTHS,
              COUNT(DISTINCT s.USER_ID)  AS PUCHASED_USERS,
              ROUND(COUNT(DISTINCT s.USER_ID) / (select count(*) from user_info where YEAR(joined) = '2021'), 1) 
                                                                                                        PURCHASED_RATIO
         FROM
                ONLINE_SALE s
      INNER JOIN
                USER_INFO o
           ON
                o.USER_ID = s.USER_ID
        WHERE
                YEAR(o.JOINED) = '2021'
     GROUP BY
                YEARS, MONTHS
     ORDER BY
                YEARS, MONTHS;
                
                
 --8. print the result containing order_id, product_id and YN_status
 -- YN_status is to check if IN_DATE should be "출고완료" until 05.01, others should be "출고미정" or "출고대기".
 
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
                
                
                





                
                
                
              