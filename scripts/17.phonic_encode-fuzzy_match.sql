--Fuzzy_match() - gauges textual similarity b/w two strings
SELECT FUZZY_MATCH(LEVENSHTEIN,'Mohamed Tarik','Mo Tariq') from dual;
--54
--100 denotes a perfect match

--Phonic_encode() - based on pronunciations
SELECT phonic_encode(DOUBLE_METAPHONE,'smith') c1
      ,phonic_encode(DOUBLE_METAPHONE_ALT,'smith') c2 from dual;
--'SM0'  'XMT'

--Phonic_Encode uses Operators Double Metaphone
--Jaro-Winkler, N-Gram, Longest Common Substring and Levenshtein

